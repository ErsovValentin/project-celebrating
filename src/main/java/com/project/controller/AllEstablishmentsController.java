package com.project.controller;

import com.project.dao.CelebrationDao;
import com.project.dao.EstablishmentDao;
import com.project.service.CelebrationService;
import com.project.service.EstablishmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AllEstablishmentsController {

    @Autowired
    private final EstablishmentService establishmentService;

    @Autowired
    private final CelebrationService celebrationService;


    public AllEstablishmentsController(final EstablishmentService establishmentService,
                                       final CelebrationService celebrationService)
    {
        this.establishmentService = establishmentService;
        this.celebrationService = celebrationService;
    }

}
