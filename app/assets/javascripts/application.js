// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require ckeditor/init
//= require_tree .
// $(document).on "page:change", ->
//     $('#comments-link').click ->
//       alert "sdgjworjg"
//       $('#comments-section').toggle()


$(document).on('turbolinks:load', function() {
	$('.reply').click(function(){
	const cmdId = $(this).attr("comment");
	if ($('#replyform_'+cmdId).css('display')== 'none')
	{
		$('#replyform_'+cmdId).slideToggle(500).css('display', 'block');
	}
	else
	{
		$('#replyform_'+cmdId).slideToggle(500).css('display', 'none');
	}

	})
})
