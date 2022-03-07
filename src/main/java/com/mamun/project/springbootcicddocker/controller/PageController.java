package com.mamun.project.springbootcicddocker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping({"/", "/home"})
    String homePage(){
        return "page/home";
    }

    @RequestMapping("/about")
    String about(){
        return "page/about";
    }

    @RequestMapping("/contact")
    String contact(){
        return "page/contact";
    }

}
