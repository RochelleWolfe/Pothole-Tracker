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
			center : new google.maps.LatLng(41.505493, -81.681290)
		});
		
		// stores data from json that will be displayed in info window
		var contentString = '<div id="content">TEST</div>'
		
		// gets json object from JAVA controller
		let json = [];
		json = ${potholeJson};
		
		
		json.forEach((pothole) => {
			
			// creates google.maps object LatLng that holds latitude and longitude values for a marker
			var position = new google.maps.LatLng(pothole.lat, pothole.lng);
			
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
    
        }
	
</script>



<div id="map-canvas" style="height: 500px; width: 700px; margin: auto;"></div>
<table>
	<tr>
		<th>Pothole</th>
		<th>Size</th>
		<th>Address</th>
	</tr>
	<c:forEach var="pothole" items="${potholeList}">
		<tr>
			<td>${pothole.markerId}</td>
			<td>${pothole.size}</td>
			<td>${pothole.streetAdd}</td>
		</tr>
	</c:forEach>
</table>


<c:import url="/WEB-INF/jsp/footer.jsp" />