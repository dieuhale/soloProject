<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/loginPage.css" />
<meta charset="UTF-8">
<title>Login and Registration</title>
</head>
<body>

	<header>
		<div class="overlay">
			<h1>Recipe Collections</h1>
		</div>
	</header>
	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">

		<div class="signup">

			<form:form method="POST" action="/register" modelAttribute="newUser">
				<label for="chk" aria-hidden="true">Registration</label>

				<p>
					<form:label path="name"></form:label>
					<form:input type="name" path="name" placeholder="Your Name" />
					<form:errors path="name" class=" validation" />
				</p>
				<p>
					<form:label path="email"></form:label>
					<form:input type="email" path="email" placeholder="Email" />
					<form:errors path="email" class=" validation" />
				</p>
				<p>
					<form:label path="password"></form:label>
					<form:password path="password" placeholder="Password" />
					<form:errors path="password" class=" validation" />
				</p>
				<p>
					<form:label path="passwordConfirmation"></form:label>
					<form:password path="passwordConfirmation"
						placeholder="Confirm Password" />
					<form:errors path="passwordConfirmation" class=" validation" />
				</p>

				<button>Registration</button>
			</form:form>
		</div>

		<div class="login">

			<form:form action="/login" modelAttribute="newLogin">
				<label for="chk" aria-hidden="true">Login</label>

				<p>
					<form:label path="email"></form:label>
					<form:input type="email" path="email" placeholder="Email" />
					<form:errors path="email" class=" validation" />
				</p>
				<p>
					<form:label path="password"></form:label>
					<form:password path="password" placeholder="Password" />
					<form:errors path="password" class=" validation" />
				</p>

				<button>Login</button>
			</form:form>
		</div>

	</div>
</body>
</html>