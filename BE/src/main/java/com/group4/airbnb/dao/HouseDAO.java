package com.group4.airbnb.dao;

import com.group4.airbnb.domain.House;
import com.group4.airbnb.dto.BadgeDTO;
import com.group4.airbnb.dto.HouseDetailDTO;
import com.group4.airbnb.dto.HouseOverViewDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@Repository
@Slf4j
public class HouseDAO {

    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    public HouseDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public List<HouseOverViewDTO> findAllHouseOverViews(Long houseId, LocalDate checkInDate, LocalDate checkOutDate, int adults, int children, int infants, int minPrice, int maxPrice, String search) {
        String sql = "SELECT DISTINCT house.house_id, house_name, host_is_super, room_type, bed_room_count, rate, review_count, latitude, longitude " +
                "FROM house " +
                "LEFT OUTER JOIN booking " +
                "ON house.house_id = booking.house_id " +
                "WHERE ((:check_out_date NOT BETWEEN DATE(booking.check_in_date) and DATE(booking.check_out_date) " +
                "AND DATE(booking.check_in_date) NOT BETWEEN :check_in_date and :check_out_date " +
                "AND DATE(booking.check_out_date) NOT BETWEEN :check_in_date and :check_out_date " +
//                "AND :check_out_date !< DATE(booking.check_in_date)) " +
                "AND DATE(booking.check_out_date) NOT BETWEEN :check_in_date and :check_out_date) " +
                "OR DATE(booking.check_in_date) IS NULL) " +
                "AND house.adult_count >= :adults " +
                "AND house.child_count >= :children " +
                "AND house.infant_count >= :infants " +
                "AND house.sale_price between :min_price and :max_price " +
                "AND house.house_name LIKE '%" + search + "%' " +
                "ORDER BY house_id " +
                "LIMIT :house_id, 10";

        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("check_in_date", checkInDate)
                                                                .addValue("check_out_date", checkOutDate)
                                                                .addValue("adults", adults)
                                                                .addValue("children", children)
                                                                .addValue("infants", infants)
                                                                .addValue("min_price", minPrice)
                                                                .addValue("max_price", maxPrice)
                                                                .addValue("house_id", houseId);

        List<HouseOverViewDTO> houses = namedParameterJdbcTemplate.query(sql,sqlParameterSource,new RowMapper<HouseOverViewDTO>() {
            @Override
            public HouseOverViewDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                HouseOverViewDTO house = new HouseOverViewDTO();
                house.setHouseId(rs.getLong("house_id"));
                house.setHouseName(rs.getString("house_name"));
                house.setHostIsSuper(rs.getBoolean("host_is_super"));
                house.setRoomType(rs.getString("room_type"));
                house.setBedRoomCount(rs.getInt("bed_room_count"));
                house.setRate(rs.getInt("rate"));
                house.setReviewCount(rs.getInt("review_count"));
                house.setLatitude(rs.getFloat("latitude"));
                house.setLongitude(rs.getFloat("longitude"));
                house.setImages(findImages(rs.getLong("house_id")));
                return house;
            }
        });
        return houses;
    }

    public List<String> findImages(Long houseId) {
        String sql ="SELECT url from house_image where house_id = :house_id";
        SqlParameterSource namedParameters = new MapSqlParameterSource("house_id", houseId);
        return namedParameterJdbcTemplate.queryForList(sql, namedParameters, String.class);
    }

    public HouseDetailDTO findHouseDetailById(Long houseId) {
        String sql = "SELECT h.house_id, house_name, address, original_price, sale_price, host_name, host_image, host_is_super, " +
                "room_type, guest_count,bed_room_count,bed_count,bath_count, rate, review_count " +
                "from house h " +
                "where h.house_id = " + houseId;
        return jdbcTemplate.queryForObject(sql, new Object[]{}, BeanPropertyRowMapper.newInstance(HouseDetailDTO.class));
    }

    public BadgeDTO findBadges(Long houseId) {
        String sql = "select cancellation_policy, transit, host_response_time, amenities from house_badge where house_id = " + houseId;
        return jdbcTemplate.queryForObject(sql, new Object[]{},BeanPropertyRowMapper.newInstance(BadgeDTO.class));
    }

    public void makeReservation(Long houseId, LocalDate checkInDate, LocalDate checkOutDate, int guestCount, int nightCount) {
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

    public void makeBookmark(Long houseId) {
        String sql = "insert into favorite (house_id, user_id) values (:house_id, :user_id)";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("house_id", houseId).addValue("user_id", 1);
        namedParameterJdbcTemplate.update(sql, sqlParameterSource);
    }

    public void removeBookmark(Long houseId) {
        String sql = "delete from favorite WHERE house_id = :house_id AND user_id = :user_id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("house_id", houseId).addValue("user_id", 1);
        namedParameterJdbcTemplate.update(sql, sqlParameterSource);
    }

    public int findBookmark(Long houseId) {
        String sql = "SELECT count(favorite_id) FROM favorite WHERE house_id = :house_id AND user_id = :user_id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("house_id", houseId).addValue("user_id", 1);
        return namedParameterJdbcTemplate.queryForObject(sql, sqlParameterSource, Integer.class);
    }

    public List<HouseOverViewDTO> findFavorites(Long userId) {
        String sql = "SELECT DISTINCT house.house_id, house_name, host_is_super, room_type, bed_room_count, rate, review_count, latitude, longitude " +
                "FROM house " +
                "JOIN favorite f " +
                "ON house.house_id = f.house_id " +
                "WHERE f.user_id = :user_id " +
                "ORDER BY house_id ";

        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("user_id", userId);

        List<HouseOverViewDTO> houses = namedParameterJdbcTemplate.query(sql,sqlParameterSource,new RowMapper<HouseOverViewDTO>() {
            @Override
            public HouseOverViewDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                HouseOverViewDTO house = new HouseOverViewDTO();
                house.setHouseId(rs.getLong("house_id"));
                house.setHouseName(rs.getString("house_name"));
                house.setHostIsSuper(rs.getBoolean("host_is_super"));
                house.setRoomType(rs.getString("room_type"));
                house.setBedRoomCount(rs.getInt("bed_room_count"));
                house.setRate(rs.getInt("rate"));
                house.setReviewCount(rs.getInt("review_count"));
                house.setLatitude(rs.getFloat("latitude"));
                house.setLongitude(rs.getFloat("longitude"));
                house.setImages(findImages(rs.getLong("house_id")));
                house.setFavorite(true);
                return house;
            }
        });
        return houses;
    }
}
