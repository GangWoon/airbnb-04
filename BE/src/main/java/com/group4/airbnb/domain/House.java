package com.group4.airbnb.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
public class House {

    @Id
    private Long houseId;

    private String houseName;

    private boolean hostIsSuper;

    private String roomType;

    private int bedRoomCount;

    private int rate;

    private int reviewCount;

    private int originalPrice;

    private int salePrice;

    private String address;

    private String hostName;

    private String hostImage;

    private int guestCount;

    private int bedCount;

    private int bathCount;

    private int adultCount;

    private int childCount;

    private int infantCount;

    private float longitude;

    private float latitude;

    private int cleaning_fee;

}
