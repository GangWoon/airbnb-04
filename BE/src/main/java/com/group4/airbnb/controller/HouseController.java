package com.group4.airbnb.controller;
import com.group4.airbnb.dto.HouseOverViewDTO;
import com.group4.airbnb.service.HouseService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;
@RestController
@RequestMapping("/api/airbnb")
public class HouseController {
    private final HouseService houseService;
    public HouseController(HouseService houseService) {
        this.houseService = houseService;
    }
    @GetMapping("/homes")
    public ResponseEntity<List<HouseOverViewDTO>> showHouses(@RequestParam(name = "offset", required = false, defaultValue = "0") Long houseId,
                                                             @RequestParam(name = "checkin", required = false, defaultValue = "1999-12-30")
                                                             @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkInDate,
                                                             @RequestParam(name = "checkout", required = false, defaultValue = "1999-12-31")
                                                             @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkOutDate,
                                                             @RequestParam(name = "adults", required = false, defaultValue = "1") int adults,
                                                             @RequestParam(name = "children", required = false, defaultValue = "0") int children,
                                                             @RequestParam(name = "infants", required = false, defaultValue = "0") int infants,
                                                             @RequestParam(name = "min_price", required = false, defaultValue = "0") int minPrice,
                                                             @RequestParam(name = "max_price", required = false, defaultValue = "1000000000") int maxPrice,
                                                             @RequestParam(name = "search", required = false, defaultValue = "") String search
                                                             ) {
        return ResponseEntity.ok().body(houseService.getAllHouses(houseId, checkInDate, checkOutDate, adults, children, infants, minPrice, maxPrice, search));
    }
}