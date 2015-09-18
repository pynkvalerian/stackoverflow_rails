// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

	$('img').on('click', function(e){
		e.preventDefault();

		var up_down = $(this).attr('class'); // this.class
		var type = $(this).attr('value'); // this.value
		var type_id = $(this).attr('id'); // this.id
		
		$.ajax({
			method: 'POST',
			url: '/votes',
			dataType: 'json',
			data: { vote: { votable_type: type, votable_id: type_id, up_down: up_down }}
			}).done(function(){
				debugger
				$('p#"+vote[type_id]+"."+vote[type]+"').html('"+vote[final_votes]+"');
			});
	});

});