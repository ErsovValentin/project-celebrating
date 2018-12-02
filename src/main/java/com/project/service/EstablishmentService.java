package com.project.service;

import com.project.dao.EstablishmentDao;
import com.project.model.Celebration;
import com.project.model.Establishment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstablishmentService {

    @Autowired
    private final EstablishmentDao establishmentDao;

    public EstablishmentService(EstablishmentDao establishmentDao) {
        this.establishmentDao = establishmentDao;
    }

    public List<Establishment> getAllEstablishments()
    {
        return establishmentDao.getAllEstablishments();
    }

    public Establishment getEstablishmentById(final int establishmentId)
    {
        return establishmentDao.getEstablishmentById(establishmentId);
    }

    public void addEstablishment(final Establishment establishmentAdd)
    {
        establishmentDao.addEstablishment(establishmentAdd);
    }

    public void updateEstablishment(final Establishment establishmentUpdate)
    {
        establishmentDao.updateEstablishment(establishmentUpdate);
    }

    public void deleteEstablishment(final Establishment establishmentDelete)
    {
        establishmentDao.deleteEstablishment(establishmentDelete);
    }

    public List<Establishment> getEstablishmentsByCelebration(final Celebration celebration)
    {
        return establishmentDao.getEstablismentsByCelebration(celebration);
    }

    public List<Establishment> getEstablishmentsByCelebrationAndNumberOfSeats(final Celebration celebration, final int numberOfSeats)
    {
        return establishmentDao.getEstablishmentsByCelebrationAndNumberOfSeats(celebration, numberOfSeats);
    }

    public List<Establishment> getRandomEstablishments()
    {
        return establishmentDao.getRandomEstablishments();
    }
}
