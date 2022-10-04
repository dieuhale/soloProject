package com.example.soloproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.soloproject.models.Recipe;
import com.example.soloproject.repositories.RecipeRepository;

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
	
	public Recipe findByBabyRecipe(String recipeName) {
		return (Recipe) repository.findByRecipeName(recipeName);
	}
	
	public void validateRecipe(Recipe newRecipe, BindingResult result) {

		if (!repository.findByRecipeName(newRecipe.getRecipeName()).isEmpty()) {
			result.rejectValue("recipeName", "recipeName", "Recipe must be unique");
		}
	}


}

