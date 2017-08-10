package com.app.erp.controller;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.erp.model.ErpInstance;
import com.app.erp.security.SecurityUtil;
import com.app.erp.service.InstanceService;
import com.app.erp.service.UserProfileService;

@Controller
@RequestMapping("/")
public class InstanceController {

	@Autowired
	InstanceService instanceService;
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@RequestMapping(value = { "/admin/listInstances", "/admin/listInstances" }, method = RequestMethod.GET)
	public String listInstances(ModelMap model) {
		List<ErpInstance> instances = instanceService.findAllInstances();
		model.addAttribute("instances", instances);
		model.addAttribute("loggedinuser", new SecurityUtil().getPrincipal());
		return "admin/manageinstance";
	}
	
	@RequestMapping(value = { "/admin/newinstance" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		ErpInstance instance = new ErpInstance();
		model.addAttribute("instance", instance);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", new SecurityUtil().getPrincipal());
		return "admin/newinstance";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/admin/newinstance" }, method = RequestMethod.POST)
	public String saveUser(@Valid ErpInstance instance, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "admin/newinstance";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
		 * and applying it on field [sso] of Model class [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
		 * framework as well while still using internationalized messages.
		 * 
		 */
		if(!instanceService.isInstanceUnique(instance.getId(), instance.getInstanceName())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.instance", new String[]{instance.getInstanceName()}, Locale.getDefault()));
		    result.addError(ssoError);
			return "admin/newinstance";
		}
		
		instanceService.save(instance);

		model.addAttribute("success", "User " + instance.getInstanceName() + " registered successfully");
		model.addAttribute("loggedinuser", new SecurityUtil().getPrincipal());
		//return "success";
		return "admin/newinstance";
	}
}
