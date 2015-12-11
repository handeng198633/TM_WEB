$(document).ready(function(){
	 $("ul li.ui-nav-item").mouseover(function(){
		  $(this).find("ul").show();
	  });
	  $("ul li.ui-nav-item").mouseleave(function(){
		  $(this).find("ul").hide();
	  });
	  
	  $("ul li.ui-side-item").click(function(){
		 // $(this).find("ul.ui-side-sub-list").show()
		  if($(this).attr("class").indexOf("active")>0){
			  $(this).removeClass("active");
		  }else{
			  $(this).addClass("active");
		  } 
	  });
//	  $("ul li.ui-side-item").mouseleave(function(){
//		 // $(this).find("ul.ui-side-sub-list").hide()
//		  $(this).removeClass("active"); 花
//	  });
	  //flash
	  var ali=$('#bannerindex li');
	  var aPage=$('#bannerback li');
	  var iNow=0;

	  ali.each(function(index){	
	      $(this).mouseover(function(){
	          slide(index);
	      })
	  });

	  function slide(index){	
	      iNow=index;
	      ali.eq(index).addClass('num').siblings().removeClass();
	  	aPage.eq(index).siblings().stop().fadeOut(600);
	  	aPage.eq(index).stop().fadeIn(600);	
	  }
	  slide(0);
	  function autoRun(){	
	      iNow++;
	  	if(iNow==ali.length){
	  		iNow=0;
	  	}
	  	slide(iNow);
	  }
	  var timer=setInterval(autoRun,5000);
	  	
	  ali.hover(function(){
	  	clearInterval(timer);
	  },function(){
	  	timer=setInterval(autoRun,5000);
	  });
	  
	  /*回到顶部*/
	  // browser window scroll (in pixels) after which the "back to top" link is shown
	 	var offset = 300,
	 		//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
	 		offset_opacity = 1200,
	 		//duration of the top scrolling animation (in ms)
	 		scroll_top_duration = 700,
	 		//grab the "back to top" link
	 		$back_to_top = $('.cd-top');

	 	//hide or show the "back to top" link
	 	$(window).scroll(function(){
	 		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
	 		if( $(this).scrollTop() > offset_opacity ) { 
	 			$back_to_top.addClass('cd-fade-out');
	 		}
	 	});
	 	//www.sucaijiayuan.com
	 	//smooth scroll to top
	 	$back_to_top.on('click', function(event){
	 		event.preventDefault();
	 		$('body,html').animate({
	 			scrollTop: 0 
	 		 	}, scroll_top_duration
	 		);
	 	});
	  //Kill IE 6
	  var ietips='<div id=\"_ietips\" style=\"display:none;background:#000;height:40px;line-height:40px;left:0; opacity:0.80; -moz-opacity:0.80; filter:alpha(opacity=80); position:fixed;bottom:0;width:100%;z-index:999; text-align:center; color:#FFF; font-size:16px;_bottom:auto; _width: 100%; _position: absolute; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)))\">\u5F53\u524D\u6D4F\u89C8\u5668\u7248\u672C\u592A\u4F4E\uFF0C\u60A8\u5C06\u65E0\u6CD5\u5B8C\u7F8E\u4F53\u9A8C\u6211\u4EEC\u7CFB\u7EDF\uFF01\u8bf7\u5347\u7ea7\u60a8\u7684\u6d4f\u89c8\u5668\u6216\u8005\u4f7f\u7528\u0063\u0068\u0072\u006f\u006d\u0065\u6d4f\u89c8\u5668\u6d4f\u89c8</div>';
	  if($.browser.version=="6.0"){$("body").append(ietips);setTimeout('$("#_ietips").fadeIn(2000);',1000);}
}); 
//jquery.fixed.js
(function($) {
    var _options = {};
    jQuery.fn.fiexd = function(options) {
        var id = $(this).attr("id");
        _options[id] = $.extend({}, $.fn.fiexd.defaults, options);
        var obj = $(this);
        
        if (0 == obj.length) {
        	return;
        }
        
        var offsetTop = this.offset().top - parseInt(_options[id].top);
        _scroll($(document).scrollTop() > offsetTop);
        $(window).scroll( function() {
            _scroll($(document).scrollTop() > offsetTop);
        });
        function _scroll(isChange){
            if(isChange){
                if($.browser.msie && ($.browser.version == 6.0)){
                    obj.css({"position":"absolute", "top":$(document).scrollTop()+parseInt(_options[id].top)});
                }else{
                    obj.css({"position":"fixed", "top":_options[id].top});
                }
            }else{
                obj.css({"position":"", "top":""});
            }
        }
    }
    jQuery.fn.fiexd.defaults = {
        top: '0px'
    };
   

})(jQuery);

function toUrl(x) {   
      location.href=x;   
}
function AjaxException(e){
	console.log(e);
	dialog_show({error:true,message:"系统错误，请稍后再试。"});
}
function maskHide(){
	$("#mask-content").html('');
	$("#mask-bg").hide();
	$("#mask-show").hide(function(){
		try{
			if(multiUploadWinClose){
				multiUploadWinClose();
			}
		}catch(e){
			
		}
	});
}
function maskShow(content,width,height){
	var bg = $("#mask-bg");
	var shower = $("#mask-show");
	$("#mask-content").html(content);
	bg.show();
	bg.height($(document).height());
	shower.show(); 
	shower.css("position","absolute"); 
	shower.css("top","25%"); 
	if(width)shower.css("width",width);
	if(height)shower.css("height",height);
	shower.css("top",$(document).scrollTop()+20);
}

function openorder(base, productNo){
	var urlCheck = base+'/profiles/application.html';
	var url = base+'/profiles/submitbusiness.html?productId='+productNo;
	$.ajax({
        async:false,
        type:'GET',
	    contentType:"json", 
        url:urlCheck, 
        success:function(result) {
        	//alert(result);
        	result =  $.parseJSON(result);
        	
        	if (webContext.success == result.status) {
        		window.location=url;
        	} else {
        		dialog_show({
    				asking: true,  
    				noclose:true,
    				message: "\u8ba4\u8bc1\u4e4b\u540e\u624d\u80fd\u8fdb\u884c\u4e1a\u52a1\u7533\u8bf7\uff0c\u662f\u5426\u73b0\u5728\u5c31\u53bb\u8ba4\u8bc1\uff1f", 
    				button: {link: base+'/dealer/identification.html', text: "\u662f"}, 
    				button1: {link: "#", text: "\u5426"}  
    			}); 
        	}
        },
		error:function(){
			alert("网络或系统错误");
		}
    });
}

function numPrueFormat(val){
	var r='';
	if(val<0){
		val=-val;
		r='-';
	}
	var v=Math.round(val*100)/100+'';
	if(v.indexOf('.')==-1){
		v=v+'.00';
	}
	var vs=v.split('.');
	var	c=vs[0].split('');
	var r2=vs[1];
	var r1='';
	var a=0;
	for (var i = c.length-1; i >= 0; i--) {
		if(a==3){
			r1=","+r1;
			a=1;
		}else {
			a=a+1;
		}
		r1=c[i]+r1;
	}
	if(r2.length==1){
		r2=r2+'0';
	}
	return  r+r1+'.'+r2;
} 