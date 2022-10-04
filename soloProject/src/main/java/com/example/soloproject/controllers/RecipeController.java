package com.example.soloproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.soloproject.models.Recipe;
import com.example.soloproject.models.User;
import com.example.soloproject.services.RecipeService;
import com.example.soloproject.services.UserService;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private UserService userService;

	@GetMapping("/recipes")
	public String homePage (HttpSession session, Model model) {
		// Check if user is in session
		if (session.getAttribute("loggedInUser") != null) {
			User user = (User) session.getAttribute("loggedInUser");
			User newUser = userService.findById(user.getId());
			model.addAttribute("recipes", recipeService.all());
			model.addAttribute("newUser", newUser);
			return "homePage.jsp";
		} else {
			return "redirect:/";
		}

	}
	
	@GetMapping("/recipes/new")
	public String addNewRecipe(@ModelAttribute("newRecipe") Recipe recipe, HttpSession session) {
		// Check if user is in session
		if (session.getAttribute("loggedInUser") != null) {
			return "newRecipe.jsp";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/recipes/add")
	public String addRecipe(@Valid @ModelAttribute("newRecipe") Recipe recipe, BindingResult result) {

		this.recipeService.validateRecipe(recipe, result);
		if (result.hasErrors()) {
			return "newRecipe.jsp";
		}
		this.recipeService.create(recipe);
		return "redirect:/recipes";
	}
	
	@GetMapping("/recipes/{id}")
	public String viewRecipe(HttpSession session, @PathVariable Long id, Model model) {
		if (session.getAttribute("loggedInUser") != null) {
			User user = (User) session.getAttribute("loggedInUser");
			User newUser = userService.findById(user.getId());
			model.addAttribute("recipes", this.recipeService.retrieve(id));
			model.addAttribute("newUser", newUser);
			return "viewRecipe.jsp";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/recipes/edit/{id}")
	public String editRecipe(HttpSession session, @PathVariable Long id, Model model) {
		if (session.getAttribute("loggedInUser") != null) {
			model.addAttribute("editRecipe", this.recipeService.retrieve(id));
			return "editPage.jsp";
		} else {
			return "redirect:/";
		}
	}

	@PutMapping("/recipes/update/{id}")
	public String updateRecipe(@PathVariable Long id, @Valid @ModelAttribute("editRecipe") Recipe recipe, BindingResult result,
			Model model) {

		// check for form errors
		if (result.hasErrors()) {
			return "editPage.jsp";
		}
		this.recipeService.update(recipe);

		return "redirect:/recipes";
	}







	
	

}
