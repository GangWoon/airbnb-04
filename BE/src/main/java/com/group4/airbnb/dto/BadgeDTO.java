package com.group4.airbnb.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class BadgeDTO {
    private String cancellationPolicy;
    private String transit;
    private String hostResponseTime;
    private String amenities;
}


