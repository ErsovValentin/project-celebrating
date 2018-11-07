package com.project.dao.impl;

import com.project.dao.CelebrationDao;
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
public class CelebrationDaoImpl implements CelebrationDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public CelebrationDaoImpl(final SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session session() {
        return sessionFactory.getCurrentSession();
    }


    public List<Celebration> getAllCelebrations() {
        return (ArrayList<Celebration>)session()
                .createQuery("from Celebration", Celebration.class)
                .list();
    }

    public Celebration getCelebrationById(int celebrationId) {
        return (Celebration)session()
                .get(Celebration.class, celebrationId);
    }

    public void addCelebration(Celebration celebrationAdd) {
        session()
                .save(celebrationAdd);
    }

    public void updateCelebration(Celebration celebrationUpdate) {
        session()
                .merge(celebrationUpdate);
    }

    public void deleteCelebration(Celebration celebrationDelete) {
        session()
                .delete(celebrationDelete);

    }

    public List<Celebration> getCelebrationsByEstablishment(Establishment establishment) {
        return (ArrayList<Celebration>)session()
                .createQuery("select e.celebrations from Establishment e where e.id = ?1")
                .setParameter(1,establishment.getId())
                .list();
    }
}
