
(function($) {
	$.validator.addMethod(
		"QQ",
		function(a,b){return this.optional(b)||/^[1-9][0-9]{4,9}$/.test(a)},
		"QQ格式不正确"
	);
	$.validator.addMethod("phoneCN", function(phone_number, element) {
	    phone_number = phone_number.replace(/\s+/g, "");
		return this.optional(element) || /^1[3|4|5|8][0-9]\d{8}$/.test(phone_number);}, 
		"请输入正确的移动电话号码"
	);
	$.validator.addMethod(
		"currency_nozero",
		function(a,b){return this.optional(b)||/^(([1-9]\d*))(\.\d{1,2})?$/.test(a);},
		"金额格式不正确"
	);
	$.validator.addMethod(
		"currency", 
		function(a, b) {
			return this.optional(b) || /^(([1-9]\d*)|0)(\.\d{1,2})?$/.test(a);
		}, 
		"货币格式不正确"
	);
	
	$.validator.addMethod(
			"moreThenTargetValue", 
			function(a, b,c) {
				debugger;
				return this.optional(b) || /^(([1-9]\d*)|0)(\.\d{1,2})?$/.test(a);
			}, 
			"货币格式不正确"
		);
	$.validator.addMethod(
			"lessThenTargetValue", 
			function(a, b,c) {
				debugger;
				return this.optional(b) || /^(([1-9]\d*)|0)(\.\d{1,2})?$/.test(a);
			}, 
			"货币格式不正确"
		);
})(jQuery);

