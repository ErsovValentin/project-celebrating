package com.project.dao;

import com.project.model.Celebration;
import com.project.model.Establishment;

import java.util.List;

public interface CelebrationDao {

    public List<Celebration> getAllCelebrations();
    public Celebration getCelebrationById(final int celebrationId);
    public void addCelebration(final Celebration celebrationAdd);
    public void updateCelebration(final Celebration celebrationUpdate);
    public void deleteCelebration(final Celebration celebrationDelete);
    public Celebration getCelebrationByName(final String name);
    public List<Celebration> getCelebrationsByEstablishment(final Establishment establishment);

}
