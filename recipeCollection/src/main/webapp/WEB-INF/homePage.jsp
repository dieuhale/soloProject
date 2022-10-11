<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/homePage.css" />
<meta charset="UTF-8">
<title>Recipe Collections</title>
</head>
<body>

	<header>
		<div class="overlay">
			<h1>Welcome, ${loggedInUser.name}!</h1>
			<div class="header-right">
				<a href="/logout">Logout</a>
			</div>
		</div>
	</header>

	<table class="table">
		<thead>
			<tr>
				<th>Recipes</th>
				<th>Actions</th>
				<th>Favorites</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="recipe" items="${recipes}">
				<tr>
					<td><c:out value="${recipe.recipeName}" /></td>
					<td>
						<p>
							<c:choose>
								<c:when test="${recipe.user.id!=loggedInUser.id}">
									<a href="/recipes/${recipe.id}">View</a>
								</c:when>
								<c:otherwise>
									<a href="/recipes/${recipe.id}">View</a>
									<a href="/recipes/edit/${recipe.id}">Edit</a>
									<a href="/recipes/delete/${recipe.id}">Delete</a>
								</c:otherwise>
							</c:choose>
						</p>
					</td>
					<td><c:out value="${recipe.favUsers.size()}" /></td>

				</tr>
			</c:forEach>
		</tbody>

	</table>


	<a href="/recipes/new" class = "button"> Add a Recipe!!!</a>



</body>
</html>