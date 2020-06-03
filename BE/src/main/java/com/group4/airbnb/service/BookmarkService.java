package com.group4.airbnb.service;

import com.group4.airbnb.dao.BookmarkDAO;
import com.group4.airbnb.dao.HouseDAO;
import com.group4.airbnb.dto.HouseOverViewDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.List;

@Service
public class BookmarkService {

    private BookmarkDAO bookmarkDAO;

    public BookmarkService(BookmarkDAO bookmarkDAO) {
        this.bookmarkDAO = bookmarkDAO;
    }

    public List<HouseOverViewDTO> getBookmarks(Long userId) {
        return bookmarkDAO.findBookmarks(userId);
    }


    public String updateBookmark(Long houseId) {
        if(bookmarkDAO.findBookmarkCount(houseId) >= 1) {
            bookmarkDAO.removeBookmark(houseId);
            return "삭제";
        } else {
            bookmarkDAO.makeBookmark(houseId);
            return "추가";
        }
    }
}
