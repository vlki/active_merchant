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


      end
      
      def purchase(money, creditcard, options = {})
        post = {}
        add_invoice(post, options)
        add_creditcard(post, creditcard)        
        add_address(post, creditcard, options)   
        add_customer_data(post, options)
             
        commit('sale', money, post)
      end                       
    
      private                       
      
      def add_customer_data(post, options)
      end

      def add_address(post, creditcard, options)      
      end

      def add_invoice(post, options)
      end
      
      def add_creditcard(post, creditcard)      
      end
      
      def parse(body)
      end     
      
      def commit(action, money, parameters)
      end

      def message_from(response)
      end
      
      def post_data(action, parameters = {})
      end
    end
  end
end

