package com.project;

import com.project.config.SpringConfig;
import com.project.dao.CelebrationDao;
import com.project.dao.EstablishmentDao;
import com.project.model.Celebration;
import com.project.model.Establishment;
import com.project.model.enums.EstablishmentPriceCategory;
import com.project.model.enums.EstablishmentType;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.HashSet;
import java.util.Set;

public class Main {


    public static void main(String[] args) {
        final AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);

        final CelebrationDao celebrationDao = context.getBean(CelebrationDao.class);
        final EstablishmentDao establishmentDao = context.getBean(EstablishmentDao.class);

        Celebration celebrationAdd = new Celebration();
        celebrationAdd.setName("First");
        celebrationDao.addCelebration(celebrationAdd);
        System.out.println(celebrationDao.getAllCelebrations());

        Celebration celebrationAdd2 = new Celebration();
        celebrationAdd2.setName("Second");
        celebrationDao.addCelebration(celebrationAdd2);
        System.out.println(celebrationDao.getAllCelebrations());

        Celebration celebrationUpdate = celebrationDao.getCelebrationById(1);
        celebrationUpdate.setName("Not First");
        celebrationDao.updateCelebration(celebrationUpdate);


//        celebrationDao.deleteCelebration(celebrationDao.getCelebrationById(1));

        System.out.println(celebrationDao.getAllCelebrations());



        Establishment establishmentAdd = new Establishment();
        establishmentAdd.setName("First");
        establishmentAdd.setAddress("first/first");
        establishmentAdd.setContactInformation("022-first-first");
        establishmentAdd.setDescription("first,first,first,first");
        establishmentAdd.setNumberOfSeats(388);
        establishmentAdd.setPriceCategory(EstablishmentPriceCategory.MEDIUM);
        establishmentAdd.setType(EstablishmentType.RESTAURANT);

        establishmentDao.addEstablishment(establishmentAdd);

        Establishment establishmentAdd2 = new Establishment();
        establishmentAdd2.setName("Second");
        establishmentAdd2.setAddress("Second/Second");
        establishmentAdd2.setContactInformation("022-Second-Second");
        establishmentAdd2.setDescription("Second,Second,Second,Second");
        establishmentAdd2.setNumberOfSeats(388);
        establishmentAdd2.setPriceCategory(EstablishmentPriceCategory.MEDIUM);
        establishmentAdd2.setType(EstablishmentType.RESTAURANT);

        establishmentDao.addEstablishment(establishmentAdd2);

        System.out.println(establishmentDao.getAllEstablishments());


        Establishment establishmentUpdate = establishmentDao.getEstablishmentById(3);
        establishmentUpdate.setName("QWERTYUIODFGHJK");
        establishmentDao.updateEstablishment(establishmentUpdate);
        System.out.println(establishmentDao.getAllEstablishments());

//        establishmentDao.deleteEstablishment(establishmentDao.getEstablishmentById(3));
        System.out.println(establishmentDao.getAllEstablishments());



        Set<Establishment> establishments = new HashSet<Establishment>();
        establishments.add(establishmentAdd);

        Set<Celebration> celebrations = new HashSet<Celebration>();
        celebrations.add(celebrationAdd);




        celebrationAdd = celebrationDao.getCelebrationById(1);
        celebrationAdd.setEstablishments(establishments);
        celebrationDao.updateCelebration(celebrationAdd);

        establishmentAdd = establishmentDao.getEstablishmentById(3);
        establishmentAdd.setCelebrations(celebrations);
        establishmentDao.updateEstablishment(establishmentAdd);

        System.out.println(establishmentDao.getEstablismentsByCelebration(celebrationAdd));
        System.out.println(celebrationDao.getCelebrationsByEstablishment(establishmentAdd));







    }
}
