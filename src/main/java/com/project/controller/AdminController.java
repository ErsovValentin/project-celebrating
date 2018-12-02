package com.project.controller;

import com.project.model.Admin;
import com.project.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

    @Autowired
    private final AdminService adminService;

    public AdminController(AdminService adminService)
    {
        this.adminService = adminService;
    }

    @RequestMapping("/admin/admins")
    public String getAllAdmins(Model model)
    {
        model.addAttribute("listOfAdmins",adminService.getAllAdmins());
        model.addAttribute("admin",new Admin());
        return "/admins-tables/admins_table_view";
    }

    @RequestMapping(value = "/admin/admins/addAdmin",method = RequestMethod.POST)
    public String addAdmin (@ModelAttribute("admin") Admin admin)
    {
        if(admin.getId() == 0)
        {
            adminService.addAdmin(admin);
        }
        else
        {
            adminService.updateAdmin(admin);
        }
        return "redirect:/admin/admins";
    }

    @RequestMapping("/admin/admins/updateAdmin/{id}")
    public String updateAdmin(@PathVariable("id")int adminId, Model model)
    {
        model.addAttribute("listOfAdmins",adminService.getAllAdmins());
        model.addAttribute("admin",adminService.getAdminById(adminId));
        return "/admins-tables/admins_table_view";
    }

    @RequestMapping("/admin/admins/deleteAdmin/{id}")
    public String deleteAdmin(@PathVariable("id")int adminId)
    {
        final Admin adminDelete = adminService.getAdminById(adminId);
        adminService.deleteAdmin(adminDelete);
        return "redirect:/admin/admins";
    }

}
