package ru.kpfu.itis.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/main")
public class MainPageController {

    @GetMapping("")
    public String getMainPage(){
        return "main";
    }
}
