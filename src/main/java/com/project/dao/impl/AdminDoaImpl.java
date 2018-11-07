package com.project.dao.impl;

import com.project.dao.AdminDao;
import com.project.model.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class AdminDoaImpl implements AdminDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public AdminDoaImpl(final SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session session()
    {
        return sessionFactory.getCurrentSession();
    }

    public List<Admin> getAllAdmins()
    {
        return (ArrayList<Admin>)session()
                .createQuery("from Admin", Admin.class)
                .list();
    }

    public Admin getAdminById(int adminId) {
        return (Admin)session()
                .get(Admin.class, adminId);
    }

    public void addAdmin(Admin adminAdd) {
        session()
                .save(adminAdd);
    }

    public void updateAdmin(Admin adminUpdate) {
        session()
                .merge(adminUpdate);
    }

    public void deleteAdmin(Admin adminDelete) {
        session()
                .delete(adminDelete);
    }
}
