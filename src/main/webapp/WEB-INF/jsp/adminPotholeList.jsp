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
		<th>Delete</th>
		<th></th>
		

	</tr>

	
 	<c:forEach var="pothole" items="${potholeList}">
	<c:url var="formAction" value="/{currentUser}/potholeList" >
	<c:param name="markerId" value="${pothole.markerId}" />
	</c:url>
		<form method="POST" action="${formAction}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
 		<tr>
 			<td>
			${pothole.markerId}
			<label for="id"></label> 
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
			<td><c:set var="repairing" value="${pothole.repairing}" /> <c:if
					test="${repairing == false}">
					<c:out value="No" />
				</c:if> <c:if test="${repairing == true}">
					<c:out value="Yes" />
				</c:if> 
				</td>
			<td>${pothole.dateSentRepair}</td>
			<td>
			<label for="repairing"></label> 
			<input type="checkbox" id="repairing" name="repairing" value="true">Yes
			<input type="hidden" id="repairing"name="repairing" value="false">
			</td>
			<td>
			<label for="admin_aware"></label> 
			<input type="checkbox" id="admin_aware" name="admin_aware" value="true">Yes
			<input type="hidden" id="admin_aware" name="admin_aware" value="false">
			</td>
			<td>
			<label for="delete"></label> 
			<input type="checkbox" id="delete" name="delete" value="true">Yes
			<input type="hidden" id="delete" name="delete" value="false">
			</td>
			<td><input type="submit" value="Submit"/></td>
			
 		</tr>
		</form>
 	</c:forEach>
 </table>
 
 <script>
 
 let delete = document.getElementById('delete');
 
 delete.addEventListener('click')
 
 </script>
<c:import url="/WEB-INF/jsp/footer.jsp" />