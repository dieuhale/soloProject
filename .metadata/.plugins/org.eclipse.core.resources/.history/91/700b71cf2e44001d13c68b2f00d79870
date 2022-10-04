package com.example.soloproject.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.soloproject.models.LoginUser;
import com.example.soloproject.models.User;
import com.example.soloproject.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository repository;
	
	// Validate User for - Duplicate email and password mismatch
		public void validate(User newUser, BindingResult result) {

			if (!newUser.getPassword().equals(newUser.getPasswordConfirmation())) {
				result.rejectValue("passwordConfirmation", "Matches", "The Confirm Password must match Password!");
			}

			if (repository.findByEmail(newUser.getEmail()) != null) {
				result.rejectValue("email", "Email", "Email is already taken!");
			}

		}
		
	// Hash user's password and add to database
		public User registerUser(User newUser) {

			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			repository.save(newUser);
			return null;
		}
		
	// Authenticate User
		public User authenticate(LoginUser newLogin, BindingResult result) {
			// Find the user by email

			User user = repository.findByEmail(newLogin.getEmail());
			if (user == null) {
				result.rejectValue("email", "missingEmail", "Email is not found!");
				return null;
			} else {
				if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
					result.rejectValue("password", "Matches", "Invalid Password!");
					return null;
				}
			}
			return user;
		}

		public User findByEmail(String email) {
			return repository.findByEmail(email);
		}

		public User findById(Long id) {
			return repository.findById(id).orElse(null);
		}




	

}
