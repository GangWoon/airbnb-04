package com.group4.airbnb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

@SpringBootApplication
public class AirbnbApplication {

    public static void main(String[] args) {

        LocalDate start = LocalDate.now();
        LocalDate end = LocalDate.now().plusMonths(1).with(TemporalAdjusters.lastDayOfMonth());

        System.out.println("start date : " + start);
        System.out.println("end date : " + end);

        Practice practice = new Practice(start, end);
        System.out.println("dates : " + practice.toList());
        SpringApplication.run(AirbnbApplication.class, args);

    }

}
