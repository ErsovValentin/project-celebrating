package com.project.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "celebration")
public class Celebration {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "cel_id")
    private int id;

    @Column(name = "cel_name", length = 50, nullable = false)
    private String name;

    @ManyToMany(mappedBy = "celebrations", fetch = FetchType.EAGER)
    private Set<Establishment> establishments;

    public Celebration() {
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

    public Set<Establishment> getEstablishments() {
        return establishments;
    }

    public void setEstablishments(Set<Establishment> establishments) {
        this.establishments = establishments;
    }

    @Override
    public String toString() {
        return "Celebration{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", establishments=" + establishments +
                '}';
    }
}
