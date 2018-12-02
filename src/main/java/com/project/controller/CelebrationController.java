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

    @RequestMapping(value = "/admin/celebrations", produces = "text/plain;charset=UTF-8")
    public String getAllCelebrations(Model model)
    {
        model.addAttribute("listOfCelebrations",celebrationService.getAllCelebrations());
        model.addAttribute("celebration",new Celebration());
        return "/admins-tables/celebrations_table_view";
    }

    @RequestMapping(value = "/admin/celebrations/addCelebration", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
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
        return "redirect:/admin/celebrations";
    }

    @RequestMapping(value = "/admin/celebrations/updateCelebration/{id}", produces = "text/plain;charset=UTF-8")
    public String updateCelebration(@PathVariable("id")int celebrationId, Model model)
    {
        model.addAttribute("listOfCelebrations",celebrationService.getAllCelebrations());
        model.addAttribute("celebration",celebrationService.getCelebrationById(celebrationId));
        return "/admins-tables/celebrations_table_view";
    }

    @RequestMapping(value = "/admin/celebrations/deleteCelebration/{id}", produces = "text/plain;charset=UTF-8")
    public String deleteCelebration(@PathVariable("id")int celebrationId, Model model)
    {
        final Celebration celebrationDelete = celebrationService.getCelebrationById(celebrationId);
        celebrationService.deleteCelebration(celebrationDelete);
        return "redirect:/admin/celebrations";
    }


}
