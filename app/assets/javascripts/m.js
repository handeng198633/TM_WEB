/* HTML5 Placeholder jQuery Plugin - v2.1.3
 * Copyright (c)2015 Mathias Bynens
 * 2015-09-23
 */
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a("object"==typeof module&&module.exports?require("jquery"):jQuery)}(function(a){function b(b){var c={},d=/^jQuery\d+$/;return a.each(b.attributes,function(a,b){b.specified&&!d.test(b.name)&&(c[b.name]=b.value)}),c}function c(b,c){var d=this,f=a(d);if(d.value===f.attr("placeholder")&&f.hasClass(m.customClass))if(d.value="",f.removeClass(m.customClass),f.data("placeholder-password")){if(f=f.hide().nextAll('input[type="password"]:first').show().attr("id",f.removeAttr("id").data("placeholder-id")),b===!0)return f[0].value=c,c;f.focus()}else d==e()&&d.select()}function d(d){var e,f=this,g=a(f),h=f.id;if(d&&"blur"===d.type){if(g.hasClass(m.customClass))return;if("password"===f.type&&(e=g.prevAll('input[type="text"]:first'),e.length>0&&e.is(":visible")))return}if(""===f.value){if("password"===f.type){if(!g.data("placeholder-textinput")){try{e=g.clone().prop({type:"text"})}catch(i){e=a("<input>").attr(a.extend(b(this),{type:"text"}))}e.removeAttr("name").data({"placeholder-enabled":!0,"placeholder-password":g,"placeholder-id":h}).bind("focus.placeholder",c),g.data({"placeholder-textinput":e,"placeholder-id":h}).before(e)}f.value="",g=g.removeAttr("id").hide().prevAll('input[type="text"]:first').attr("id",g.data("placeholder-id")).show()}else{var j=g.data("placeholder-password");j&&(j[0].value="",g.attr("id",g.data("placeholder-id")).show().nextAll('input[type="password"]:last').hide().removeAttr("id"))}g.addClass(m.customClass),g[0].value=g.attr("placeholder")}else g.removeClass(m.customClass)}function e(){try{return document.activeElement}catch(a){}}var f,g,h="[object OperaMini]"===Object.prototype.toString.call(window.operamini),i="placeholder"in document.createElement("input")&&!h,j="placeholder"in document.createElement("textarea")&&!h,k=a.valHooks,l=a.propHooks,m={};i&&j?(g=a.fn.placeholder=function(){return this},g.input=!0,g.textarea=!0):(g=a.fn.placeholder=function(b){var e={customClass:"placeholder"};return m=a.extend({},e,b),this.filter((i?"textarea":":input")+"[placeholder]").not("."+m.customClass).bind({"focus.placeholder":c,"blur.placeholder":d}).data("placeholder-enabled",!0).trigger("blur.placeholder")},g.input=i,g.textarea=j,f={get:function(b){var c=a(b),d=c.data("placeholder-password");return d?d[0].value:c.data("placeholder-enabled")&&c.hasClass(m.customClass)?"":b.value},set:function(b,f){var g,h,i=a(b);return""!==f&&(g=i.data("placeholder-textinput"),h=i.data("placeholder-password"),g?(c.call(g[0],!0,f)||(b.value=f),g[0].value=f):h&&(c.call(b,!0,f)||(h[0].value=f),b.value=f)),i.data("placeholder-enabled")?(""===f?(b.value=f,b!=e()&&d.call(b)):(i.hasClass(m.customClass)&&c.call(b),b.value=f),i):(b.value=f,i)}},i||(k.input=f,l.value=f),j||(k.textarea=f,l.value=f),a(function(){a(document).delegate("form","submit.placeholder",function(){var b=a("."+m.customClass,this).each(function(){c.call(this,!0,"")});setTimeout(function(){b.each(d)},10)})}),a(window).bind("beforeunload.placeholder",function(){a("."+m.customClass).each(function(){this.value=""})}))});

$(function(){
    $('input, textarea').placeholder();
    $('.nav .menu .menu-drop .close').click(function(){
        $('.nav .menu .menu-drop').stop().fadeOut();
        return false;
    })
    $('.nav .menu .drop-btn').click(function(){
        var that=$('.nav .menu .menu-drop');
        var top=0;
        that.stop().effect('slide',{direction:'up'},function(){
            top=parseInt(that.css('top'));
            var t=70
            that.animate({top:top-10},t,function(){
                that.animate({top:top},t,function(){
                    that.animate({top:top-5},t,function(){
                        that.animate({top:top},t,function(){

                        });
                    });
                });
            });

        });

        return false;
    })
    $('.function-page .box3 .btns .btn').hover(function(){
        $(this).find('p').show();
    },function(){
        $(this).find('p').hide();
    })





    if($('.home-box2').length>0){
        $('.home-box2 .block1').hover(function(){


            $(this).find('.i').css({
                top:-106,left:198
            }).stop().animate({
                top:46,left:57
            })
        },function(){});

        $('.home-box2 .block2').hover(function(){
            $(this).find('.i').effect('puff',function(){
                $(this).show();
            });
        },function(){});

        $('.home-box2 .block3').hover(function(){
            $(this).find('.i').effect('shake');
        },function(){});

        window.homeBanner=new NSBanner($('.home-banner'));
        window.homeBanner2=new NSBanner2($('.home-banner2'));
    }

    if($('.company-main-body-menu').length>0){

            $('.company-main-body-menu .item-no').click(function(){
                return false;
            })
            $('.company-main-body-menu .item').hover(function(){
                if($(this).hasClass('item-no')){return;}
                $(this).data('hasFire',$(this).hasClass('fire'))
                    //.stop().animate({
                    .css({
                        backgroundColor:'#229cfa',
                        color:'#ffffff'
                    },function(){
                        $(this).addClass('fire');
                    })


            },function(){
                if($(this).hasClass('item-no')){return;}
                if(!$(this).data('hasFire')){
                    $(this).removeClass('fire');
                    $(this)
                        //.stop().animate({
                        .css({
                            backgroundColor:'#ffffff',
                            color:'#000000'
                        },function(){

                        })
                }

            })

        if($('.company-main-body-menu .item-dd.fire').length==0){
            $('.company-main-body-menu .item-d').hide();
        }

        if($('.company-main-body-menu .item-c.fire').length==0){
            $('.company-main-body-menu .item-c').hide();
        }
        $('.company-main-body-menu .item-f').click(function(){
            $('.company-main-body-menu .item-c').toggle();
            return false;
        })

    }
    if($('.company-main-body-box-person-info').length>0){
        $('.company-main-body-box-person-info .form-line').each(function(){
            var w=$(this).find('label').width()+20;

            $(this).find('label').css({'position':'absolute','width':w,'display':'block'});
            $(this).find('input').css({'padding-left':w,'width':313-10-w});
            $(this).find('.inner').css({'padding-left':w}).show();

        })

        $('.company-main-body-box-person-info .btn-blue').click(function(){
            $('.company-main-body-box-person-info .inner').hide();
            $('.company-main-body-box-person-info input').show();
            return false;
        })
        $('.company-main-body-box-person-info .btn-red').click(function(){

            $('.company-main-body-box-person-info .form-line').each(function(){
                $(this).find('.inner').text($(this).find('input').val()).show();
                $(this).find('input').hide();

            })
            return false;
        })
    }
 
    $('.show-table').each(function(){
       $(this).find('tr').each(function(){
           $(this).find('td').first().addClass('td-l');
           $(this).find('td').last().addClass('td-r');
       }).hover(function(){
           $(this).addClass('fire');
       },function(){
           $(this).removeClass('fire');
       });
        $(this).find('tbody tr:odd').addClass('odd');
    });
    $('.dialog-div .close,.dialog-div .close2').click(function(){
        $(this).closest('.dialog-div').stop().fadeOut();
        return false;
    })
    $('.radio-btns .btn').click(function(){
        $(this).parent().find('.btn-fire').removeClass('btn-fire');
        $(this).addClass('btn-fire');
        return false;
    })

    if($('.up2top').length>0){
        $('.up2top').click(function(){
            $(window).scrollTop(0);
            return false;
        });
        var isShow=false;
        $(window).scroll(function(){
            if($(window).scrollTop()==0){
                if(isShow){
                    $('.up2top').stop().fadeOut();
                    isShow=false;
                }
            }else{
                if(!isShow){
                    $('.up2top').stop().fadeIn();
                    isShow=true;
                }
            }
        })
    }
    if($('.edit-a-secret-box').length>0){
        $('.edit-a-secret-box').click(function(){
            var span=$(this).parent().parent().find('.b2');
            if(span.find('input').length>0){return false;}

            var input=$('<input />');
            input.blur(function(){
               var t=$(this).val();
                $(this).parent().text(t);
            });
            input.val(span.text());
            span.html(input);
            input.focus();
            return false;
        })
    }
    if($('.selectNS').length>0){
        $('.selectNS').each(function(){
            initSelectNS(this);
        })
    }
    /*$('.template-btn').each(function(){
        $(this).click(function(){
            var obj=$(this).parent().children('.template-div').clone();
            obj.find('.remove-btn').click(function(){
                $(this).closest('.template-div').remove();
                return false;
            })
            obj.find('.selectNS').each(function(){
                initSelectNS(this);
            })
            $(this).parent().find('.template-body').append(obj);
            return false;
        })

    });*/

    $('input[type=radio]').each(function(){
        if($(this).parent()[0].tagName=='LABEL'){
            initRadioNS($(this).parent());
        }
    })



})
function initRadioNS(that){
    function showStatus(that){
        if($(that).prop('checked')){
            $(that).parent().addClass('radio-wp-fire');
       
        }else{
            $(that).parent().removeClass('radio-wp-fire');
        }
    }
    
    $(that).addClass('radio-wp').click(function(event){
    	var $radioWp = $(this);
    	if ($radioWp.attr("done")) {
    		$radioWp.removeAttr("done");
    	
    		event.stopPropagation();
    		return false;
    	} else {
    		var $radioBox = $(this).parent("div");
            var $radio = $radioWp.find('input[type=radio]');
            $radio.attr("mark", true);
            
            $('input[type=radio]', $radioBox).each(function(){
            	var $this = $(this);
            	
                if ($this.attr("mark")) {
                	$this.prop('checked',true);
                	showStatus($this);
                	$this.removeAttr("mark");
                	$radioWp.attr("done", true);
                	$this.click();
                } else {
                	$this.prop('checked', false);
                	showStatus($this);
                }
            });
            
  
    		event.stopPropagation();
    		return false;
    	}

    });
    $(that).find('input[type=radio]').each(function(){
        showStatus(this);
    });

}
function initSelectNS(that, callback){
    if($(that).parent().hasClass('select-wp')){
        var select=$(that).clone();
        $(that).parent().after(select);
        $(that).parent().remove();
        
        if (callback) {initSelectNS(select, callback);} else {initSelectNS(select);}
        return;
    }
    $(that).wrap("<div class='select-wp'></div>");
    var wp=$(that).parent();
    if($(that).hasClass('selectMini')){
        wp.addClass('select-mini');
    }
    if($(that).hasClass('fl')){
        wp.addClass('fl');
    }
    wp.append('<span></span>');

    var select=$(that);
    var span=wp.find('span');
    span.html(select.find("option:selected").text());
    select.bind("change", function(){
        span.html(select.find("option:selected").text());
    });
    if (callback) {
    	select.bind("change", callback);
    }
    
    wp.append('<div class="select-item box-b"></div>');
    $(that).find('option').each(function(){
        var a=$("<a href='#'></a>");
        a.text($(this).text());
        a.data('val',$(this).attr('value'));
        a.data('code',$(this).attr('code'));
        wp.find('.select-item').append(a);
        a.click(function(){
            var val=$(this).data('val');
            wp.find('select').val(val);
            var select=$(this)
            span.html($(this).html());
            wp.find('.select-item,.select-item-bg').hide();
         
            wp.find('select').change();
     
            return false;
        })
    });
    wp.append('<div class="select-item-bg"></div>');
    wp.click(function(){
        wp.find('.select-item,.select-item-bg').show();
    })
    wp.find('.select-item-bg').click(function(){

        wp.find('.select-item,.select-item-bg').hide();
        return false;
    })



    select.hide();

}
function alertShow(arg){
    var t=new Date();
    var cls="alert_"+ t.getTime();
    var html=$('<div class="dialog-div dialog-mini dialog-upload-form-check '+cls+'">' +
    (arg.hasBg?'<div class="bg"></div>':'')+
    '<div class="body box-b">' +
    '<div class="tips" style="background-image: url(inc/img/'+arg.status+'.png)"></div>' +
    '<div class="btns"></div>' +
    '</div></div>');
    html.find('.tips').text(arg.text);

    for(var i in arg.btns){
        var a=$('<a href="#" data-i="'+i+'">'+arg.btns[i].txt+'</a>')
        a.click(function(){
            arg.btns[$(this).data('i')].callback();
            $('.'+cls).hide();
            return false;
        })
        html.find('.btns').append(a);
    }

    $('body').append(html);
    loadDialog(cls);



}
function loadDialog(c){
    var dialog=$('.'+c);

    $('.'+c+' .bg').height($(window).height()>$('body').height()?$(window).height():$('body').height());
    dialog.show();
    if(dialog.hasClass('dialog-mini')){
        dialog.find('.body').css({'margin-top':0-dialog.find('.body').height()});
    }else{
        if($(window).scrollTop()+20+dialog.find('.body').height()>$('body').height()){

            dialog.find('.body').css({'top':$('body').height()-dialog.find('.body').height()-200});

        }else{
            dialog.find('.body').css({'top':$(window).scrollTop()+20});
        }
    }

    dialog.hide();

    dialog.stop().fadeIn(function(){
        $('.'+c+' .bg').height($(window).height()>$('body').height()?$(window).height():$('body').height());
    });

}




function NSBanner(obj) {
    this.obj = obj;

    this.init=function(){
        this.isHomeMainBanner = true;

        this.showI = 0;

        that = this;
        $(window).resize(function () {
            that.resize();
        });

        this.obj.find('.btns .btn').click(function () {
            var that=homeBanner;
            that.showI = $(this).data('i');
            that.show();
            return false;
        })


    }

    this.resize = function () {
        this.w = $(window).width();
        this.obj.find('.banner-wp').width(this.w * this.obj.find('.slide').length+10);
        this.obj.find('.slide').width(this.w);
        this.show();
    }
    this.show = function () {

        that = this;

        $('.home-banner-txt').hide();

        var tmpI = this.showI;

        $('.banner-wp', this.obj).stop().animate({left: 0 - this.showI * this.w}, function () {
            $('.home-banner-txt' + (tmpI + 1)).stop().fadeIn();
        });
        this.obj.find('.btn-fire').removeClass('btn-fire');
        this.obj.find('.btn').eq(this.showI).addClass('btn-fire');


    }
    this.next = function () {

        that = this;
        that.showI++;
        if (that.showI >= that.obj.find('.slide').length) {
            that.showI = 0;
        }
        that.show();
    }
    this.init();
    this.resize();

    setInterval("homeBanner.next();", 5000);

}



function NSBanner2(obj) {
    this.obj = obj;

    this.init=function(){
        this.isHomeMainBanner = this.obj.hasClass('home-banner');

        this.showI = 0;

        that = this;
        $(window).resize(function () {
            that.resize();
        });



        this.obj.find('.btns .l-btn').click(function () {
            var that=homeBanner2;
            that.showI--;
            if (that.showI < 0) {
                that.showI = that.obj.find('.slide').length - 1;
            }
            that.show();
            return false;
        });
        this.obj.find('.btns .r-btn').click(function () {
            var that=homeBanner2;
            that.showI++;
            if (that.showI >= that.obj.find('.slide').length) {
                that.showI = 0;
            }
            that.show();
            return false;
        });
    }

    this.resize = function () {
        this.w = $(window).width();
        this.obj.find('.banner-wp').width(this.w * this.obj.find('.slide').length);
        this.obj.find('.slide').width(this.w);
        this.show();
    }
    this.show = function () {

        that = this;


        if (this.isHomeMainBanner) {
            $('.home-banner-txt').hide();

        }
        var tmpI = this.showI;
        // console.log($('.banner-wp', this.obj)[0]);
        $('.banner-wp', this.obj).stop().animate({left: 0 - this.showI * this.w}, function () {

            if (that.isHomeMainBanner) {
                $('.home-banner-txt' + (tmpI + 1)).stop().fadeIn();
            }
        });
        this.obj.find('.btn-fire').removeClass('btn-fire');
        this.obj.find('.btn').eq(this.showI).addClass('btn-fire');


    }
    this.next = function () {

        that = this;
        that.showI++;
        if (that.showI >= that.obj.find('.slide').length) {
            that.showI = 0;
        }
        that.show();
    }
    this.init();
    this.resize();

    setInterval("homeBanner2.next();", 13000);

}