// var ready;
// ready = function() {
	/*-----------------------------------------------------------------------------------

	 	Loader - Loads the ajax content
	 
	-----------------------------------------------------------------------------------*/

	// jQuery(window).load(function($) {	
var ready;
ready = function() {

			function flexInit(el) { 

				/*---------------------------------------------- 
							   F L E X S L I D E R
				------------------------------------------------*/
				if(jQuery().flexslider) { 
					jQuery(el+" .flexslider").flexslider({
						animation: "slide",
						slideshowSpeed: 7000,
						animationDuration: 1000,
						slideshow: false,
						directionNav: false,
						controlNav: true,
						smoothHeight: true,
						touch: true,
						video: true,
						randomize: false
					}); 
				}
				
			}
			flexInit('body');		



		var activeproject = false;	
		jQuery("body").on("click", 'a.load-content', function() {

			var scrolltop = jQuery('header').height() - 1;
			var url = jQuery(this).attr('href');
			
			if (!activeproject) { 
				jQuery( ".ajax-section" ).slideDown(500);
				// jQuery(".owl-carousel").owlCarousel();
				loadcontent(url); 
				
			} else if (activeproject == url) {
				jQuery('html,body').animate({ scrollTop: jQuery( ".ajax-section" ).offset().top-scrolltop}, 700, 'easeOutQuart');
				// jQuery(".owl-carousel").owlCarousel();
			} else {
				var i = 0; // Bug Fix Safari when scrolling + callback 
				jQuery('html,body').animate({ scrollTop: jQuery( ".ajax-section" ).offset().top-scrolltop}, 500, 'easeOutQuart', function() {
					if (i == 0) { // Bug Fix Safari when scrolling + callback 
					var currentheight = jQuery( ".ajax-section" ).height();
					
					jQuery( ".ajax-section" ).css({ 'min-height' : currentheight+'px' });
					jQuery( '.close-project' ).fadeOut(500);
					
					jQuery( "#portfolio-single .project-title" ).animate({ 'top': '-60px'}, 600, 'easeOutQuart');
					jQuery( "#portfolio-single .social-share li" ).animate({ top: '-30px'}, 600, 'easeOutQuart');
					jQuery( "#portfolio-single .entry-media" ).animate({ 'top': '60px'}, 600, 'easeOutQuart');
					jQuery( "#portfolio-single .entry-content" ).animate({ 'top': '60px'}, 600, 'easeOutQuart');
					jQuery( ".ajax-content" ).fadeOut(600, function(){
						// jQuery(".owl-carousel").owlCarousel();
						loadcontent(url);

						// jQuery('body').getScript('galleria/themes/12/galleria.twelve.js');

					});
					} // END i == 0
					i++;
				});
			}
							
			return false;
		});
		
		function loadcontent(url){

			var scrolltop = jQuery('header').height() - 1;
			jQuery( ".ajax-content" ).load( url + ' #portfolio-single', function(response, status) {
				// jQuery('.galleria').galleria(); 

				jQuery( ".ajax-content" ).css({opacity: 1});
				
				if (status == 'success') {
					
					if (!activeproject) { 
						jQuery( ".ajax-section #ajax-loader" ).css({ top: '0'});
						var i = 0; // Bug Fix Safari when scrolling + callback 
						jQuery('html,body').animate({ scrollTop: jQuery( ".ajax-section" ).offset().top-scrolltop}, 700, 'easeOutQuart', function(){
							if (i == 0) { // Bug Fix Safari when scrolling + callback 
							jQuery( ".ajax-section #ajax-loader" ).fadeIn(500).delay(1000).fadeOut(500,function() {
								if(jQuery().fitVids) { jQuery(".ajax-section").fitVids(); }
								portfolioPreviewHide();
								jQuery( ".ajax-content" ).slideDown(700, 'easeOutQuart', function() { flexInit(".ajax-section"); setTimeout(portfolioShow, 400); });
							});
							} // END i ==0
							i++;
						});
					} else {
						jQuery( ".ajax-section #ajax-loader" ).css({ top: '70px'});
						jQuery( ".ajax-section #ajax-loader" ).fadeIn(500).delay(1000).fadeOut(500,function() {
							if(jQuery().fitVids) { jQuery(".ajax-section").fitVids(); }
							portfolioPreviewHide();
							jQuery( ".ajax-content" ).fadeIn(400, 'easeOutQuart', function() { flexInit(".ajax-section"); setTimeout(portfolioShow, 400); 
								jQuery( ".ajax-section" ).animate({ 'min-height' : '0'}, 700, 'easeOutQuart');
							});
						});
					}
					/*if (history.pushState) {
						history.pushState({page:url}, url, url);
					}*/
					activeproject = url;
			
				} // END if status
				
			});
		}
		
		
		jQuery("body").on("click", '.close-project a', function() {
			var url = jQuery(this).attr('href');
			var scrolltop = jQuery('header').height() - 1;
			
			jQuery( '.close-project' ).fadeOut(500);
			jQuery( ".ajax-content" ).animate({ opacity: 0}, 500, function() {
				jQuery( this ).slideUp(700, 'easeOutQuart', function() {  jQuery( ".ajax-content" ).empty(); });
				jQuery( ".ajax-section" ).slideUp(700);
				jQuery('html,body').animate({ scrollTop: jQuery( "#portfolio" ).offset().top-scrolltop}, 700, 'easeOutQuart');
			});
			
			/*if (history.pushState) {
				history.pushState({page:url}, url, url);
			}*/
			activeproject = false;
				
			return false;
		});
		
	// });
};
$(document).ready(ready);
$(document).on('page:load', ready);


	function portfolioPreviewHide(){ 
		
		// Hide Content Areas
		jQuery( "#portfolio-single .project-title" ).css({ 'top': '-60px', opacity: 0 });
		jQuery( "#portfolio-single .social-share li" ).css({ top: '-30px', opacity: 0 });
		jQuery( "#portfolio-single .entry-media" ).css({ 'top': '60px', opacity: 0 });
		jQuery( "#portfolio-single .entry-content" ).css({ 'top': '60px', opacity: 0 });
		jQuery( "#portfolio-single .project-title .single-pagination .next").css({ 'left': '60%', opacity: 0 });
		jQuery( "#portfolio-single .project-title .single-pagination .prev").css({ 'left': '40%', opacity: 0 });
				
	}
		
	function portfolioShow(){
		// jQuery(".owl-carousel").owlCarousel({

		//   navigation : true, // Show next and prev buttons
		//   slideSpeed : 300,
		//   paginationSpeed : 400,
		//   loop: true,
		//   autoplay: true,
		//   dots: false,
		//   navigationText:[
  //           "<i class='fa fa-angle-left fa-2x'></i>",
  //           "<i class='fa fa-angle-right fa-2x'></i>"
	 //      ],
	 //      margin: 10,
  //         video: true,
  //         lazyLoad: true,
  //         center: true,
	 //      videoWidth: 600,
		//   videoHeight: 300,
		//   singleItem: true

		// });	
    jQuery('.owl-carousel').owlCarousel({
        items:1,
        merge:true,
        loop:true,
        margin:10,
        video:true,
        lazyLoad:true,
        center:true,
        responsive:{
            480:{
                items:2
            },
            600:{
                items:4
            }
        }
    })
		// jQuery(".owl-carousel").owlCarousel({

		//      	singleItem: true,
		// 		navigation: false,
		// 		pagination: false,
		// 		slideSpeed : 300,
		// 		paginationSpeed : 400,
		// 		autoPlay: 5000,
		// 		navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']	

		//  });
		//  jQuery(".owl-carousel").owlCarousel({

		// items:1,
  //       loop:true,
  //       autoplay:true,
  //       autoHeight: false,
  //       autoHeightClass: 'owl-height',
  //       dots:false,
  //       nav:true,
  //       navText:[
  //           "<i class='fa fa-angle-left fa-2x'></i>",
  //           "<i class='fa fa-angle-right fa-2x'></i>"
  //       ]

		//  });	
	



		// Show Title
		jQuery( "#portfolio-single .project-title" ).animate({ 'top': '0', opacity: 1 }, 500, 'easeOutQuart');
			
		// Show Social Share
		jQuery( ".social-share li" ).delay(400).each(function(index, element) {
			var delay = index*80;
			jQuery( this ).delay(delay).animate({ 'top': '0', opacity: 1 }, 500, 'easeOutBack');
		});
		
		// Show Slider
		jQuery( ".entry-media" ).delay(600).animate({ 'top': '0', opacity: 1 }, 500, 'easeOutQuart');
		
		// Show Content
		jQuery( ".entry-content" ).delay(1000).animate({ 'top': '0', opacity: 1 }, 500, 'easeOutQuart');
		
		// Show + reposition Next/Prev
		var projectwidth = parseInt(jQuery(".project-title").width()/2);
		var titlewidth = parseInt(jQuery(".project-title .project-name").width()/2);
		var prevposition = projectwidth - titlewidth - 90;
		var nextposition = jQuery(".project-title").width() - prevposition - jQuery('.project-title .single-pagination .next a').width();
		if (jQuery(window).width() < 760) {
			var prevposition = -10;
			var nextposition = 280;
		}
		jQuery('.project-title .single-pagination .next').delay(200).animate({ left: nextposition+'px', opacity: 1}, 600, 'easeOutBack');
		jQuery('.project-title .single-pagination .prev').delay(200).animate({ left: prevposition+'px', opacity: 1}, 600, 'easeOutBack');
		
		// Show Close Icon
		jQuery( ".close-project" ).delay(1200).fadeIn(500);
						
	}


// };
// $(document).ready(ready);
// $(document).on('page:load', ready);
