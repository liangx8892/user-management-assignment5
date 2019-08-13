package com.ibm.fsd.um.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.fsd.um.entity.User;
import com.ibm.fsd.um.exception.CustomException;
import com.ibm.fsd.um.response.HttpResponse;
import com.ibm.fsd.um.service.UserService;


@Controller
public class AuthController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @Autowired
    private UserService userService;

    @GetMapping(value = "/login")
    public String login(
    		@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, 
            HttpSession session, Model model) {

        AuthenticationException ex = (AuthenticationException) session
                .getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

        String errorMessge = (error != null && ex != null) ? ex.getMessage() : null;
        if (logout != null) {
            errorMessge = "You have been successfully logged out !!";
        }
        model.addAttribute("errorMessge", errorMessge);
        return "login";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout=true";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public HttpResponse doRegister(@RequestParam(name = "kaptcha", required = true) String kaptcha,
    		@Valid @RequestBody User user, HttpSession session) {

        checkCaptcha(kaptcha, session);

        User existingUser = userService.findByUsername(user.getUsername());
        if (existingUser != null) {
            throw new CustomException(String.format("Username %s already exists.", 
            		user.getUsername()));
        }

        userService.saveUser(user);
        return HttpResponse.ok(user);
    }
    
    @GetMapping(value = "/accessdenied")
    public String accessDenied() {
        logger.warn("You are not authorized to access the page.");

        return "errors/forbidden";
    }
}