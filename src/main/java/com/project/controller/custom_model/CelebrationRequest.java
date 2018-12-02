package com.project.controller.custom_model;

public class CelebrationRequest {

    private int celebrationId;

    private int numberOfSeats;

    public CelebrationRequest() {
    }

    public int getCelebrationId() {
        return celebrationId;
    }

    public void setCelebrationId(int celebrationId) {
        this.celebrationId = celebrationId;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    @Override
    public String toString() {
        return "CelebrationRequest{" +
                "celebrationId=" + celebrationId +
                ", nuberOfSeats=" + numberOfSeats +
                '}';
    }
}
