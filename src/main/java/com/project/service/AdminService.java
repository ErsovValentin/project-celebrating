package com.project.service;

import com.project.dao.AdminDao;
import com.project.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AdminService {

    @Autowired
    private final AdminDao adminDao;

    public AdminService(final AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    public List<Admin> getAllAdmins()
    {
        return adminDao.getAllAdmins();
    }

    public Admin getAdminById(final int adminId)
    {
        return adminDao.getAdminById(adminId);
    }

    public void addAdmin(final Admin adminAdd)
    {
       adminDao.addAdmin(adminAdd);
    }

    public void updateAdmin(final Admin adminUpdate)
    {
        adminDao.updateAdmin(adminUpdate);
    }

    public void deleteAdmin(final Admin adminDelete)
    {
        adminDao.deleteAdmin(adminDelete);
    }


}
