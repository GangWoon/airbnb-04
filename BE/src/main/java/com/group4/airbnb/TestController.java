//package com.group4.airbnb;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.List;
//
//@RestController
//public class TestController {
//
//    @GetMapping
//    public void findAvailableHouses(LocalDate checkInDate, LocalDate checkOutDate) {
//        Practice practice = new Practice(checkInDate, checkOutDate);
//        List<LocalDate> reservedDates = practice.toList();
//
//
//        List<House> availableHouses = new ArrayList<>();
//
//        List<House> houses = new ArrayList<>();
//        for (House h : houses) {
//            if (!h.getDates().contains(reservedDates)) {
//                availableHouses.add(h);
//            }
//        }
//        return availableHouses;
//
//    }
//}
