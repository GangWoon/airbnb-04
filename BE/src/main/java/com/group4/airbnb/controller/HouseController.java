package com.group4.airbnb.controller;
import com.group4.airbnb.dto.BookingDTO;
import com.group4.airbnb.dto.HouseDetailDTO;
import com.group4.airbnb.dto.HouseOverViewDTO;
import com.group4.airbnb.service.BookingService;
import com.group4.airbnb.service.BookmarkService;
import com.group4.airbnb.service.HouseService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;
@RestController
@RequestMapping("/api/airbnb/houses")
public class HouseController {

    private final HouseService houseService;
    private final BookingService bookingService;
    private final BookmarkService bookmarkService;


    public HouseController(HouseService houseService, BookingService bookingService, BookmarkService bookmarkService) {
        this.houseService = houseService;
        this.bookingService = bookingService;
        this.bookmarkService = bookmarkService;
    }
    @GetMapping("")
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

    @GetMapping("/{houseId}/details")
    public ResponseEntity<HouseDetailDTO> showHouseDetails(@PathVariable Long houseId) {
        return ResponseEntity.ok().body(houseService.getHouseDetail(houseId));
    }

    @PostMapping("/{houseId}/book")
    public ResponseEntity<String> reserve(@PathVariable Long houseId,
                                          @RequestParam(name = "checkin", defaultValue = "1999-12-30")
                                          @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkInDate,
                                          @RequestParam(name = "checkout", defaultValue = "1999-12-31")
                                          @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkOutDate,
                                          @RequestParam(name = "adults", defaultValue = "1") int adults,
                                          @RequestParam(name = "children", defaultValue = "0") int children,
                                          @RequestParam(name = "infants", defaultValue = "0") int infants
                                          ) {
        bookingService.updateBooking(houseId, checkInDate, checkOutDate, adults, children, infants);
        return ResponseEntity.ok().body("예약 성공");
    }

    @PostMapping("/{houseId}/bookmark")
    public ResponseEntity<String> makeBookmark(@PathVariable Long houseId) {
        return ResponseEntity.ok().body(bookmarkService.updateBookmark(houseId));
    }

    //TODO: 현지야 오오쓰해!
    @GetMapping("/{userId}/favorites")
    public ResponseEntity<List<HouseOverViewDTO>> getFavorites(@PathVariable Long userId) {
        return ResponseEntity.ok().body(bookmarkService.getBookmarks(userId));
    }

    @GetMapping("/{userId}/bookings")
    public ResponseEntity<BookingDTO> showBookingPage(@PathVariable Long userId) {
        return ResponseEntity.ok().body(bookingService.getBooking(userId));
    }

    @DeleteMapping("/{bookingId}/cancel")
    public ResponseEntity<String> cancelBooking(@PathVariable Long bookingId) {
        bookingService.cancelBooking(bookingId);
        return ResponseEntity.ok().build();
    }
}