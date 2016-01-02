jQuery(document).ready(function(){
	
	$ = jQuery;	
	
	
	var addFocusAndBlur = function($input, $val){
		$input.focus(function(){
			if (this.value == $val) {this.value = '';}
		});
		
		$input.blur(function(){
			if (this.value == '') {this.value = $val;}
		});
	}

	addFocusAndBlur(jQuery('.email'),'Email Address');
	addFocusAndBlur(jQuery('.name'),'Name');
	addFocusAndBlur(jQuery('.url'),'Website');
	addFocusAndBlur(jQuery('.message'),'Comment');
    addFocusAndBlur(jQuery('#comment'),'Comment');

	addFocusAndBlur(jQuery('.comment-email input'),'Email');
	addFocusAndBlur(jQuery('.comment-name input'),'Name');
	addFocusAndBlur(jQuery('.comment-url input'),'Subject');
	addFocusAndBlur(jQuery('.message textarea'),'Message');
	
	
	
	
	//social navigation hover effect for twitter,facebook etc
	$('.social-nav li a').hover(function(){					
		$(this).stop(true, true).animate({backgroundPosition: '0px -43px'},200);
	}, function(){
		$(this).stop(true, true).animate({backgroundPosition: '0px 0px'},300);
	});
	
	
	
	
	if (jQuery.browser.msie && jQuery.browser.version == '7.0' )
		jQuery('body').addClass('ie7');
	if (jQuery.browser.msie && jQuery.browser.version == '8.0' )
		jQuery('body').addClass('ie8');
	if (jQuery.browser.msie && jQuery.browser.version == '8.0' )
		jQuery('body').addClass('ie9');
		
	$('a.full-view-btn').prettyPhoto({
			deeplinking : false,
			counter_separator_label : ' of ',
			gallery_markup : '',
			social_tools : false,
			slideshow : false,
			opacity : 0.60
		});
		
	$('li.full-view a').prettyPhoto({
			deeplinking : false,
			counter_separator_label : ' of ',
			gallery_markup : '',
			social_tools : false,
			slideshow : false,
			opacity : 0.60
		});
	
	$('#slider').cycle({
		fx: 'fade',
		pause: true,
		speed: 2000,
		prev: '.home-slider-prev',
		next: '.home-slider-next',
		after: onAfter
	});
	function onAfter(curr, next, opts, fwd) {
		 var $ht = $(this).height();
		 $(this).parent().animate({height: $ht});
	}
	
	
	$('#test-slider').cycle({
		fx: 'fade',
		pause: true,
		speed: 2000,
        after: onAfter
	});
	
	
	$('.sidebar_slider').cycle({
		fx: 'fade',
		pause: true,
		speed: 500,
        timeout: 6000,
        delay: 5000,
		prev: '.prev-arrow',
		next: '.next-arrow'
	});
	
	function rebind(){
			$('#project-slider').cycle({
				fx: 'scrollHorz',
				speed: 2000,
				prev: '.prev',
				next: '.next',
				after: onAfter
			});
			function onAfter(curr, next, opts, fwd) {
	  		 var $ht = $(this).height();
	  		 $(this).parent().animate({height: $ht});
	  		}
			// disable link
			$('.project-details article h2 a').click(function(e) {
				e.preventDefault();
			});
		}
	
	rebind();
	
	$('.bottom article > div > div:last-child').css('margin-right', '0px');
	//$('#premium-projects div:nth-child(4n)').css('margin-right', '0px');
	$('#sidebar > div:last-child').css('border-bottom', '0px');
	$('#sidebar ul li:last-child').css('border-bottom', '0px');
	$('#social-box ul li:last-child').css('border-bottom', '1px solid #e8e8e8');
	$('#sidebar .subscribe form p:last-child input').addClass('arrow-btn');

  	function item_click(){
	$('.item figure  a, .item h5 a').click(function(e)
	{
			e.preventDefault();	
			var target_url = $(this).attr('href');
			var $loader = $('#project-loader');
			$loader.fadeIn();	
			$('.project-details').slideUp(500);
			$('.project-details').load( target_url + " #umair", function(){
									$loader.fadeOut();
									$(this).slideDown(500);
									rebind();
									close_detail();
									proj_control();
									});
	});
	};
	
	item_click();
	
	function close_detail(){
	$('.close').click(function(e){
		e.preventDefault();
		$(this).parents('.project-details').slideUp(500);
	});
	};

	function isotope_umair(){
	$(function(){
      
      var $container = $('#project-container');

      $container.isotope({
        itemSelector : '.item'
      });
      
      
      var $optionSets = $('.option-set'),
          $optionLinks = $optionSets.find('a');

      $optionLinks.click(function(){
        var $this = $(this);
        // don't proceed if already selected
        if ( $this.hasClass('selected') ) {
          return false;
        }
        var $optionSet = $this.parents('.option-set');
        $optionSet.find('.selected').removeClass('selected');
        $this.addClass('selected');
  
        // make option object dynamically, i.e. { filter: '.my-filter-class' }
        var options = {},
            key = $optionSet.attr('data-option-key'),
            value = $this.attr('data-option-value');
        // parse 'false' as false boolean
        value = value === 'false' ? false : value;
        options[ key ] = value;
        if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
          // changes in layout modes need extra logic
          changeLayoutMode( $this, options )
        } else {
          // otherwise, apply new options
          $container.isotope( options );
        }
        
        return false;
      });
	 
    });
	};
	
	isotope_umair();
	
	function item_ajax(){
	$('.page-next a.btn, .page-prev a.btn').click(function(e)
	{
			e.preventDefault();	
			var target_url = $(this).attr('href');
			var $loader = $('#item-loader');
			$('#item-container').fadeOut('slow');
			$loader.fadeIn();			
			$('#item-container').load( target_url + " #item-container > ul, #item-container > div ", function(){
									$loader.fadeOut();
									$(this).fadeIn('slow');
									item_click();
									isotope_umair();
									item_ajax();								
									});
	});
	};
	
	item_ajax();
	
	function proj_control(){
	$('.proj-prev a, .proj-next a').click(function(e)
	{
			e.preventDefault();	
			var target_url = $(this).attr('href');
			var $loader = $('#project-loader-2');
			$('.project-details > div').fadeOut('slow');
			$loader.fadeIn();			
			$('.project-details').load( target_url + " .project-details > div ", function(){
									$loader.fadeOut();
									$(this).fadeIn('slow');
									//item_click();
									//isotope_umair();
									//item_ajax();
									close_detail();
									proj_control();								
									});
	});
	};
	
	proj_control();
	
	$('.feature-project section article h2 a').click(function(e) {
        e.preventDefault();
    });
	
	$('#content .post-two .post-image').hover(
		function(){
			$(this).children('.overlay').stop(true, true).fadeIn()
		},
		function(){
			$(this).children('.overlay').stop(true, true).fadeOut()
		}
	)
	
	$('a.like').click(function(e){
			e.preventDefault();
			$('.likse_hidden').trigger('click');
	});

	if($('.download-btn').hasClass('unavailable'))
	{
		$('.download-btn').click(function(e){
			e.preventDefault();
			$('#popup').fadeIn();
			$('.close_popup').click(function(e){
					e.preventDefault();
					$('#popup').fadeOut();
			});	
		});
	}
	
	$('form .like').click(function(){
		
			var parent_form = $(this).closest('form');
			
			var options = { 
			        target:        $(this)
			    };
	
			parent_form.ajaxSubmit(options);
			
		});
		
	$('.wp-polls-loading').next('ul').css('display', 'none');
	
	$('#loader').hide();
	
	$('#signupForm').validate();
	
	$('#loginForm').validate();
	
	$('#create_account').click(function(){
			
			$('#loader').show();
			
	});
			
	$('#signupForm').submit(function(e){

		var url = $('#redirect').val();
		
		e.preventDefault();
		
		$.ajax({
			type: 'POST',
			url: $(this).attr('action'),
			data: $(this).serialize(),
			success: function(data, textStatus, XMLHttpRequest){
					$('#loader').hide();
					if(data == 'success')
					{
                        $('#respond').addClass('ok');
                        $('#respond').html('Your password & a confirmation link is sent on your email address entered above.');
                        //window.location = url;
					}
					else
					{
                        $('#respond').html(data);
					}
					//alert(data);													    
			},
			error: function(MLHttpRequest, textStatus, errorThrown){
				alert(errorThrown);
			}
		  });
		
});
	

	/*function submitForm(){
		$('#signupForm').submit(function(e){
	
				var url = $('#redirect').val();
				
				e.preventDefault();
				
				$.ajax({
					type: 'POST',
					url: $(this).attr('action'),
					data: $(this).serialize(),
					success: function(data, textStatus, XMLHttpRequest){
							$('#loader').hide();
							if(data == 'success')
							{
								window.location = url;
							}s
							else
							{
								$('#respond').html(data);
							}
							//alert(data);													    
					},
					error: function(MLHttpRequest, textStatus, errorThrown){
						alert(errorThrown);
					}
				  });
				
		});
	}*/
	
	
	/*
	* Script to Start Download
	*/
	
	var exist;
	exist = $("#download-area #downloadlink").size();
	if(exist == 1)
	{
		var fileLink;
		var timeoutID;
		
		fileLink = $("#downloadlink").attr('href');
		
		if( fileLink.length > 10 )
		{
			timeoutID = window.setTimeout(function(){
												clearTimeout(timeoutID);
												window.location.replace(fileLink);	
											}, 3000);
		}
	
	}
	
});