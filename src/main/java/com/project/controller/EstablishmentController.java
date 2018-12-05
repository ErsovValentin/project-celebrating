package com.project.controller;

import com.project.controller.custom_model.CelebrationRequest;
import com.project.controller.custom_model.EstablishmentRequest;
import com.project.model.Celebration;
import com.project.model.Establishment;
import com.project.model.enums.EstablishmentPriceCategory;
import com.project.model.enums.EstablishmentType;
import com.project.service.CelebrationService;
import com.project.service.EstablishmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class EstablishmentController {

    @Autowired
    private final EstablishmentService establishmentService;

    @Autowired
    private final CelebrationService celebrationService;

    public EstablishmentController(EstablishmentService establishmentService,
                                   CelebrationService celebrationService) {
        this.establishmentService = establishmentService;
        this.celebrationService = celebrationService;
    }

    //Admin Panel

    @RequestMapping(value = "/admin/establishments")
    public String getAllEstablishments(Model model)
    {
        model.addAttribute("listOfEstablishments",establishmentService.getAllEstablishments());
        model.addAttribute("establishment",new EstablishmentRequest());
        model.addAttribute("priceCategory",EstablishmentPriceCategory.values());
        model.addAttribute("type",EstablishmentType.values());
        model.addAttribute("listOfCelebrations",celebrationService.getAllCelebrations());
        return "/admins-tables/establishments_table_view";
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String handleUpload(@RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            byte[] bytes = file.getBytes();
            System.out.println(file.getOriginalFilename());
        }
        return "/test";
    }

    @RequestMapping(value = "/admin/establishments/addEstablishment", method = RequestMethod.POST)
    public String addEstablishment(@ModelAttribute("establishment") EstablishmentRequest establishmentRequest)
    {
        Set<Celebration> celebrations= new HashSet<Celebration>();
        for (Integer i:establishmentRequest.getCelebrationsId()) {
            celebrations.add(celebrationService.getCelebrationById(i));
        }
        Establishment establishment = establishmentRequest.toEntity(celebrations);

        if(establishment.getId() == 0)
        {
            establishmentService.addEstablishment(establishment);
        }
        else
        {
            establishmentService.updateEstablishment(establishment);
        }
        return "redirect:/admin/establishments";
    }

    @RequestMapping("/admin/establishments/updateEstablishment/{id}")
    public String updateEstablishment(@PathVariable("id")int establishmentId, Model model)
    {
        EstablishmentRequest establishmentRequest = EstablishmentRequest.fromEntity(establishmentService.getEstablishmentById(establishmentId));
        model.addAttribute("listOfEstablishments",establishmentService.getAllEstablishments());
        model.addAttribute("listOfCelebrations",establishmentService.getAllEstablishments());
        model.addAttribute("establishment",establishmentRequest);
        model.addAttribute("listOfCelebrations",celebrationService.getAllCelebrations());
        return "/admins-tables/establishments_table_view";
    }

    @RequestMapping("/admin/establishments/deleteEstablishment/{id}")
    public String deleteEstablishment(@PathVariable("id")int establishmentId, Model model)
    {
        final Establishment establishmentDelete = establishmentService.getEstablishmentById(establishmentId);
        establishmentService.deleteEstablishment(establishmentDelete);
        return "redirect:/admin/establishments";
    }
    //Admin Panel

    //All EStablishments
    @RequestMapping("/all-establishmnets")
    public String showAllEstablishments(Model model)
    {
        model.addAttribute("listOfEstablishments",establishmentService.getAllEstablishments());
        return "/main-functional/all_establishments_view";
    }
    //All EStablishments

    //Main functional
    @RequestMapping("/find-establishments")
    public String findEstablishments(Model model)
    {
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("customCelebration",new CelebrationRequest());
        model.addAttribute("listOfEstablishments",establishmentService.getAllEstablishments());
        return "/main-functional/find_establishment_view";
    }

    @RequestMapping(value = "find-establishments/founded",method = RequestMethod.GET)
    public String getEstablishmentsByCelebrationAndNumberOfSeats(@ModelAttribute("customCelebration") CelebrationRequest celebrationRequest,
                                                                 Model model)
    {
        final Celebration celebration = celebrationService.getCelebrationById(celebrationRequest.getCelebrationId());
        final List<Establishment> establishments = establishmentService.getEstablishmentsByCelebrationAndNumberOfSeats(celebration, celebrationRequest.getNumberOfSeats());
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("listOfEstablishments",establishments);
        return "/main-functional/find_establishment_view";
    }

    @RequestMapping(value = "find-establishments/getRandomEstablishments", method = RequestMethod.GET)
    public String getRandomEstablishments(Model model){
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("customCelebration",new CelebrationRequest());
        model.addAttribute("listOfEstablishments",establishmentService.getRandomEstablishments());
        return "/main-functional/find_establishment_view";
    }

    @RequestMapping(value = "find-establishments/celebrateNewYear",method = RequestMethod.GET)
    public String celebrateNewYear(Model model){
        List<Establishment> establishmentList = establishmentService.getEstablishmentsByCelebration(celebrationService.getCelebrationByName("Новый Год"));
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("customCelebration",new CelebrationRequest());
        model.addAttribute("listOfEstablishments",establishmentList);
        return "/main-functional/find_establishment_view";
    }

    @RequestMapping(value = "find-establishments/celebrateParty",method = RequestMethod.GET)
    public String celebrateParty(Model model){
        List<Establishment> establishmentList = establishmentService.getEstablishmentsByCelebration(celebrationService.getCelebrationByName("Вечеринка"));
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("customCelebration",new CelebrationRequest());
        model.addAttribute("listOfEstablishments",establishmentList);
        return "/main-functional/find_establishment_view";
    }

    @RequestMapping(value = "find-establishments/celebrateRomantic",method = RequestMethod.GET)
    public String celebrateRomantic(Model model){
        List<Establishment> establishmentList = establishmentService.getEstablishmentsByCelebration(celebrationService.getCelebrationByName("Романтика"));
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("customCelebration",new CelebrationRequest());
        model.addAttribute("listOfEstablishments",establishmentList);
        return "/main-functional/find_establishment_view";
    }

    @RequestMapping(value = "/test")
    public String test(Model model){
        model.addAttribute("celebrations",celebrationService.getAllCelebrations());
        model.addAttribute("customCelebration",new CelebrationRequest());
        model.addAttribute("listOfEstablishments",establishmentService.getAllEstablishments());
        return "/test";
    }

    @RequestMapping(value = "/imageController/{imageId}")
    @ResponseBody
    public byte[] getImage(@PathVariable int imageId)  {
        byte[] image = establishmentService.getEstablishmentById(imageId).getImage();
        return image;
    }


    //Main functional
}
