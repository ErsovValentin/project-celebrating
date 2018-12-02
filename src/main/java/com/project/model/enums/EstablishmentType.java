package com.project.model.enums;

public enum EstablishmentType {
    RESTAURANT("Ресторан"),
    PIZZERIA("Пицерия"),
    FAST_FOOD("Fast-Food"),
    BAR("Бар"),
    PUB("Паб"),
    CAFE("Кафе"),
    CONFECTIONERY("Кофетерий"),
    CLUB("Клуб"),
    BANQUET_HALL("Banquet hall");

    private final String name;

    EstablishmentType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
