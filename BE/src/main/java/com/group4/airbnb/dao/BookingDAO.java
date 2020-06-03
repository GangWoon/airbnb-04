package com.group4.airbnb.dao;

import com.group4.airbnb.dto.BookingDTO;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.time.LocalDate;

@Repository
public class BookingDAO {

    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    public BookingDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public void makeBooking(Long houseId, LocalDate checkInDate, LocalDate checkOutDate, int guestCount, int nightCount) {
        String sql =
                "insert into booking (house_id, user_id, check_in_date, check_out_date, guest_count, night_count) " +
                        "values (:house_id, 1, :check_in_date, :check_out_date, :guest_count, :night_count) ";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("house_id", houseId)
                .addValue("check_in_date", checkInDate)
                .addValue("check_out_date", checkOutDate)
                .addValue("night_count", nightCount)
                .addValue("guest_count", guestCount);
        namedParameterJdbcTemplate.update(sql, sqlParameterSource);

    }

    public BookingDTO findBooking(Long userId) {
        String sql = "SELECT h.room_type, h.review_count, h.rate, h.cleaning_fee, h.original_price, h.sale_price, " +
                "i.url, b.check_in_date, b.check_out_date, b.night_count, b.guest_count, b.booking_id " +
                "FROM house h " +
                "JOIN house_image i " +
                "ON h.house_id = i.house_id " +
                "JOIN booking b " +
                "ON h.house_id = b.house_id " +
                "WHERE b.user_id = ? LIMIT 1";
        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, BeanPropertyRowMapper.newInstance(BookingDTO.class));
    }

    public void deleteBooking(Long bookingId) {
        String sql = "DELETE FROM booking b WHERE b.booking_id = ?";
        jdbcTemplate.update(sql, bookingId);
    }
}
