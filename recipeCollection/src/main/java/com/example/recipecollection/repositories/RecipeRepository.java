package com.example.recipecollection.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.recipecollection.models.Recipe;

@Repository	
public interface RecipeRepository extends CrudRepository <Recipe, Long> {
	
	List <Recipe> findAll();
	List<Recipe> findByRecipeName(String recipeName);

}
