package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorController {

    @RequestMapping(value = {"/errorPage"}, method = RequestMethod.GET)
    public String NotFoudPage(Model model) {
        model.addAttribute("errorCode", 404);
        return "errorPage";

    }

}
