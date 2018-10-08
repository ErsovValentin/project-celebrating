package com.project.model;


import com.sun.istack.internal.NotNull;
import com.project.model.enums.EstablishmentPriceCategory;
import com.project.model.enums.EstablishmentType;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "establishment")
public class Establishment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "est_id")
    private int id;

    @Column(name = "est_name", length = 50)
    @NotNull
    private String name;

    @Column(name = "est_num_seats")
    @NotNull
    private int numberOfSeats;

    @Enumerated(EnumType.STRING)
    @Column(name = "est_type")
    @NotNull
    private EstablishmentType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "est_price_cat")
    @NotNull
    private EstablishmentPriceCategory priceCategory;

    @Column(name = "est_description",columnDefinition = "text")
    @NotNull
    private String description;

    @Column(name = "est_address", length = 50)
    @NotNull
    private String address;

    @Column(name = "est_contact_info",columnDefinition = "text")
    @NotNull
    private String contactInformation;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "est_cel",
                joinColumns = @JoinColumn(name = "est_id"),
                inverseJoinColumns = @JoinColumn(name = "cel_id"))
    private Set<Celebration> celebrations;

    public Establishment() {
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

    public Set<Celebration> getCelebrations() {
        return celebrations;
    }

    public void setCelebrations(Set<Celebration> celebrations) {
        this.celebrations = celebrations;
    }

    @Override
    public String toString() {
        return "Establishment{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", numberOfSeats=" + numberOfSeats +
                ", type=" + type +
                ", priceCategory=" + priceCategory +
                ", description='" + description + '\'' +
                ", address='" + address + '\'' +
                ", contactInformation='" + contactInformation + '\'' +
                '}';
    }
}
