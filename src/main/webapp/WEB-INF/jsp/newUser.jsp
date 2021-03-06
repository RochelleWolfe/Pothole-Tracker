<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script type="text/javascript"> //To stop program from exploding when trying to insert an existing username, use try-catch on the SQL statement, not here
	$(document)
			.ready(
					function() {
						$.validator.addMethod('capitals', function(thing) {
							return thing.match(/[A-Z]/);
						});
						$("form")
								.validate(
										{

											rules : {
												userName : {
													required : true
												},
												password : {
													required : true,
													minlength : 15,
													capitals : true,
												},
												confirmPassword : {
													required : true,
													equalTo : "#password"
												}
											},
											messages : {
												password : {
													minlength : "Password too short, make it at least 15 characters",
													capitals : "Field must contain a capital letter",
												},
												confirmPassword : {
													equalTo : "Passwords do not match"
												}
											},
											errorClass : "error"
										});
					});
</script>

 

<h2 id="Success">Once you have created your account, 
you will be redirected <br> and prompted to log in  </h2>

<br> 

<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="userName">User Name: </label> <input type="text"
					id="userName" name="userName" placeHolder="User Name"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label> <input type="password"
					id="password" name="password" placeHolder="Password"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label> <input
					type="password" id="confirmPassword" name="confirmPassword"
					placeHolder="Re-Type Password" class="form-control" />
			</div>
			<button type="submit" class="btn btn-default">Create User</button>
		</div>
		<div class="col-sm-4"></div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />