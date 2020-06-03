package com.group4.airbnb.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class BookingDTO {

    private String roomType;
    private String url;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private int guestCount;
    private int originalPrice;
    private int salePrice;
    private int reviewCount;
    private int rate;
    private int nightCount;
    private int roomCharge;
    private int cleaningFee;
    private int serviceFee;
    private int taxes;
    private int total;

    public void calculate() {
        calculateRoomCharge();
        calculateServiceFee();
        calculateTaxes();
        calculateTotal();
    }

    public void calculateRoomCharge() {
        this.roomCharge = salePrice * nightCount;
    }

    public void calculateServiceFee() {
        this.serviceFee = (int) (roomCharge * 0.08);
    }

    public void calculateTaxes() {
        this.taxes = (int) (roomCharge * 0.1);
    }

    public void calculateTotal() {
        this.total = roomCharge + serviceFee + taxes + cleaningFee;
    }

}
