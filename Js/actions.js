$(document).ready(function() {

	$('.valider').click(function() {
		var numeroCommande = $(this).parent().attr('id');
		$.ajax({
		  type: 'post',
		  url: './modele/commandeBD.php',
		  data: {
		  	'fonction': 'isChecked',
		  	'num': numeroCommande
		  },
		  success: function (data, textStatus, jQxhr) {
		  		var div = $("#" + data);
		  		div.slideUp(1000, function() {
		  			$(this).remove();
		  		});
		  }
		})  
	});

   setInterval(function() {
        window.location.reload();
    }, 120000);


});