<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="potholeListUser" value="/{currentUser}/potholeList" />
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