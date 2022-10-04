<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Login and Registration</title>
</head>
<body>
<div class="text-center">
		<div class="col-md -6">
			<h1>Recipe Collections</h1>
		</div>
	</div>

	<div class="container-lg my-5">
		<div class="row  ">
			<div class="col -md -3 mt-2">
				<h2>Register</h2>
				<form:form method="POST" action="/register" modelAttribute="newUser">
					<p class="form-group">
						<form:label path="name">Name:</form:label>
						<form:input type="name" path="name" />
						<form:errors path="name" />
					</p>
					<p class="form-group">
						<form:label path="email">Email:</form:label>
						<form:input type="email" path="email" />
						<form:errors path="email" />
					</p>
					<p class="form-group">
						<form:label path="password">Password:</form:label>
						<form:password path="password" />
						<form:errors path="password" />
					</p>
					<p class="form-group">
						<form:label path="passwordConfirmation">Confirm Password:</form:label>
						<form:password path="passwordConfirmation" />
						<form:errors path="passwordConfirmation" />
					</p>
					<input type="submit" value="Register" />
				</form:form>
			</div>


			<div class="col -md -3 mt-2 ">
				<h3>Log in</h3>
				<form:form action="/login" modelAttribute="newLogin">
					<p class="form-group">
						<form:label path="email">Email:</form:label>
						<form:input type="email" path="email" />
						<form:errors path="email" />
					</p>
					<p class="form-group">
						<form:label path="password">Password:</form:label>
						<form:password path="password" />
						<form:errors path="password" />
					</p>
					<input type="submit" value="Login" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>