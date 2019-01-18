$(document).ready(function() {

	$('table input').prop('disabled', true);
	
	setInterval(function() {
        window.location.reload();
    }, 120000);

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

	$('div[id^="check"]').click(function() {
		var id = $(this).attr('id').replace('check','');
		var input = $('tr[id=' + id + '] input');
		if(input[0].disabled == false){
			var tabPlat = [];

			tabPlat[0] = id;
			for (i = 0; i < input.length; i++) {
	        	tabPlat[i+1] = $('tr[id=' + id + '] input')[i].value;
	    	}

	    	var tabJSON = JSON.stringify(tabPlat);
			$.ajax({
			  type: 'post',
			  url: './modele/commandeBD.php',
			  data: {
			  	'fonction': 'editBD',
			  	'tabPlat': tabJSON
			  },
			  dataType: 'JSON',
			  success: function (data, textStatus, jQxhr) {
			  	alert("Infos " + data[1] + " modifié !");
			  }
			})
		}  
	});

	$('img.edit').click(function() {
		var id = $(this).attr('id');
		$('tr[id=' + id + '] input').prop('disabled', false);
	});

});