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
      :return_url => 'http://example.com/return',
      :cancel_return_url => 'http://example.com/cancel',
    }
  end

  def test_successful_setup_of_purchase
    @gateway.expects(:ssl_post).returns(successful_setup_purchase_response)
    assert response = @gateway.setup_purchase(@amount, @options)
    assert response.success?
    assert 'c6efb0b8ca7f8851b9478fb61046a95d', response.params['sid']
  end

  def test_failed_setup_of_purchase
    @gateway.expects(:ssl_post).returns(failed_setup_purchase_response)
    assert response = @gateway.setup_purchase(@amount, @options)
    assert !response.success?
    assert_nil response.params['sid']
  end

  def test_redirect_url
    sid = 'zx5casd4s8a65sd1af9s6156aa46assc'
    return_url = @gateway.redirect_url_for(sid)
    assert_equal 'https://www.moneybookers.com/app/payment.pl?sid=zx5casd4s8a65sd1af9s6156aa46assc', return_url
  end

  private

  def successful_setup_purchase_response
    <<-RESPONSE
c6efb0b8ca7f8851b9478fb61046a95d
    RESPONSE
  end

  def failed_setup_purchase_response
    <<-RESPONSE



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>

<script type="text/javascript">
    function LoaderDispatch ( show, force ) {
        if ( ! force ) return;
        var arr = [ 'loader_back_id', 'loader_popup_id' ];
        for ( var i in arr ) {
            var obj = document.getElementById( arr[i] );
            if ( obj ) obj.style.display = show ? 'block' : 'none';
        }
        return true;
    }
</script>
<noscript></noscript>

<style type="text/css" media="screen">
    html, body { padding:0px !important; margin:0px !important; }
    body { height:100% !important; }

    .loader_cover {
        display:none; z-index:1000;
        position:fixed; _position:absolute;
        top:0px; left:0px; width:100%; height:100%;
    }
    .loader_back {
        display:none; z-index:2000;
        background-color:#fff;
    }
    .loader_popup {
        display:none; z-index:3000;
    }
    .loader_popup_position {
        position:absolute;
        top:0%; left:50%;
        width:0px; height:0px;
    }
    .loader_popup_message {
        position:relative;
        height:100px; width:200px; padding-top:25px;
        top:0px; left:-100px;
        line-height:40px !important;
        color:#bbb; background-color:#fff; text-align:center;
        font:bold 18px Arial,Helvetica,sans-serif;
    }

    #loader_wrapper_id { height: 100%; }
    #loader_clear_id { clear: both; height: 0px; overflow: hidden; }
</style>

<script type="text/javascript">
    document.write('\
<div id="loader_back_id" class="loader_cover loader_back"></div>\
<div id="loader_popup_id" class="loader_cover loader_popup">\
    <div class="loader_popup_position">\
        <div class="loader_popup_message">\
            Please wait ...<br /><img src="/images/loader/gw-loading.gif" alt="" />\
        </div>\
    </div>\
</div>\
    ');
</script>
<noscript></noscript>

<script type="text/javascript"> LoaderDispatch(true,true); </script>
<noscript></noscript>

    <link rel="icon" href="https://www.moneybookers.com/favicon.ico" type="image/vnd.microsoft.icon" />
<link rel="styleSheet" href="https://www.moneybookers.com/css/style_en.css" type="text/css" media="screen">



	<link rel="styleSheet" href="https://www.moneybookers.com/css/onboarding.css" type="text/css" media="screen">
    <link rel="styleSheet" href="https://www.moneybookers.com/css/gw/default/style.css" type="text/css" media="screen" />
	<link rel="styleSheet" href="https://www.moneybookers.com/css/gw/default/btn.css" type="text/css" media="screen" />

    <script type="text/javascript">
function ServerDate() {
    //return server date as javascript Date object
    return new Date(2010, 6 - 1, 28);
}
</script>
<script type="text/javascript" src="https://www.moneybookers.com/main.js"></script>
<script type="text/javascript" src="https://www.moneybookers.com/ourlib.js"></script>
<script type="text/javascript" src="https://www.moneybookers.com/regexp.js"></script>
<script type="text/javascript" src="https://www.moneybookers.com/swfobject.js"></script>    <script type="text/javascript" src="https://www.moneybookers.com/js/jquery.js"></script>

<script type="text/javascript" src="https://www.moneybookers.com/js/jqplugins/qtip/mb.jquery.qtip.min.js"></script>
<script type="text/javascript">

    // define variables that can be used from any script for specific reason
    var hint_anchors = new Array();
</script>





    <script language="Javascript" src="https://www.moneybookers.com/js/gw.js"></script>

































<title>moneybookers.com</title>



 <meta name="Author" content="Moneybookers ltd.">
 <meta name="Publisher" content="Moneybookers ltd.">
 <meta name="Copyright" content="Moneybookers ltd."> <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="robots" content="all,index,follow" />
 <meta name="distribution" content="global" />
 <meta name="rating" content="general" />


	<script>
	 	function getCookie(name){
		var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
	}


		var mbcookie = getCookie("SESSION_ID");
		if (mbcookie==null||mbcookie.length==0||navigator.cookieEnabled==0){
			$(document).ready(function() {
            			$("body").html($("#mbcookie").html());
            		});
		}


	</script>
</head>
<body >

<!-- START: loader -->
<div id="loader_wrapper_id">

    <!-- START: gateway content -->
    <div id="gw_content_wrapper">











<script language="Javascript">
	function get_turing_info() {
		return "<b>What does the Security number mean?</b><br/> The Security number entry during login is used to prevent automated login attacks against your account. A random number, displayed as an image, must be entered correctly in order to continue.";
	}
</script>

<script language="Javascript" src="https://www.moneybookers.com/ourlib.js"></script>
<div id="ourDiv" width="1" style="position:absolute; visibility:hidden; z-index:2;"></div>


<div id="preloader" class="preloader">    <img src="https://www.moneybookers.com/images/default/btn_right_disabled.gif" height="1" width="1" />
    <img src="https://www.moneybookers.com/images/default/btn_right2.gif" height="1" width="1" />
    <img src="https://www.moneybookers.com/images/default/btn_right.gif" height="1" width="1" />
    <img src="https://www.moneybookers.com/images/default/btn_left_disabled.gif" height="1" width="1" />
    <img src="https://www.moneybookers.com/images/default/btn_left2.gif" height="1" width="1" />
    <img src="https://www.moneybookers.com/images/default/btn_left.gif" height="1" width="1" /></div>
<div id="logo_area">	    <div class="logo_spacer"/>
</div>





<form name="changeamount" action="payment.pl">
<div id="payment_info_expanded"  style="display:none" >    <div class="pay_to" title="Payment to " >Payment to </div>		<div class="collapse_area">
			<a href="javascript:more_info(0);" class="collapse" title="For Less Information - Collapse Field"><span class="less_info">Less information</span><strong>For Less Information - Collapse Field</strong></a>
		</div>
</div>
<div id="payment_info_folded" style="">  <div class="pay_to" title="Payment to ">Payment to </div>  <div class="expand_area"><a href="javascript:more_info(1);" class="expand" title="For More Information - Expand Field"><span class="more_info">More information</span><strong>For More Information - Expand Field</strong></a></div>
</div>

</form>

<script language="JavaScript">
    function more_info (show) {
        if ( $("#payment_info_folded") != null && $("#payment_info_expanded") != null) {
            if ( show == 1) {
                $("#payment_info_folded").slideUp('fast',function (){
                   $("#payment_info_expanded").slideDown('slow');
                });
            } else {
                $("#payment_info_expanded").slideUp('slow',function (){
                    $("#payment_info_folded").slideDown('fast');
                });
            }
        }
    }

    var init_rec_amount = '';
    function calculate_total_amount( new_send_amount ){
        var total_amount_rec = getObject('total_amount_rec');
        if ( total_amount_rec != null && typeof(total_amount_rec) != 'undefined' ) {
            var new_total_amount = init_rec_amount*1 + new_send_amount*1;
            lwr(to_money(new_total_amount) + ' ', 'total_amount_rec');
        }
    } </script>















<script language="Javascript">
	function get_turing_info() {
		return "<b>What does the Security number mean?</b><br/> The Security number entry during login is used to prevent automated login attacks against your account. A random number, displayed as an image, must be entered correctly in order to continue.";
	}
</script>

<script language="Javascript" src="https://www.moneybookers.com/ourlib.js"></script>
<div id="ourDiv" width="1" style="position:absolute; visibility:hidden; z-index:2;"></div>

	<h1 class="title" style=>Transaction not allowed  	</h1>	<div class="gateway_content">                <dl>
            <dd>Wrong merchant email address!</dd>
            <dd><div class="separator" id="separator"></div>
<dl class="buttons">    <dd ><button type="button"
		class="submit_btn"
		value="Cancel"			onclick="javascript:window.close()">
<span class="msg">CANCEL</span></button>    </dd></dl>                                              </dd>
        </dl>	</div><div id="mbcookie" style="display:none">	<div class="gateway_content">	<dl>		  <dd>Moneybookers requires cookies to be enabled in order to enjoy full functionality on our services.



In order to pay using Moneybookers, please enable cookies by changing your browserâ€™s Preferences/Options. If you have a third-party cookie manager or option you will have to configure it to allow cookies from Moneybookers in order to pay .</dd>	</dl>
	<dl>
		<dd><div class="separator" id="separator"></div>
<dl class="buttons">    <dd ><button type="button"
		class="submit_btn"
		value="Continue"			onclick="location.replace('https://www.moneybookers.com/app/payment.pl?sid=461621450eae24175abbd3bcb5a899f0');">
<span class="msg">CONTINUE</span></button>    </dd></dl>                                     		</dd>
   	</dl>	</div></div>

<script language="JavaScript">                        repositionHints();//attach hints (if any) to anchors elements



</script>

<!-- basename: payment, template_name: error -->
<script type="text/javascript" src="/js/tracker/init.js">/**/</script>
<script type="text/javascript"> customTracker( { _upage: '/en/payment/error' } ); </script>



</div>
<!-- END: gateway content -->

<!-- END: loader -->
    <div id="loader_clear_id"></div>
</div>

<script type="text/javascript"> setTimeout( function () { LoaderDispatch(false,true); }, 200 ); </script>
<noscript></noscript>

</body>
</html>
    RESPONSE
  end
end
