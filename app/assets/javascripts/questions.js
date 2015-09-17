// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	$('form.new_comment').hide();

	$('a.new_comment').on('click', function(e){
		e.preventDefault();
		$('form.new_comment').show();
	});
});