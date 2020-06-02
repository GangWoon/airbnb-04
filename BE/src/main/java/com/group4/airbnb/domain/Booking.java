package com.group4.airbnb.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDate;

public class Booking {

    @Id
    private Long bookingId;

    private LocalDate checkInDate;

    private LocalDate checkOutDate;

    private int guestCount;

    private int nightCount;
}

