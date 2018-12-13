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

<!--  <script src="http://maps.googleapis.com/maps/api/js?libraries=places"
	type="text/javascript"></script> -->
	

  <script type="text/javascript">
	function initialize() {
		var input = document.getElementById('searchTextField');
		var autocomplete = new google.maps.places.Autocomplete(input);
		google.maps.event
				.addListener(
						autocomplete,
						'place_changed',
						function() {
							var place = autocomplete.getPlace();
							document.getElementById('city2').value = place.name;
							document.getElementById('cityLat').value = place.geometry.location
									.lat();
							document.getElementById('cityLng').value = place.geometry.location
									.lng();
							//alert("This function is working!");
							//alert(place.name);
							// alert(place.address_components[0].long_name);

						});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script> 

<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<c:url var="formAction" value="/{currentUser}/reportPothole" />
		<form method="POST" action="${formAction}">
			<!--  <input type="hidden" name="destination" value="${param.destination}" />
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> -->
			<div class="form-group">
				<!--  <label for="potholeLocation">Location search: </label>
				<input id="searchTextField" type="text" size="50"
					placeholder="Enter a location" autocomplete="on" runat="server" />
				<input type="hidden" id="city2" name="city2" /> <input
					type="hidden" id="cityLat" name="cityLat" /> 
					<input type="hidden"id="cityLng" name="cityLng" /> -->
					<label for="potholeLocation">Location search: </label> 
					<input type="text" id="lat"
					name="potholeLocation" placeHolder="lat"
					class="form-control" />
			</div>
				<div class="form-group">
			<input type="text" id="lng" 
					name="potholeLocation" placeHolder="lng"
					class="form-control" />
				</div>
			<div class="form-group">
				<label for="size">Enter the street name: </label> <input
					type="text" id="streetAdd" name="streetAdd" placeHolder="Street Name"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="size">Enter the size of the pothole: </label> <input
					type="text" id="size" name="size" placeHolder="size in inches"
					class="form-control" />
			</div>
			<!--  <div>
				<label for="file">Upload an image of the pothole </label> <input
					type="file" name="file" size="50" /> <br /> <input type="submit"
					value="Upload File" />
			</div> -->
			<div class="form-group">
				<label for="size">img: </label> <input
					type="text" id="img" name="img" placeHolder="img"
					class="form-control" />
			</div>
			
			
			<button type="submit" class="btn btn-default" value="submit"> Submit</button>
		</form>
	</div>
	<div class="col-sm-4"></div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />