<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="http://maps.googleapis.com/maps/api/js?libraries=places"
	type="text/javascript"></script>

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
		<c:url var="formAction" value="/{userName}/reportPothole" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="destination" value="${param.destination}" />
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			<div class="form-group">
				<label for="potholeLocation">Location search: </label>
				<input id="searchTextField" type="text" size="50"
					placeholder="Enter a location" autocomplete="on" runat="server" />
				<input type="hidden" id="city2" name="city2" /> <input
					type="hidden" id="cityLat" name="cityLat" /> 
					<input type="hidden"id="cityLng" name="cityLng" /> 
					<!-- <input type="text" id="potholeLocation"
					name="potholeLocation" placeHolder="road name and/or post code"
					class="form-control" /> -->
			</div>
			<div class="form-group">
				<label for="size">Enter the size of the pothole: </label> <input
					type="text" id="size" name="size" placeHolder="size in inches"
					class="form-control" />
			</div>
			<div>
				<label for="file">Upload an image of the pothole </label> <input
					type="file" name="file" size="50" /> <br /> <input type="submit"
					value="Upload File" />
			</div>
			<div></div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<div class="col-sm-4"></div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />