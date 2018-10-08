package com.project.dao;


import com.project.model.Celebration;
import com.project.model.Establishment;

import java.util.List;

public interface EstablishmentDao {

    public List<Establishment> getAllEstablishments();
    public Establishment getEstablishmentById(final int establishmentId);
    public void addEstablishment(final Establishment establishmentAdd);
    public void updateEstablishment(final Establishment establishmentUpdate);
    public void deleteEstablishment(final Establishment establishmentDelete);
    public List<Establishment> getEstablismentsByCelebration (final Celebration celebration);


}
