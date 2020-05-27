package com.group4.airbnb.domain;

import lombok.Getter;
import org.springframework.data.annotation.Id;


@Getter
public class HouseImage {

    @Id
    private Long houseImageId;

    private House house;

    private String url;


}
