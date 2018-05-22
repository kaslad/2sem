package ru.kpfu.itis.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.security.role.Role;
import ru.kpfu.itis.app.services.AuthenticationService;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

@Controller
public class AuthController {

    @Autowired
    private AuthenticationService service;

    @GetMapping("/login")
    public String login(@ModelAttribute("model") ModelMap model, Authentication authentication,
                        @RequestParam Optional<String> error) {
        if (authentication != null) {
            return "redirect:/main";
        }
        model.addAttribute("loginError", error);
        return "login2";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, Authentication authentication) {
        if (authentication != null) {
            request.getSession().invalidate();
        }
        return "redirect:/login";
    }

    @GetMapping("/")
    public String root(Authentication authentication) {

        if (authentication != null) {
            User user = service.getUserByAuthentication(authentication);

            if (user.getRole().equals(Role.ADMIN)) {
                return "redirect:/admin";
            } else if (user.getRole().equals(Role.MANAGER)) {
                return "redirect:/manager/main";
            } else if (user.getRole().equals(Role.COACH)){
                return "redirect:/coach/main";
            } else if (user.getRole().equals(Role.STRINGER)) {
                return "redirect:/stringer/main";
            } else if (user.getRole().equals(Role.CLIENT)) {
                return "redirect:/client/main";
            }
        }
        return "redirect:/login";
    }

    @GetMapping("/profile")
    public String getProfilePage(Authentication authentication, @ModelAttribute("model") ModelMap model) {
        User user = service.getUserByAuthentication(authentication);
        if (user.getRole() == Role.ADMIN) {
            return "redirect:/admin";
        } else if (user.getRole() == Role.MANAGER) {
            return "redirect:/manager/profile";
        } else if (user.getRole().equals(Role.COACH)) {
            return "redirect:/coach/profile";
        } else if (user.getRole().equals(Role.STRINGER)) {
            return "redirect:/stringer/profile";
        } else if (user.getRole().equals(Role.CLIENT)) {
            return "redirect:/client/profile";
        }

    }


}