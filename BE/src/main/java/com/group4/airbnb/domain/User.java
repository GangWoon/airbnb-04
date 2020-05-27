package com.group4.airbnb.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter
public class User {

    @Id
    private Long userId;

    private String email;
}
