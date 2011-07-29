$(document).ready(function(){
	var directionsService = new google.maps.DirectionsService();
	var directionsDisplay = new google.maps.DirectionsRenderer();
	var $end_postcode = $("#google-directions").attr("data-endpoint");
	var $start_postcode;
	$("#google-directions").append("<div id='controls'><input type='text' class='text' id='postcode-input' placeholder='"+$("#google-directions").attr("data-placeholder")+"' value=''><a href='#' class='get-directions'>get directions</a> </div>");
	if($("#google-directions").attr("data-map")=="true"){
		$("#google-directions").append("<div id='map' style='width:300px; height:300px;'></div");
		var myOptions = {
	    zoom:7,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  }
		var map = new google.maps.Map($("#map")[0], myOptions);
		directionsDisplay.setMap(map);
	}
	if($("#google-directions").attr("data-directions")=="true"){
		$("#google-directions").append("<div id='directions'></div");
		directionsDisplay.setPanel($("#directions")[0]);
	}
	
	$('.get-directions').live("click",function(){
		$start_postcode = $("#postcode-input").val();
		args = {
			origin: $start_postcode,
			destination: $end_postcode,
			travelMode: google.maps.TravelMode.DRIVING,
		}
		directionsService.route(args, function(result,status){
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(result);
			}
		});
		return false;
	});
});