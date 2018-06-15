package ru.kpfu.itis.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.security.role.Role;
import ru.kpfu.itis.app.services.AuthenticationService;

@Controller

public class GalleryController{
    @Autowired
    private AuthenticationService authenticationService;

        @GetMapping("/gallery")
    public String getGalleryPage(@ModelAttribute("model") ModelMap model, Authentication authentication) {
            System.out.println("in gallery");
            User user = authenticationService.getUserByAuthentication(authentication);
            System.out.println(user.getRole().getText());
        model.addAttribute("role", user.getRole().getText());

        return "gallery";
    }
}
