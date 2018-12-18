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
			
		//A customized style generated using https://mapstyle.withgoogle.com/	
	          styles: [
	        	
		 				 	{elementType: "geometry","stylers": [{ "color": "#f5f5f5"
		        		  	}]}, 
				  			{elementType: "labels.icon", "stylers": [{"visibility": "off"
		        		      }]}, 
		        		   	  {
		        		    elementType: "labels.text.fill","stylers": [{"color": "#616161"
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
		        		    "featureType": "road","elementType": "labels.icon",
		        		    "stylers": [{ "visibility": "off"
		        		      }]},
		        		  {
		        		    "featureType": "road.arterial", "elementType": "labels.text.fill",
		        		    "stylers": [{"color": "#757575"
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
			
			// stores data from json that will be displayed in info window
			//var contentString = "<div id='info-window-content'><c:url var='formAction' value='/{currentUser}/updatePothole?markerId=" + pothole.markerId + "'/><h2 id='pothole-severity' class='"+ severityStringAddress + "'>" +pothole.severity + "</h2> <h3 id='pothole-address'>" +pothole.streetAdd + "</h3><form method='POST' action='${formAction}'><input type='hidden' name='CSRF_TOKEN' value='${CSRF_TOKEN}' /><button id='pothole-counter-btn'>Is this your pothole???</button></form><span id='pothole-submissions'> " + pothole.reportingCount + "</span></div>";
			var contentString =     "<div id='info-window-content'><c:url var='formAction' value='/{currentUser}/updatePothole?markerId=" + pothole.markerId + "'/></h2> <h3 id='pothole-address' class='" + severityStringAddress + "'>" + pothole.streetAdd + "</h3><h4 id='pothole-report-date'>This pothole was reported on " + pothole.reportDate + "</h4><h4 id='pothole-status'>The city is working on this pothole " + pothole.repairing + "</h4><form method='POST' action='${formAction}'><input type='hidden' name='CSRF_TOKEN' value='${CSRF_TOKEN}' /><button id='pothole-counter-btn'>Click to Re-Submit</button></form><span id='pothole-submissions'> " + pothole.reportingCount + "</span></div>";

			// defines infowindow for use during doubleclick event
			var infoWindow = new google.maps.InfoWindow({
				content:contentString
			});
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
		
		
		
		
		function fetchAddress(latLng) {
			let site = "https://maps.googleapis.com/maps/api/geocode/json?latlng=";
			let lat = latLng.lat();
			let lng = latLng.lng();
			let key = "&key=AIzaSyAlbVrGqQ_thHgHh-A-XqEDL74Os5B-PbQ";
			let url = site + lat + ',' + lng + key;
			
			// https://maps.googleapis.com/maps/api/geocode/json?latlng=41.4156,-81.9235&key=AIzaSyAlbVrGqQ_thHgHh-A-XqEDL74Os5B-PbQ
			
			fetch(url)
				.then(response =>{
					return response.json();
				})
				.then(json =>{
					document.getElementById('streetAdd').value = json.results[0].formatted_address;
					document.getElementById('form-address-user-input').innerText = json.results[0].formatted_address;
				})
		        .catch(err => {
		            console.error(err);
		        });
			
		}
		
		//Creates new marker on double click and passes data into input fields
		// The entire content of this div string is in an html file under resources, update both to keep the same.
		var marker;
		var infoFormWindow = new google.maps.InfoWindow({
			content:'<div class="row" id="report-a-pothole-form"><div class="col-sm-4"></div><div class="col-sm-4"><c:url var="formAction" value="/{currentUser}/reportPothole" /><form method="POST" action="${formAction}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /><div class="form-group"><input type="hidden" id="lat" name="lat" placeHolder="lat"class="form-control" /></div><div class="form-group"><input type="hidden" id="lng" name="lng" placeHolder="lng" class="form-control" /></div><div class="form-group"><h4 id="form-address-user-input"> </h4><input type="hidden" id="streetAdd" name="streetAdd" placeHolder="Street Name" class="form-control" /></div><div class="form-group"><label for="size">Select the Size of the Pothole: </label> <select type="text" id="size" name="size" class="form-control"><option value="12">Smaller than 12in</option><option value="24">Medium: 12-24in</option><option value="40">Larger than 24in</option></select></div><div class="form-group" id="depth-radios"><label for="depth-radios"> Select the Depth of the Pothole</label><br><input type="radio" name="depth" value="2" id="very-shallow"><label for="very-shallow"> Less than 3 inches deep</label><c:url var="verySmallURL" value="/img/golfball.png" /> <img class="depth-img" id="very-Small-Depth" src="${verySmallURL}" alt="very shallow depth, 2 inches" /><br> <input type="radio" name="depth" value="5" id="shallow"><label for="shallow"> 3-10 inches deep</label><c:url var="smallURL" value="/img/Baseball.png" /><img class="depth-img" id="Small-Depth" src="${smallURL}" alt="shallow depth, 5 inches" /> <br> <input type="radio" name="depth" value="12" id="medium-deep"><label for="medium-deep"> 10-18 inches deep</label><c:url var="mediumURL" value="/img/basketball.png" /> <img class="depth-img" id="Medium-Depth" src="${mediumURL}" alt="sizeable depth, 12 inches" /> <br> <input type="radio" name="depth" value="24" id="very-deep"><label for="very-deep"> More than 18 inches deep</label><c:url var="largeURL" value="/img/beachball.png" />	<img class="depth-img" id="Large-Depth" src="${largeURL}" alt="very deep, 24 inches" />  <br><button type="submit" class="btn btn-default" value="submit">Submit</button></form></div><div class="col-sm-4"></div></div> '
		});
		infoFormWindow.open();

		function placeMarkerAndPanTo(latLng, map) {

			  if ( marker ) {
				 	fetchAddress(latLng);
				    marker.setPosition(latLng);
				    document.getElementById('lat').value = marker.getPosition().lat();
					document.getElementById('lng').value = marker.getPosition().lng();
					infoFormWindow.open(map, marker);

				  } else {
				marker = new google.maps.Marker({
					position : latLng,
					map : map
				});
				
			infoFormWindow.open(map, marker);
			fetchAddress(latLng);
			map.panTo(latLng);
			console.log(marker.getPosition());
			document.getElementById('lat').value = marker.getPosition().lat();
			document.getElementById('lng').value = marker.getPosition().lng();
			
			marker.addListener('click', function()  {
					infoFormWindow.open(map, marker);
			});
			
				  }	
				
		}
		google.maps.event.addListener(map, 'dblclick', function(event) {
			placeMarkerAndPanTo(event.latLng, map);	
			});
		
		

    	
       
	}
	
	

	

	
</script>


<!-- This is the literal Map, very important -->
<div id="map-canvas" style="height: 600px; width: 1150px; margin: 3px;"></div>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Double Click Anywhere to Start a Pothole Submission</p>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//opens the modal
  modal.style.display = "block";


// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>




<c:import url="/WEB-INF/jsp/footer.jsp" />