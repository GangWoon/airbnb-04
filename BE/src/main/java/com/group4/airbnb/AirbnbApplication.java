package com.group4.airbnb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

@SpringBootApplication
public class AirbnbApplication {

    public static void main(String[] args) {

        SpringApplication.run(AirbnbApplication.class, args);

    }

}
