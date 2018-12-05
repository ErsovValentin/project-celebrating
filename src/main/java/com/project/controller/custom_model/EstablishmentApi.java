package com.project.controller.custom_model;

import com.project.model.Establishment;
import com.project.model.enums.EstablishmentPriceCategory;
import com.project.model.enums.EstablishmentType;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class EstablishmentApi {

    private int id;
    private String name;
    private int numberOfSeats;
    private String type;
    private String priceCategory;
    private String description;
    private String address;
    private String contactInformation;

    public static EstablishmentApi fromEntity(final Establishment establishment){
        EstablishmentApi api= new EstablishmentApi();
        api.setId(establishment.getId());
        api.setName(establishment.getName());
        api.setNumberOfSeats(establishment.getNumberOfSeats());
        api.setType(establishment.getType().getName());
        api.setPriceCategory(establishment.getPriceCategory().getName());
        api.setDescription(establishment.getDescription());
        api.setAddress(establishment.getAddress());
        api.setContactInformation(establishment.getContactInformation());

        return api;
    }

    public EstablishmentApi() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPriceCategory() {
        return priceCategory;
    }

    public void setPriceCategory(String priceCategory) {
        this.priceCategory = priceCategory;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactInformation() {
        return contactInformation;
    }

    public void setContactInformation(String contactInformation) {
        this.contactInformation = contactInformation;
    }
}
