$(document).ready(function(){
	intialize_custom_selectbox();
	$customUlListing = $('.custom-ul-listing');
	function intialize_custom_selectbox() {
		$customSel = '.custom-selectlist';
		$customSelectboxListing = $($customSel);			
		$customSelectboxListing.find('select').hide();
		$customSelectboxListing.each(function () {
			$content_h = '';
			$final_content_h = '';
			$thisParent = $(this);
			tempCstLstSelectedIndex = $thisParent.find('select option:selected').index();
			$(this).find('select option').each(function () {
				$thisChild = $(this);
				dataClass='';
				if ($thisChild.parents('select').find('option:selected').text() === $thisChild.text()) {
					dataClass = 'selected';
				}
				$content_h += '<li class="' + dataClass + '">';
				dataImage = $thisChild.attr('data-image');
				if (dataImage) {
					$content_h += '<img class="flag" src="' + dataImage + '">';
				}
				$content_h += $thisChild.text() + '</li>';
			});
			$final_content_h = '<div class="select-face"></div>' + '<ul class="custom-ul-listing">' + $content_h + '</ul>';
			$thisParent.prepend($final_content_h);
			$thisParent.find($('.select-face')).html($thisParent.find('li').eq(tempCstLstSelectedIndex).html());
		});
		$('.custom-ul-listing').hide();
	}
	
	$customUlListing.find('li').click(function () {
		$array = 0;
		$this = $(this);            
		$this.parents($customSel).find('li').removeClass('selected');
		$this.addClass('selected');
		$array = $this.parents('ul').find('.selected').index();
		$this.parents($customSel).find('select option').eq($array).prop('selected', true);
		$this.parents($customSel).find($('.select-face')).html($this.html());
		$this.parents($customSel).find(this).parent('ul').hide();
		$this.parents($customSel).removeClass('select-actived');
	});

	$('.select-face').click(function () {
		$this = $(this);
		$this.closest($customSel).find('.custom-ul-listing').toggle(100, 'linear');
		$this.closest($customSel).toggleClass('select-actived');
	});

/* custom cjeck box js for login register page */

	$cust_lbl='label';$cust_chk='checked';$cust_opt_wrp='.custom-opt';$cust_chk_wrp='.custom-chk';	$cust_input_chk="input[type='checkbox']";
	$cust_input_opt="input[type='radio']";
	$($cust_chk_wrp + ' ' + $cust_lbl + ', ' + $cust_opt_wrp + ' ' + $cust_lbl).each(function(){		
		$(this).find('input:checked').parent(this).addClass($cust_chk);		
	});
	$(document).on('change',$cust_input_chk, function (event) {
		$(this).parents('label').toggleClass($cust_chk);
		event.stopImmediatePropagation();
	});
	$(document).on('change',$cust_input_opt, function (event) {				
		$($cust_opt_wrp).find(("input:not(:checked)")).parents($cust_lbl).removeClass($cust_chk);
		$(this).parents($cust_lbl).addClass($cust_chk);
		event.stopImmediatePropagation();
	});
	
/* tabling js for my tokens page */

		$('.nav-tabs > li > a').click(function(event){
		event.preventDefault();//stop browser to take action for clicked anchor
 
		//get displaying tab content jQuery selector
		var active_tab_selector = $('.nav-tabs > li.active > a').attr('href');					
 
		//find actived navigation and remove 'active' css
		var actived_nav = $('.nav-tabs > li.active');
		actived_nav.removeClass('active');
 
		//add 'active' css into clicked navigation
		$(this).parents('li').addClass('active');
 
		//hide displaying tab content
		$(active_tab_selector).removeClass('active');
		$(active_tab_selector).addClass('hide');
 
		//show target tab content
		var target_tab_selector = $(this).attr('href');
		$(target_tab_selector).removeClass('hide');
		$(target_tab_selector).addClass('active');
	     });
	  });
	  
	  /** CUSTOM SELECT BOX JS FOR MY ACCOUNT PADGE **/
	  
	  $(document).ready(function(){
	$(".custom-select-box").append('<span></span>');
	$(".custom-select-box").each(function()
	{
		$(this).find('span').text($(this).find("select option:selected").text());
	});
	$(document).on('change','.custom-select-box select',function(){
		$selected_val=($(this).val());
		$(this).closest('.custom-select-box').find('span').text($(this).closest('.custom-select-box').find("select option:selected").text());
	});
});



	  