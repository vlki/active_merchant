require 'test_helper'

class RemoteMoneybookersTest < Test::Unit::TestCase
  

  def setup
    @gateway = MoneybookersGateway.new(fixtures(:moneybookers))
    
    @amount = 100
    
    @options = { 
      :return_url => 'http://example.com',
      :cancel_return_url => 'http://example.com'
    }
  end

  def test_successful_setup_purchase
    assert response = @gateway.setup_purchase(@amount, @options)
    assert response.success?
    assert !response.params['sid'].blank?
  end

end
