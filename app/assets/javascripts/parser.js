// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function insertSpaces() {
    $.getJSON('spaces', {text: $('#raw_text').val()},
	      function(data) {
		  $('#space_text').text(data.text);
	      }
	     );
}
