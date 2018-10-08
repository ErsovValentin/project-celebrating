package com.project.service;

import com.project.dao.CelebrationDao;
import com.project.model.Celebration;
import com.project.model.Establishment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CelebrationService {

    @Autowired
    private final CelebrationDao celebrationDao;

    public CelebrationService(CelebrationDao celebrationDao) {
        this.celebrationDao = celebrationDao;
    }

    public List<Celebration> getAllCelebrations ()
    {
        return celebrationDao.getAllCelebrations();
    }

    public Celebration getCelebrationById(final int celebrationId)
    {
        return celebrationDao.getCelebrationById(celebrationId);
    }

    public void addCelebration(final Celebration celebrationAdd)
    {
        celebrationDao.addCelebration(celebrationAdd);
    }

    public void updateCelebration(final Celebration celebrationUpdate)
    {
        celebrationDao.updateCelebration(celebrationUpdate);
    }

    public void deleteCelebration(final Celebration celebrationDelete)
    {
        celebrationDao.deleteCelebration(celebrationDelete);
    }

    public List<Celebration> getCelebrationsByEstablishment(final Establishment establishment)
    {
        return celebrationDao.getCelebrationsByEstablishment(establishment);
    }
}
