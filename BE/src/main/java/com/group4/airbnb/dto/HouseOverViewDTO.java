package com.group4.airbnb.dto;

import lombok.*;

import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class HouseOverViewDTO {
    private Long houseId;
    private List<String> images;
    private String houseName;
    private boolean hostIsSuper;
    private String roomType;
    private int bedRoomCount;
    private int rate;
    private int reviewCount;
    private boolean favorite;
}
