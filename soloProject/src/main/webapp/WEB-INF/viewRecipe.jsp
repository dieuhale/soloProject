<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>View Recipe</title>
</head>
<body>
	<div class="row justify-content-center">
		<h1 class="text-center">${recipes.recipeName}</h1>
		<p class="text-center">Posted by: ${recipes.user.name}</p>
		<a href="/recipes" class="btn btn-primary col-3">Back</a> <a
			href="/logout" class="btn btn-primary col-3">Logout</a>
	</div>

	<div class="container-lg my-5 text-center">

		<p>Preparation Time: ${recipes.preparationTime}</p>
		<p>No. of Servings: ${recipes.serving}</p>
		<p>Cooking Time: ${recipes.cookingTime}</p>
		<p>Difficulty: ${recipes.difficulty}</p>
		<p>Ingredients: ${recipes.ingredient}</p>
		<p>Directions: ${recipes.directions}</p>

	</div>



</body>
</html>