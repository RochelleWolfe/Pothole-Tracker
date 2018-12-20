<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="potholeListUser" value="/{currentUser}/potholeList" />

<table class="userPotholeList">

	<tr>
		<th>Location</th>
		<th>Size</th>
		<th>Severity</th>
		<th>Date Reported</th>
		<th># Times Reported</th>
		<th>Has the city seen the request?</th>												
		<th>Currently repairing?</th>
		<th>Date Sent For Repair</th>

	</tr>
	<c:forEach var="pothole" items="${potholeList}">
		<tr>
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
			<td><c:set var="viewed" value="${pothole.admin_aware}" /> <c:if
					test="${viewed == false}">
					<c:out value="No" />
				</c:if> <c:if test="${viewed == true}">
					<c:out value="Yes" />
				</c:if> 
				</td>											
			<td><c:set var="repairing" value="${pothole.repairing}" /> <c:if
					test="${repairing == false}">
					<c:out value="No" />
				</c:if> <c:if test="${repairing == true}">
					<c:out value="Yes" />
				</c:if> 
				</td>
			<td>${pothole.dateSentRepair}</td>
		</tr>
	</c:forEach>
</table>

<c:import url="/WEB-INF/jsp/footer.jsp" />