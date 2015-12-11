$(function () {
	if ($.validator) {
		$.validator.setDefaults({
			onsubmit: true,
			onkeyup: false,
			onfocusout: false,
			ignore: ".val-ignore",
			focusInvalid: false,
			focusCleanup: true,
			showErrors: function(errorMap, errorList) {
				$(this.currentForm).find("div.err").remove();
				
				$.each(errorList, function(i, v) {
					var $input = $(v.element);
					//alert($input.outerHeight());
					//alert($input.innerHeight());
					//alert($input.height());
					//var _margin = $input.outerHeight() / 2;
					var _width = 0;
					var _height = 0;
					var _type = $input.attr("type");
					if (undefined != _type && _type.toLowerCase() == "radio") {
						_width = 220;
						_height = 13;
					}
					var top = $input.position().top - _height;
					var _errorHint = $.trim($input.attr("errorhint"));
					var left = 0;//$input.position().left + _width + ($input.outerWidth() + 15);
					if (0 < _errorHint.length) {
						//left += $.parseJSON(_errorHint).left;
						//alert(left);
					}
					var _msg = $input.attr("errormsg");
					if (undefined === _msg || 0 == _msg.length) {
						_msg = v.message;
					}
					var $errorTip = $("<div class=\"err fl\" style=\"" + _errorHint + "\" >" + _msg + "<i></i></div>");
					$errorTip.click(function(event) {
						event.preventDefault();
						
						$(this).remove();
						
						return false;
					});
					
					var $pdiv = $input.parent("div");
					if (0 < $pdiv.length) {
						$pdiv.parent("div").append($errorTip);
					} else {
						$input.parent("label").parent("div").parent("div").append($errorTip);
					}
				});
		 	},
		 	onfocusin: function( element ) {
		 		var $this = $(element);
		 		$this.parent().find("div.errormsg").remove();
		 	}
		});
	}
});

function confirmDel(id) {
	$(("#" + id)).removeAttr("predel");
	$(("#" + id)).click();
}

jQuery.fn.extend({
	
  bindingsDel: function(callback) {
	  $(this).click(function( event ) {
	    event.preventDefault();
	  	var $this = $(this);
	  	
	  	if ($this.attr("predel")) {
	  		dialog_show({asking:true,noclose:true,message:"是否继续当前操作？",button:{text:'是',link:'javascript:confirmDel("' + $this.attr("id") + '");'},button1:{text:'否',link:'javascript:dialog_hide();'}});
	  	} else {
	  		$.ajax({
				url: ($this.attr("href")),
				type: "DELETE",
				contentType: "application/x-www-form-urlencoded",
				cache: false,
				dataType: "json",
				data: {},
				success: function(result) {
					if("SUCCESS" == result.status) {
						callback($this);
					} else if ("ERROR" == result.status) {
						alert(result.msg);
					} else if ("SESSIONERROR" == result.status) {
						window.location.href = webContext.base + "/login.html";
					}
				},
				error: function($request, textStatus, errorThrown) {
					//alert("textStatus:" + textStatus + ";" + "errorThrown:" + errorThrown);
					alert('网络或系统错误');
				}
		    });
	  	}
		return false;
	});
  }
 
});


