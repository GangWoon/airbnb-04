package com.group4.airbnb.controller;

import com.group4.airbnb.dto.HouseOverViewDTO;
import com.group4.airbnb.service.HouseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class HouseController {

    private final HouseService houseService;

    public HouseController(HouseService houseService) {
        this.houseService = houseService;
    }

    @GetMapping("/{houseId}")
    public ResponseEntity<List<HouseOverViewDTO>> showHouses(@PathVariable Long houseId) {
        return ResponseEntity.ok().body(houseService.getAllHouses(houseId));
    }
}
