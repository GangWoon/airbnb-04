package com.group4.airbnb.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;


@Getter @Setter @ToString
public class User {

    @Id
    private Long userId;

    private String email;
}
