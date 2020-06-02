package com.group4.airbnb.dto;


import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.springframework.data.relational.core.mapping.Column;

import java.util.List;
import java.util.Map;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class HouseDetailDTO {

    private Long houseId;
    private List<String> images;
    private String houseName;
    private String address;
    private int originalPrice;
    private int salePrice;
    private String hostName;
    private String hostImage;
    private boolean hostIsSuper;
    private String roomType;
    private int guestCount;
    private int bedRoomCount;
    private int bedCount;
    private int bathCount;
    private BadgeDTO badge;
    private float latitude;
    private float longitude;

    private int rate;
    private int reviewCount;
    private boolean favorite;

}
