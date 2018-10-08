package com.project.dao.impl;

import com.project.dao.EstablishmentDao;
import com.project.model.Celebration;
import com.project.model.Establishment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class EstablishmentDaoImpl implements EstablishmentDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public EstablishmentDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session session()
    {
        return sessionFactory.getCurrentSession();
    }

    public List<Establishment> getAllEstablishments() {
        return (ArrayList<Establishment>)session()
                .createQuery("from Establishment", Establishment.class)
                .list();
    }

    public Establishment getEstablishmentById(final int establishmentId) {
        return (Establishment)session()
                .get(Establishment.class, establishmentId);
    }

    public void addEstablishment(final Establishment establishmentAdd) {
        session()
                .save(establishmentAdd);
    }

    public void updateEstablishment(final Establishment establishmentUpdate) {
        session()
                .merge(establishmentUpdate);
    }

    public void deleteEstablishment(final Establishment establishmentDelete) {
        session()
                .delete(establishmentDelete);
    }

    public List<Establishment> getEstablismentsByCelebration(final Celebration celebration) {
        return (ArrayList<Establishment>)session()
                .createQuery("select c.establishments from Celebration c where c.id = ?1")
                .setParameter(1, celebration.getId())
                .list();
    }
}
