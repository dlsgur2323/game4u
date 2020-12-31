
	window.onload = function(){
		
		$(document).ready(function() {
			
			$('.card').delay(600).queue(function(next) {
				$(this).removeClass('hover');
				$('a.hover').removeClass('hover');
				next();
			});
		});
		
	}

