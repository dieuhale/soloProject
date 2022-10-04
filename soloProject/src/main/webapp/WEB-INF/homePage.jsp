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
<title>Recipe Collections</title>
</head>
<body>
	<div class="text-center">
		<h1>Welcome ${loggedInUser.name}!</h1>
		<a href="/logout">Logout</a>
	</div>

	<table class="table">
		<tr>
			<th>Recipes</th>
			<th>Actions</th>
			<th>Favorites</th>

		</tr>
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

			</tr>
		</c:forEach>
	</table>


	<a href="/recipes/new" class="btn btn-success "> Add a Recipe!!!</a>



</body>
</html>
