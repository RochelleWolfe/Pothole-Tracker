<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<!-- <c:set var="potholeList" value="${potholeList}" /> -->



<script
	src=https://maps.googleapis.com/maps/api/js?key=AIzaSyAlbVrGqQ_thHgHh-A-XqEDL74Os5B-PbQ&callback=initMap></script>


<script>
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map-canvas'), {
			zoom : 12,
			center : new google.maps.LatLng(41.505493, -81.681290)
		});

		map.addListener('click', function(e) {
			placeMarkerAndPanTo(e.latLng, map);
		});
	}

	function placeMarkerAndPanTo(latLng, map) {
		var marker = new google.maps.Marker({
			position : latLng,
			map : map,
			customInfo : "Marker A"
		});
		map.panTo(latLng);
		console.log(marker);

	}
	
	<!--var allPotholes = ${potholeList}; -->
	
	
<!--	${potholeList}.forEach((pothole) => {
		console.log(pothole.lat);
	});
	-->
		
	
	
	
	
	
	
	google.maps.event.addDomListener(window, 'load', initMap);
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