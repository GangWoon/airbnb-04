package com.group4.airbnb.domain;

import lombok.Getter;
import org.springframework.data.annotation.Id;

@Getter
public class HouseBadge {

    @Id
    private Long houseBadgeId;

    private House house;

    private String cancellationPolicy;

    private String transit;

    private String hostResponseTime;

    private String amenities;



}
