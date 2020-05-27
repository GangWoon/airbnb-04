package com.group4.airbnb.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class HouseDetailDTO {
    private Long houseId;
    private List<String> images;
    private String name;
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
    private List<BadgeDTO> badges;

    private int rate;
    private int reviewCount;
    private boolean favorite;

}
