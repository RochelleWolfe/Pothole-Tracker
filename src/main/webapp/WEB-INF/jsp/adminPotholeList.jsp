<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="potholeListUser" value="/{currentUser}/adminPotholeList" />

<table class="userPotholeList">

	<tr>
		<th>ID</th>
		<th>Location</th>
		<th>Size</th>
		<th>Severity</th>
		<th>Date Reported</th>
		<th>How many times reported</th>
		<th>Priority</th>
		<th>Currently repairing?</th>
		<th>Date sent for repair</th>
		<th>Repair in progress</th>
		<th>Report viewed by the city</th>

	</tr>
	
	
	
		</form>
		
	<c:forEach var="pothole" items="${potholeList}">
	<c:url var="formAction" value="/{currentUser}/potholeList" >
	<c:param name="markerId" value="${pothole.markerId}" />
	</c:url>
	<c:url var="formDelete" value="/{currentUser}/potholeDelete" >
	<c:param name="markerId" value="${pothole.markerId}" />
	</c:url>
		
			<form id="deletePothole" method="POST" action="${formDelete}"> <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/></form>
			<form id="updatePothole" method="POST" action="${formAction}"> <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
		
		<tr>
			<td>
			${pothole.markerId}
			<label for="id"></label> 
			<input type="checkbox" id="id" name="id" value="${pothole.markerId}" form="deletePothole">
			</td>
			<td>${pothole.streetAdd}</td>
			<td><c:set var="size" value="${pothole.size}" /> <c:if
					test="${size == 12}">
					<c:out value="Small" />
				</c:if> <c:if test="${size == 24}">
					<c:out value="Medium" />
				</c:if> <c:if test="${size == 40}">
					<c:out value="Large" />
				</c:if></td>
			<td>${pothole.severity}</td>
			<td>${pothole.reportDate}</td>
			<td>${pothole.reportingCount}</td>
			<td>${pothole.priority}</td>
			<td>${pothole.repairing}</td>
			<td>${pothole.dateSentRepair}</td>
			
			
			<td>
			<label for="repairing"></label> 
			<input type="checkbox" id="repairing" name="repairing" value="${pothole.markerId}" form="updatePothole">Yes
			<input type="hidden" id="repairingHidden"name="repairing" value="false" form="updatePothole">
			</td>
			
			<td>
			<label for="admin_aware"></label> 
			<input type="checkbox" id="admin_aware" name="admin_aware" value="${pothole.markerId}" form="updatePothole">Yes
			<input type="hidden" id="admin_awareHidden" name="admin_aware" value="false" form="updatePothole"> 
			</td>
			
			</form>

			</tr>

	</c:forEach>

</table>
	<input type="submit" value="Submit" form="updatePothole"/>
	<input type="submit" name="Remove" value="Delete" form="deletePothole"> 

<script>
document.getElementById()

</script>

<c:import url="/WEB-INF/jsp/footer.jsp" />