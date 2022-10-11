package com.example.recipecollection.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.recipecollection.models.Recipe;
import com.example.recipecollection.models.User;
import com.example.recipecollection.repositories.RecipeRepository;

@Service
public class RecipeService {
	
	@Autowired
	private RecipeRepository repository;
	
	public List<Recipe> all() {
		return this.repository.findAll();
	}

	public Recipe create(Recipe recipe) {
		return this.repository.save(recipe);
	}

	public void delete(Long id) {
		this.repository.deleteById(id);
	}

	public Recipe retrieve(Long id) {
		return this.repository.findById(id).get();
	}

	public Recipe update(Recipe recipe) {
		return this.repository.save(recipe);
	}
	
	public Recipe findByRecipeName(String recipe) {
		return (Recipe) repository.findByRecipeName(recipe);
	}
	
	public void validateRecipe(Recipe newRecipe, BindingResult result) {

		if (!repository.findByRecipeName(newRecipe.getRecipeName()).isEmpty()) {
			result.rejectValue("recipeRecipe", "recipeRecipe", "Recipe must be unique");
		}
	}
	
	public void favorRecipe(Recipe recipe, User user) {
		List<User> favUsers = recipe.getFavUsers();
		favUsers.add(user);
		repository.save(recipe);
	}




}