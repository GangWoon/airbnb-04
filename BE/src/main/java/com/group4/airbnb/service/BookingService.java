package com.group4.airbnb.service;

import com.group4.airbnb.Practice;
import com.group4.airbnb.dao.BookingDAO;
import com.group4.airbnb.dao.BookmarkDAO;
import com.group4.airbnb.dto.BookingDTO;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class BookingService {

    private BookingDAO bookingDAO;

    public BookingService(BookingDAO bookingDAO) {
        this.bookingDAO = bookingDAO;
    }

    public void updateBooking(Long houseId, LocalDate checkInDate, LocalDate checkOutDate, int adults, int children, int infants) {
        int guestCount = adults + children + infants;
        bookingDAO.makeBooking(houseId, checkInDate, checkOutDate, guestCount, calculateNights(checkInDate, checkOutDate));
    }

    public int calculateNights(LocalDate checkIn, LocalDate checkOut) {
        LocalDate start = checkIn;
        LocalDate end = checkOut;

        Practice practice = new Practice(start, end);
        System.out.println("dates : " + practice.toList());
        int nightCount = practice.toList().size() - 1 ;
        return nightCount;
    }

    public BookingDTO getBooking(Long userId) {
        BookingDTO bookingDTO = bookingDAO.findBooking(userId);
        bookingDTO.calculate();
        return bookingDTO;
    }
}
