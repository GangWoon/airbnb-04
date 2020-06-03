package com.group4.airbnb.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class BookingDTO {

    private String roomType;
    private String houseUrl;
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


}
