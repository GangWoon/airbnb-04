package com.group4.airbnb.service;

import com.group4.airbnb.GithubToken;
import com.group4.airbnb.domain.User;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginService {

    public String login(String code) {
        GithubToken githubToken = getAccessToken(code);
//        User user = getUserInfo(githubToken.getAccess_token());
        String user = getUserInfo(githubToken.getAccess_token());
        System.out.println(user);
//        String jwt = makeJwt(user);
//        return jwt;
        return null;
    }

    private GithubToken getAccessToken(String code) {
        String uri = "https://github.com/login/oauth/access_token";
        String clientId = "4195f35e672276a650ad";
        String clientSecret = "5f52a4a4b9bb2c7ae5488c52bb7445a1b0ea3466";

        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        Map<String, String> header = new HashMap<>();
        header.put("Accept", "application/json");
        headers.setAll(header);

        MultiValueMap<String, String> requestPayloads = new LinkedMultiValueMap<>();
        Map<String, String> requestPayload = new HashMap<>();
        requestPayload.put("client_id", clientId);
        requestPayload.put("client_secret", clientSecret);
        requestPayload.put("code", code);
        requestPayloads.setAll(requestPayload);

        HttpEntity<?> request = new HttpEntity<>(requestPayloads, headers);
        ResponseEntity<?> response = new RestTemplate().postForEntity(uri, request, GithubToken.class);
        return (GithubToken)response.getBody();
    }




    private String getUserInfo(String access_token) {

        String uri = "https://api.github.com/users";

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(access_token);
        headers.set("X-Oauth-Scope", "user:email");
        HttpEntity entity = new HttpEntity(headers);

        ResponseEntity<String> response = new RestTemplate().exchange(uri, HttpMethod.GET, entity, String.class);

        if(response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }

        return null;

//        Authorization: token OAUTH-TOKEN
//        GET https://api.github.com/user
//        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
//        Map<String, String> header = new HashMap<>();
//        header.put("Authorization", access_token);
//        headers.setAll(header);
//
//        HttpEntity<?> request = new HttpEntity<>(headers);
//        ResponseEntity<?> response = new RestTemplate().getForEntity(uri, String.class, request);
//        return (GithubToken)response.getBody();
//
//
//        System.out.println((String)response.getBody());
//        return "1";
    }
}
