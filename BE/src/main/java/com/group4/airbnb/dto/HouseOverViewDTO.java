package com.group4.airbnb.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HouseOverViewDTO {
    private Long house_id;
    private List<String> images;
    private String name;
    private boolean hostIsSuper;
    private String roomType;
    private int bedRoomCount;
    private int rate;
    private int reviewCount;
    private boolean favorite;
}
