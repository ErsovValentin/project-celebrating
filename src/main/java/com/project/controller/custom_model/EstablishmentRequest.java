package com.project.controller.custom_model;

import com.project.model.Celebration;
import com.project.model.Establishment;
import com.project.model.enums.EstablishmentPriceCategory;
import com.project.model.enums.EstablishmentType;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class EstablishmentRequest {

    private int id;
    private String name;
    private int numberOfSeats;
    private EstablishmentType type;
    private EstablishmentPriceCategory priceCategory;
    private String description;
    private String address;
    private String contactInformation;
    private MultipartFile image;
    private List<Integer> celebrationsId;

    public EstablishmentRequest() {
    }

    public Establishment toEntity(final Set<Celebration> celebrationList)
    {
        Establishment establishment = new Establishment();
        establishment.setId(this.id);
        establishment.setName(this.name);
        establishment.setNumberOfSeats(this.numberOfSeats);
        establishment.setType(this.type);
        establishment.setPriceCategory(this.priceCategory);
        establishment.setDescription(this.description);
        establishment.setAddress(this.address);
        establishment.setContactInformation(this.contactInformation);
        establishment.setCelebrations(celebrationList);
        try {
            establishment.setImage(this.image.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return establishment;
    }

    public static EstablishmentRequest fromEntity(final Establishment establishment)
    {
        EstablishmentRequest establishmentRequest = new EstablishmentRequest();
        establishmentRequest.setId(establishment.getId());
        establishmentRequest.setName(establishment.getName());
        establishmentRequest.setNumberOfSeats(establishment.getNumberOfSeats());
        establishmentRequest.setType(establishment.getType());
        establishmentRequest.setPriceCategory(establishment.getPriceCategory());
        establishmentRequest.setDescription(establishment.getDescription());
        establishmentRequest.setAddress(establishment.getAddress());
        establishmentRequest.setContactInformation(establishment.getContactInformation());
        List<Integer> celebrations = new ArrayList<Integer>();
        for (Celebration cel:establishment.getCelebrations()) {
            celebrations.add(cel.getId());
        }
        establishmentRequest.setCelebrationsId(celebrations);
//        establishmentRequest.setImage(establishment.getImage());

        return establishmentRequest;
    }

    @Override
    public String toString() {
        return "EstablishmentRequest{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", numberOfSeats=" + numberOfSeats +
                ", type=" + type +
                ", priceCategory=" + priceCategory +
                ", description='" + description + '\'' +
                ", address='" + address + '\'' +
                ", contactInformation='" + contactInformation + '\'' +
                ", celebrationsId=" + celebrationsId +
                '}';
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

    public EstablishmentType getType() {
        return type;
    }

    public void setType(EstablishmentType type) {
        this.type = type;
    }

    public EstablishmentPriceCategory getPriceCategory() {
        return priceCategory;
    }

    public void setPriceCategory(EstablishmentPriceCategory priceCategory) {
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

    public List<Integer> getCelebrationsId() {
        return celebrationsId;
    }

    public void setCelebrationsId(List<Integer> celebrationsId) {
        this.celebrationsId = celebrationsId;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }
}
