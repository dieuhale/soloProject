<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/editRecipe.css" />
<meta charset="UTF-8">
<title>Edit Recipe</title>
</head>
<body>
	<header>
		<div class="overlay">
			<h1>Edit ${editRecipe.recipeName}</h1>
			<div class="header-right">
				<a href="/recipes">Back</a> <a href="/logout">Logout</a>
			</div>
		</div>
	</header>

	<div class="body">
		<div>
			<div>
				<form:form action="/recipes/update/${editRecipe.id}" method="PUT"
					modelAttribute="editRecipe" class="form-style-9">
					<ul>

						<li><form:label path="recipeName">Recipe Name:</form:label><br>
							<form:errors path="recipeName" class = " validation"/> <form:input class="field-style field-full align-none" type="text"
								path="recipeName" /></li>

						<li ><form:label path="preparationTime">Preparation Time:</form:label><br>
							<form:errors path="preparationTime" class = " validation"/> <form:input class="field-style field-full align-none" type="text"
								path="preparationTime" /></li>

						<li ><form:label path="serving">No. of Serving:</form:label><br>
							<form:errors path="serving" class = " validation"/> <form:input  class="field-style field-full align-none" type="text"
								path="serving" /></li>

						<li ><form:label path="cookingTime">Cooking Time:</form:label><br>
							<form:errors path="cookingTime" class = " validation"/> <form:input class="field-style field-full align-none" type="text"
								path="cookingTime" /></li>

						<li ><form:label path="difficulty">Difficulty:</form:label><br>
							<form:errors path="difficulty" class = " validation"/> <form:select class="field-style field-full align-none" path="difficulty" 
								>
								<option value="Easy">Easy</option>
								<option value="Moderate">Moderate</option>
								<option value="Difficult">Difficult</option>
							</form:select></li>

						<li ><form:label path="ingredient">Ingredients:</form:label>
							<form:errors path="ingredient" class = " validation"/> <form:textarea class="field-style" type="text"
								path="ingredient" /></li>

						<li><form:label path="directions">Directions:</form:label> <form:errors
								path="directions" class = " validation"/> <form:textarea class="field-style"  type="text"
								path="directions" /> </li>
						<li><form:input type="hidden" value="${loggedInUser.id}"
								path="user" /></li>
						<li><form:input type="hidden" path="favUsers" /></li>
						<li>
							<button >Submit</button>
						</li>
					</ul>
				</form:form>

			</div>
		</div>
	</div>

</body>
</html>