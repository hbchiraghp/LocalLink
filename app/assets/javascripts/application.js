// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .

$(function() {
  // date picker 
  $('.datepicker').datepicker();

  // Privew Image
  var avatar = $("#student_avatar");
  if (avatar.length > 0) {
	  avatar[0].addEventListener("change",previewImages,false); //bind the function to the input
	  function previewImages(){
	    var fileList = this.files;    
	    var anyWindow = window.URL || window.webkitURL;
	    var objectUrl = anyWindow.createObjectURL(fileList[0]);    
	    $('#preview-box').html('<img class="profileimg" src="' + objectUrl + '" /> ');
	    //$("#clear").show();
	  }  	
  };
});