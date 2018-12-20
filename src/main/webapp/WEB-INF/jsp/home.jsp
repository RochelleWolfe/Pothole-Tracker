<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<script
	src=https://maps.googleapis.com/maps/api/js?key=AIzaSyAlbVrGqQ_thHgHh-A-XqEDL74Os5B-PbQ&callback=initMap></script>


<script>
	// once dom is loaded calls initMap function
	google.maps.event.addDomListener(window, 'load', initMap);
	
	
	function initMap() {

		// creates google.maps MAP object and assigns it to a div. Also defines center.
		var map = new google.maps.Map(document.getElementById('map-canvas'), {
			zoom : 12,
			center : new google.maps.LatLng(41.505493, -81.681290),
		
		styles: [
        	
			 	{elementType: "geometry","stylers": [{ "color": "#f5f5f5"
		  	}]}, 
  			{elementType: "labels.icon", "stylers": [{"visibility": "off"
		      }]}, 
		   	  {
		    elementType: "labels.text.fill","stylers": [{"color": "#5ab6ae" //#616161 previously grey, now teal as customer requested
		      }]}, 
		   	  {
		    elementType: "labels.text.stroke","stylers": [{"color": "#f5f5f5"
		      }]}, 
		      {
		    featureType: "administrative.land_parcel","stylers": [{"visibility": "off"
		      } ]},
		 		  {
		    featureType: "administrative.land_parcel","elementType": "labels.text.fill","stylers": [{
		        "color": "#bdbdbd"
		        }]},
		  {
		    featureType: "landscape","stylers": [{
		        "color": "#bbbbbb"
		      }]},
 		  {
		    featureType: "poi","elementType": "geometry", "stylers": [{
		        "color": "#eeeeee"
		      },
		      {visibility: "off"
		      }]},
		  {
		    featureType: "poi","elementType": "labels.text","stylers": [{
		        visibility: "off"
		      }]},
		  {
		    featureType: "poi","elementType": "labels.text.fill",
		    stylers: [{
		        "color": "#757575"
		      }]},
		  {
		    "featureType": "poi.business","stylers": [{"visibility": "off"
		      }]},
		  {
		    "featureType": "poi.park", "elementType": "geometry","stylers": [
		      {
		        "color": "#e5e5e5"},
		      {
		        "visibility": "off"
		      }]},
		  {
		    "featureType": "poi.park","elementType": "labels.text.fill",
		    "stylers": [{"color": "#9e9e9e"
		      }]},
		  {
		    "featureType": "road","elementType": "geometry",
		    "stylers": [{"color": "#ffffff"
		      }]},
		  {
		    "featureType": "road","elementType": "labels",
		    "stylers": [{ "visibility": "off"}
		    ]},
		  {
		    featureType: "road","elementType": "labels.icon",
		    "stylers": [{ "color": "#5ab6ae"					//turned visibility on and text blue
		      }]},
		  {
		    "featureType": "road.arterial", "elementType": "labels.text.fill",
		    "stylers": [{"color": "#5ab6ae"						//turned visibility on and text blue
		      }]},
		  {
		    "featureType": "road.highway","elementType": "geometry",
		    "stylers": [ {"color": "#dadada"
		      }]},
		  {
		    "featureType": "road.highway", "elementType": "labels.text.fill",
		    "stylers": [{"color": "#616161"
		      }]},
		  {
		    "featureType": "road.local", "elementType": "labels.text.fill",
		    "stylers": [{"color": "#9e9e9e"
		    	}]},
		  {
		    "featureType": "transit","stylers": [{"visibility": "off"
		      }]},
		  {
		    "featureType": "transit.line","elementType": "geometry",
		    "stylers": [ { "color": "#e5e5e5"
		      } ] },
		  {
		    "featureType": "transit.station","elementType": "geometry",
		    "stylers": [ {
		        "color": "#eeeeee"
		      }] },
		  {
		    "featureType": "water","elementType": "geometry",
		    "stylers": [{"color": "#393939"
		      }]},
		  {
		    "featureType": "water", "elementType": "labels.text",
		    "stylers": [ {
		        "visibility": "off"
		      }] },
		  {
		    "featureType": "water","elementType": "labels.text.fill",
		    "stylers": [ { "color": "#9e9e9e"
		    }]
		   }
	 ]});	      
	
		
		// gets json object from JAVA controller
		let json = [];
		json = ${potholeJson};
		
		
		json.forEach((pothole) => {
			
			// creates google.maps object LatLng that holds latitude and longitude values for a marker
			var position = new google.maps.LatLng(pothole.lat, pothole.lng);
			
			
			// changes the stlying based on severity
			let severityStringAddress = "";
			switch(pothole.severity) {
			  case 1:
			    severityStringAddress = 'info-window-address-severity-one';
			    break;
			  case 2:
				  severityStringAddress = 'info-window-address-severity-two';
			    break;
			  case 3:
				  severityStringAddress = 'info-window-address-severity-three';
				break;
			}
			
			
			// defines infowindow for use during doubleclick event
			var contentString =     "<div id='info-window-content'></h2> <h3 id='pothole-address' class='" + severityStringAddress + "'>" + pothole.streetAdd + "</h3><h4 id='pothole-report-date'>This pothole was reported on " + pothole.reportDate + "</h4><h4 id='pothole-status'>Is this pothole being repaired? " + pothole.repairing + "</h4><span id='pothole-submissions'> This pothole has been reported " + pothole.reportingCount + " times</span></div>";
			
			var infoWindow = new google.maps.InfoWindow({
				content: contentString
			
			});
			
			console.log(infoWindow.getContent());
	
			// adds marker to map
			var marker = new google.maps.Marker({
				position: position,
				map: map
			});
			// Zooms in on marker when clicked
			marker.addListener('click', function()  {
				infoWindow.open(map, marker);
			});
			// Generates info div to marker when double clicked
		    marker.addListener('dblclick', function() {
	            map.setZoom(15);
	            map.setCenter(marker.getPosition());
	          });
		    
		});
    
        }
	
	
	
</script>

<div id="map-canvas" style="height: 600px; width: 1150px; margin: 3px;"></div>


<c:import url="/WEB-INF/jsp/footer.jsp" />