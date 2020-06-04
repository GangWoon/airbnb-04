package com.group4.airbnb.controller;

import com.group4.airbnb.service.LoginService;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class LoginController {

    private LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping("/login")
    public void login(HttpServletResponse httpServletResponse) throws IOException {
        httpServletResponse.sendRedirect("https://github.com/login/oauth/authorize?client_id=4195f35e672276a650ad&scope=user%20repo");
    }

    @GetMapping("/github")
    public ResponseEntity<String> github(@RequestParam String code) {

        String jwt = loginService.login(code);


        String uri = "https://github.com/login/oauth/access_token?client_id=4195f35e672276a650ad&client_secret=5f52a4a4b9bb2c7ae5488c52bb7445a1b0ea3466&redirect_uri=http://localhost:8080/github&code=" + code;

        //TODO: 현지야 쿠키에 담아

        return ResponseEntity.ok().build();
//        System.out.println("현지");
//        System.out.println("code : " + code);
//        return ResponseEntity.ok().build();
    }
}
