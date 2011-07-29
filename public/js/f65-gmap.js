$(document).ready(function(){
	var $directionsService = new google.maps.DirectionsService();
	var $directionsDisplay = new google.maps.DirectionsRenderer();
	var $container = $("#google-directions");
	var $end_postcode = $container.attr("data-endpoint");
	var $link_text = $container.attr("data-link-text");
	var $place_holder = $container.attr("data-placeholder");
	var $hasmap = $container.attr("data-map") === "true";
	var $hasdir = $container.attr("data-directions") === "true";
	var $start_postcode;
	var $startlatlng;
	var $map;
	
	$container.append("<div id='controls' class='gmap-section'><input type='text' class='text' id='postcode-input' placeholder='"+ $place_holder +"' value=''><a href='#' class='get-directions'>"+$link_text+"</a> </div>");
	
	if($hasmap){
		buildMap();
	}
	if($hasdir){
		buildDir();
	}
	
	$('.get-directions').live("click",function(){
		$start_postcode = $("#postcode-input").val();
		if($hasmap || $hasdir){
			updateMap();
			if($hasmap){
				showMap();
			}
			if($hasdir){
				showDir();
			}
		}
		return false;
	});
	
	function buildDir(){
		$container.append("<div id='directions' class='gmap-section'></div>");
		$directionsDisplay.setPanel($("#directions")[0]);
	}
	
	function buildMap(){
		$container.append("<div id='map' class='gmap-section'></div>");
		$map = new google.maps.Map($("#map")[0], {
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  });
		$directionsDisplay.setMap($map);
	}
	
	
	function showMap(){
		$("#map").slideDown("slow",function(){
			google.maps.event.trigger($map, "resize");
			$map.setCenter($startlatlng);
			$map.setZoom(14);
		});
	}
	
	function showDir(){
		$("#directions").slideDown("slow");
	}
	
	function updateMap(){
		$args = {
			origin: $start_postcode,
			destination: $end_postcode,
			travelMode: google.maps.TravelMode.DRIVING,
			region: "uk"
		}
		$directionsService.route($args, function(result,status){
			if (status == google.maps.DirectionsStatus.OK) {
				$startlatlng = result.routes[0].overview_path[0]; // this is grubbing about in json object returned to get the latlng object for the starting position.
				$directionsDisplay.setDirections(result);
			}else{
				postcodeFailure();
			}
		});
	}
	function postcodeFailure(){
		$("#map").hide();
		$("#directions").hide();
		alert("Sorry but "+ $start_postcode +" isn't a valid postcode, please try again.");
	}
});