package com.project.model.enums;

public enum EstablishmentType {
    RESTAURANT("Restaurant"),
    PIZZERIA("Pizzeria"),
    FAST_FOOD("Fast-Food"),
    BAR("Bar"),
    CAFE("Cafe"),
    CONFECTIONERY("Сonfectionery"),
    CLUB("Club"),
    BANQUET_HALL("Banquet hall");

    private final String name;

    EstablishmentType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
