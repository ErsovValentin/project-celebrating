package com.project.controller;

import com.project.model.Celebration;
import com.project.service.CelebrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CelebrationController {

    @Autowired
    private final CelebrationService celebrationService;

    public CelebrationController(CelebrationService celebrationService) {
        this.celebrationService = celebrationService;
    }

    @RequestMapping("/")
    public String getIndex()
    {
        return "index";
    }

    @RequestMapping(value = "/celebrations")
    public String getAllCelebrations(Model model)
    {
        model.addAttribute("listOfCelebrations",celebrationService.getAllCelebrations());
        model.addAttribute("celebration",new Celebration());
        return "/celebrationAdmin/celebrations";
    }

    @RequestMapping(value = "celebrations/addCelebration", method = RequestMethod.POST)
    public String addCelebration(@ModelAttribute("celebration") Celebration celebration)
    {
        if(celebration.getId() == 0)
        {
            celebrationService.addCelebration(celebration);
        }
        else
        {
            celebrationService.updateCelebration(celebration);
        }
        return "redirect:/celebrations";
    }

    @RequestMapping("/updateCelebration/{id}")
    public String updateCelebration(@PathVariable("id")int celebrationId, Model model)
    {
        model.addAttribute("listOfCelebrations",celebrationService.getAllCelebrations());
        model.addAttribute("celebration",celebrationService.getCelebrationById(celebrationId));
        return "/celebrationAdmin/celebrations";
    }

    @RequestMapping("/deleteCelebration/{id}")
    public String deleteCelebration(@PathVariable("id")int celebrationId, Model model)
    {
        final Celebration celebrationDelete = celebrationService.getCelebrationById(celebrationId);
        celebrationService.deleteCelebration(celebrationDelete);
        return "redirect:/celebrations";
    }


}
