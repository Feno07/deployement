$(document).on('turbolinks:load', function(){
	var navContainerAdmin = $(".admin-message-list-nav ")
	var navActiveAdmin = navContainerAdmin.find(".item-active");
	var sectionActiveAdmin = $('.section-active');
	var writeAdmin = $(".admin-message-icon-send-container");
	var closeAdmin = $(".admin-send-exit");
	var hamburger = $(".admin-campagne-hamburger-container");
	var optionMenuAdmin = $('.admin-campagne-option');
	var checkBoxChecked = $(".admin-campagne-table-cell input[name='chk[]']");
	var campagneElementHeader = $(".campagne-tri");
	var carrouselHeaderDescription = $('.campagne-description-carrousel');
	var itemScrollCampagneDescription = $('.campagne-description-section-second-first-item .item-title');
	var imageSelected = $('.section-second-photo-container .photo-item');
	var sendImageChecked = null;
	var urlSelected = null;
	var campagneId = $('.modal-body .modal-textarea input:first-child').val();
	var carrouselProfil = $('.campagne-profil-owl');
	var carrouselReleve = $('.campagne-releve-owl');
	var CampagneReleveParticiper = $('.campagne-releve-owl .item');
	var CampageReleveSelect = $('.campagne-releve-section-second-container .campagne-releve-section-second').first().css('display','block')
	var ButtonAddCampagenDisabled = $(".admin-add-campagne-form-submit input").css(
		{
			'pointer-events':'none',
			'background':'#a5a5a5'	
	});

	var NoMoreEmpty = false;

	$('.admin-add-campagne-form-submit input').click(function(){
		if(!isValidEmailAddress($(".admin-add-campagne-form-container input[type='email']"))){
			
		}else{
			$('.admin-add-campagne-form-submit .loader').fadeIn();
			$(this).css('pointer-events','none');
		}
	});

	$(".admin-add-campagne-form-container input").each(function(){
		$(this).change(function(){
			$('.admin-add-campagne-form-container input').each(function(){
				if($(this).val() == ''){
					return NoMoreEmpty = false;
				}else{
					return NoMoreEmpty = true;
				}
			});
			
			if(NoMoreEmpty){
				ButtonAddCampagenDisabled.css({
					'pointer-events':'auto',
					'background':'#3d9288'
				});
			}else{
				ButtonAddCampagenDisabled.css({
					'pointer-events':'none',
					'background':'#a5a5a5'	
				});
			}
		});
	});

	function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
	    return pattern.test(emailAddress);
	}


	var releveSlider = function(cp){
		cp.each(function(){
			$(this).unbind().click(function(){
				var class_select = $(this).attr('class');
				var tab_class = [];
				tab_class.push(class_select.split(' '));
				class_found = tab_class[0][1];
				CampageReleveSelect.hide();
				CampageReleveSelect = $('.campagne-releve-section-second-container .'+class_found).show();
			});
		});
	}

	releveSlider(CampagneReleveParticiper);
	// if($.fn.cloudinary_fileupload !== undefined) {
	// 	$('.cloudinary-fileupload').unsigned_cloudinary_upload("eeul0ekp", 
	// 		  { cloud_name: 'harilanto', tags: 'hasina' }, 
	// 		  { multiple: true }
	// 		).bind('cloudinarydone', function(e, data) {

	// 		  $('.thumbnails').append($.cloudinary.image(data.result.public_id, 
	// 		    { format: 'jpg', width: 150, height: 100, 
	// 		      crop: 'thumb', gravity: 'face', effect: 'saturation:50' } ))}

	// 		).bind('cloudinaryprogress', function(e, data) { 

	// 		  $('.progress_bar').css('width', 
	// 		    Math.round((data.loaded * 100.0) / data.total) + '%'); 

	// 		});
 //    }



 	var carouselProfil = function(carouselProfil){
 		carouselProfil.owlCarousel({
	        center: true,
		    items:4,
		    loop:false,
	    });
 	}
	// define function catchImageSelected
	var catchImageSelected =  function(imageSelected){
		imageSelected.each(function(){
			$(this).unbind().click(function(){
				if(sendImageChecked == null){
					sendImageChecked = $(this);
					sendImageChecked.find('.image-checked').fadeIn();

					$('.campagne-participer-boutton-post').css({
						'background':'#303030'
					});
					$('.campagne-participer-boutton-post').find('button').css({
						'pointer-events':'auto'
					});

					urlSelected = sendImageChecked.find('img').attr('src');
				}else{
					sendImageChecked.find('.image-checked').fadeOut();
					sendImageChecked = $(this);
					sendImageChecked.find('.image-checked').fadeIn();
					$('.campagne-participer-boutton-post').css({
						'background':'#303030'
					});
					$('.campagne-participer-boutton-post').find('button').css({
						'pointer-events':'auto'
					});

					urlSelected = sendImageChecked.find('img').attr('src');
				}

				$('.campagne-participer-boutton-post').find('.post-input input[type="hidden"]:nth-child(2)').attr('value',urlSelected);

			});
		})
	}

	// define function srollDescriptionCampagne
	var srollDescriptionCampagne = function(itemScrollCampagneDescription){
		itemScrollCampagneDescription.each(function(){
			$(this).unbind().click(function(){
				$(this).parent().find('.item-scroll').slideToggle();
			});
		});
	}

	// define function startHeaderCarrousel
	var startHeaderCarrousel = function(carrouselHeaderDescription,number = 1){
		carrouselHeaderDescription.owlCarousel({
		    items:number,
		    lazyLoad:true,
		    loop:true,
		    margin:10
		});
	}


	// define function dropDownSort
	var dropDownSort = function(campagneElementHeader){
		campagneElementHeader.unbind().click(function(){
			$('.campagne-tri-item').slideToggle();
		});
	}

	// define function changeNavActiveAdmin
	var changeNavActiveAdmin = function(navContainerAdmin,sectionActiveAdmin){
		navContainerAdmin.find('li').each(function() {
			$(this).click(function(){
				if(!$(this).hasClass("item-active") && !$(this).hasClass("section-active")){
					var text = $(this).text();
					if(text != 'receptions'){
						$(".admin-message-icon-send-container").css('display','none');
					}else{
						$(".admin-message-icon-send-container").css('display','flex');
					}
					var otherSection = $('.admin-message-list').find('.'+text);
					sectionActiveAdmin.removeClass('section-active');
					sectionActiveAdmin = otherSection.addClass('section-active');
					navActiveAdmin.removeClass('item-active');
					navActiveAdmin = $(this).addClass('item-active');
				}
			})
		});
	} 

	// define function displayPanelMessage
	var displayPanelMessage = function(writeAdmin){
		writeAdmin.click(function(){	
			$('.receptions').find('.admin-send-message-container').fadeIn('slow');
		});
	}

	var ClosePanelMessage = function(closeAdmin){
		closeAdmin.click(function(){	
			$('.receptions').find('.admin-send-message-container').fadeOut('slow');
		});
	}

	var dropOptionAdmin = function(optionMenu){
		optionMenu.unbind().click(function(e){
			$(".admin-campagne-option-item").slideToggle('500','linear');
		});
	}

	var CheckCkeckBox = function(checkBox){
		checkBox.each(function(){
			$(this).unbind().click(function(){
				var checkBoxCheckedLength = $(".admin-campagne-table-cell input[name='chk[]']:checked").length
				if( checkBoxChecked = 1){
					$(".admin-campagne-option-item").fadeIn();
				}else if(checkBoxChecked > 1){
					$(".admin-campagne-option-item").fadeIn();
				}
			});
		});
	}

	
	//Call catchImageSelected function
	catchImageSelected(imageSelected);
	//Call carouselProfil function
	carouselProfil(carrouselProfil)
	carouselProfil(carrouselReleve)


	//Call srollDescriptionCampagne function
	srollDescriptionCampagne(itemScrollCampagneDescription);
	//Call startHeaderCarrousel function
	startHeaderCarrousel(carrouselHeaderDescription);
	//Call dropOptionAdmin function
	dropDownSort(campagneElementHeader);
	//Call dropOptionAdmin function
	CheckCkeckBox(checkBoxChecked);
	//Call dropOptionAdmin function
	dropOptionAdmin(optionMenuAdmin);
	//Call changeNavActiveAdmin function
	changeNavActiveAdmin(navContainerAdmin,sectionActiveAdmin);

	//Call displayPanelMessage function
	displayPanelMessage(writeAdmin);

	//Call ClosePanelMessage function
	ClosePanelMessage(closeAdmin);	
});