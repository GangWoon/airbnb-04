package com.group4.airbnb.service;
import com.group4.airbnb.Practice;
import com.group4.airbnb.dao.HouseDAO;
import com.group4.airbnb.dto.HouseDetailDTO;
import com.group4.airbnb.dto.HouseOverViewDTO;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
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


}