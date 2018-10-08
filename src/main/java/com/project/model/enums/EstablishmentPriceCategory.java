package com.project.model.enums;

public enum  EstablishmentPriceCategory {
    LOW("Low"),
    MEDIUM("Medium"),
    High("High");

    private final String name;

    EstablishmentPriceCategory(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
