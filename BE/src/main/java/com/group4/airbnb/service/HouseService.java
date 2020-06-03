package com.group4.airbnb.service;
import com.group4.airbnb.AirbnbApplication;
import com.group4.airbnb.Practice;
import com.group4.airbnb.dao.HouseDAO;
import com.group4.airbnb.dto.HouseDetailDTO;
import com.group4.airbnb.dto.HouseOverViewDTO;
import org.springframework.boot.SpringApplication;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.List;
@Service
public class HouseService {
    private final HouseDAO houseDAO;
    public HouseService(HouseDAO houseDAO) {
        this.houseDAO = houseDAO;
    }
    public List<HouseOverViewDTO> getAllHouses(Long houseId, LocalDate checkInDate, LocalDate checkOutDate, int adults, int children, int infants, int minPrice, int maxPrice, String search) {
        return houseDAO.findAllHouseOverViews(houseId, checkInDate, checkOutDate, adults, children, infants, minPrice, maxPrice, search);
    }

    public HouseDetailDTO getHouseDetail(Long houseId) {
        HouseDetailDTO houseDetailDTO = houseDAO.findHouseDetailById(houseId);
        houseDetailDTO.setBadge(houseDAO.findBadges(houseId));
        houseDetailDTO.setImages(houseDAO.findImages(houseId));
        return houseDetailDTO;
    }

    public List<HouseOverViewDTO> getFavorites(Long userId) {
        return houseDAO.findFavorites(userId);
    }

    public void updateBooking(Long houseId, LocalDate checkInDate, LocalDate checkOutDate, int adults, int children, int infants) {
        int guestCount = adults + children + infants;
        houseDAO.makeReservation(houseId, checkInDate, checkOutDate, guestCount, calculateNights(checkInDate, checkOutDate));

    }

    public int calculateNights(LocalDate checkIn, LocalDate checkOut) {
        LocalDate start = checkIn;
        LocalDate end = checkOut;

        Practice practice = new Practice(start, end);
        System.out.println("dates : " + practice.toList());
        int nightCount = practice.toList().size() - 1 ;
        return nightCount;
    }

    public String updateBookmark(Long houseId) {
        if(houseDAO.findBookmark(houseId) >= 1) {
            houseDAO.removeBookmark(houseId);
            return "삭제";
        } else {
            houseDAO.makeBookmark(houseId);
            return "추가";
        }
    }
}