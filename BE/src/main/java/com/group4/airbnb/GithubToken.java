package com.group4.airbnb;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString
public class GithubToken {

    private String access_token;
    private String scope;
    private String token_type;


}
