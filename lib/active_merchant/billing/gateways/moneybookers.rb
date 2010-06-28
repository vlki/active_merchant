module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class MoneybookersGateway < Gateway

      GATEWAY_URL = 'https://www.moneybookers.com/app/payment.pl'
      API_URL = 'https://www.moneybookers.com/app/query.pl'

      self.supported_countries = ['GB', 'CS']
      self.homepage_url = 'https://www.moneybookers.com/app/help.pl?s=m_shoppingcart'
      self.display_name = 'Moneybookers'

      self.default_currency = 'USD'

      def initialize(options = {})
        requires!(options, :login, :secret_word_digest, :api_password_digest)
        @options = options
        super
      end

      def setup_purchase(money, options = {})
        requires!(options, :return_url, :cancel_return_url)

        params = {
          :language => 'EN',
          :currency => currency(money),
          :prepare_only => '1',
          :detail1_description => 'Test: ',
          :detail1_text => 'Product',
          :amount => amount(money),
          :pay_to_email => '', #@options[:login],
        }.update(options)

        response = ssl_post(GATEWAY_URL, post_data(params))

        if response =~ /^[a-z0-9]{32}$/
          Response.new(true, 'OK', { :sid => response, :data => response } )
        else
          Response.new(false, 'Setup of purchase was not successful', { :sid => nil, :data => response } )
        end
      end

      def redirect_url_for(sid)
        "#{GATEWAY_URL}?sid=#{sid}"
      end

      def details_for(transaction_id)
        # TODO: action status_trn from API manual
      end
    
      private                       
      def parse(body)
        # TODO: parsing response from Automated Payment Interface 
      end     
      
      def commit(action, money, parameters)
        # TODO: commit action to Automated Payment Interface
      end

      def message_from(response)
        # TODO: parse message from API
      end
      
      def post_data(parameters = {})
        parameters.collect { |key, value| "#{key}=#{CGI.escape(value.to_s)}" }.join("&")
      end
    end
  end
end

