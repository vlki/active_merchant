require 'test_helper'

class MoneybookersTest < Test::Unit::TestCase
  def setup
    @gateway = MoneybookersGateway.new(
                 :login => 'login',
                 :secret_word_digest => 'secret_word_digest',
                 :api_password_digest => 'api_password_digest'
               )

    @amount = 100
    
    @options = { 
      :order_id => '1',
      :billing_address => address,
      :description => 'Store Purchase'
    }
  end
  
#  def test_successful_purchase
#    @gateway.expects(:ssl_post).returns(successful_purchase_response)
#
#    assert response = @gateway.purchase(@amount, @credit_card, @options)
#    assert_instance_of
#    assert_success response
#
#    # Replace with authorization number from the successful response
#    assert_equal '', response.authorization
#    assert response.test?
#  end
#
#  def test_unsuccessful_request
#    @gateway.expects(:ssl_post).returns(failed_purchase_response)
#
#    assert response = @gateway.purchase(@amount, @credit_card, @options)
#    assert_failure response
#    assert response.test?
#  end

  def test_successful_setup_of_purchase
    @gateway.expects(:ssl_post).returns(successful_setup_purchase_response)
  end


  private

  def successful_setup_purchase_response
    <<-RESPONSE

    RESPONSE
  end

  # Place raw successful response from gateway here
  def successful_purchase_response

  end
  
  # Place raw failed response from gateway here
  def failed_purchase_response
  end
end
