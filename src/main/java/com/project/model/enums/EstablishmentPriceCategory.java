package com.project.model.enums;

public enum  EstablishmentPriceCategory {
    LOW("Низкая"),
    MEDIUM("Средняя"),
    High("Высокая");

    private final String name;

    EstablishmentPriceCategory(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
