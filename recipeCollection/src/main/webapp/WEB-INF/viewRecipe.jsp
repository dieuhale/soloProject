<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/viewRecipe.css" />
<meta charset="UTF-8">
<title>View Recipe</title>
</head>
<body>

	<header>
		<div class="overlay">
			<h1>${recipes.recipeName}</h1>
			<p class="text-center">Posted by: ${recipes.user.name}</p>
			<div class="header-right">
				<a href="/recipes">Back</a> <a href="/logout">Logout</a>
			</div>
		</div>
	</header>

	<div class="main-container">
		<div class="small-container">
			<p>Preparation Time: ${recipes.preparationTime}</p>
			<p>No. of Servings: ${recipes.serving}</p>
			<p>Cooking Time: ${recipes.cookingTime}</p>
			<p>Difficulty: ${recipes.difficulty}</p>
			<h3>
				<c:choose>
					<c:when test="${recipes.favUsers.contains(newUser)}">
						<p>❤️ You favored this recipe!!!</p>
					</c:when>
					<c:otherwise>
						<a href="/recipes/${recipes.id}/favorite">❤️</a>
					</c:otherwise>
				</c:choose>
			</h3>

		</div>

		<div class="big-container">

			<h2>Ingredients:</h2>
			<br>
			<span style="white-space: pre;">${recipes.ingredient} </span>
			
			<h2>Directions:</h2>
			<br>
			<span style="white-space: pre-wrap;">${recipes.directions} </span>

		</div>


	</div>

</body>
</html>