package com.project.controller;

import com.project.model.Establishment;
import com.project.model.enums.EstablishmentPriceCategory;
import com.project.model.enums.EstablishmentType;
import com.project.service.EstablishmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EstablishmentController {

    @Autowired
    private final EstablishmentService establishmentService;

    public EstablishmentController(EstablishmentService establishmentService) {
        this.establishmentService = establishmentService;
    }

    @RequestMapping(value = "/establishments")
    public String getAllEstablishments(Model model)
    {
        model.addAttribute("listOfEstablishments",establishmentService.getAllEstablishments());
        model.addAttribute("establishment",new Establishment());
        model.addAttribute("priceCategory",EstablishmentPriceCategory.values());
        model.addAttribute("type",EstablishmentType.values());
        return "/establishmentAdmin/establishments";
    }

    @RequestMapping(value = "establishment/addEstablishment", method = RequestMethod.POST)
    public String addEstablishment(@ModelAttribute("celebration") Establishment establishment)
    {
        if(establishment.getId() == 0)
        {
            establishmentService.addEstablishment(establishment);
        }
        else
        {
            establishmentService.updateEstablishment(establishment);
        }
        return "redirect:/establishments";
    }

    @RequestMapping("/updateEstablishment/{id}")
    public String updateEstablishment(@PathVariable("id")int establishmentId, Model model)
    {
        model.addAttribute("listOfCelebrations",establishmentService.getAllEstablishments());
        model.addAttribute("celebration",establishmentService.getEstablishmentById(establishmentId));
        return "/establishmentAdmin/establishments";
    }

    @RequestMapping("/deleteEstablishment/{id}")
    public String deleteEstablishment(@PathVariable("id")int establishmentId, Model model)
    {
        final Establishment establishmentDelete = establishmentService.getEstablishmentById(establishmentId);
        establishmentService.deleteEstablishment(establishmentDelete);
        return "redirect:/establishments";
    }


}
