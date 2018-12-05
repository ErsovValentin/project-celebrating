package com.project.controller;

import com.project.controller.custom_model.EstablishmentApi;
import com.project.model.Establishment;
import com.project.service.EstablishmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class AjaxApiController {

    @Autowired
    private final EstablishmentService establishmentService;

    public AjaxApiController(EstablishmentService establishmentService) {
        this.establishmentService = establishmentService;
    }

    @RequestMapping(value= "/establishment/{id}", method = RequestMethod.GET)
    @ResponseBody
    public EstablishmentApi getById(@PathVariable("id")int establishmentId) {
        Establishment establishment = establishmentService.getEstablishmentById(establishmentId);
        return EstablishmentApi.fromEntity(establishment);
    }

}
