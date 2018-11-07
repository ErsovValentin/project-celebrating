package com.project.dao;

import com.project.model.Admin;

import java.util.List;

public interface AdminDao {

    public List<Admin> getAllAdmins();
    public Admin getAdminById(int adminId);
    public void addAdmin(Admin adminAdd);
    public void updateAdmin(Admin adminUpdate);
    public void deleteAdmin(Admin adminDelete);
}
