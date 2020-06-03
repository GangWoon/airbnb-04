package com.group4.airbnb.dao;

import com.group4.airbnb.dto.HouseOverViewDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BookmarkDAO {

    private HouseDAO houseDAO;
    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    public BookmarkDAO(DataSource dataSource, HouseDAO houseDAO) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        this.houseDAO = houseDAO;
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

    public int findBookmarkCount(Long houseId) {
        String sql = "SELECT count(favorite_id) FROM favorite WHERE house_id = :house_id AND user_id = :user_id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("house_id", houseId).addValue("user_id", 1);
        return namedParameterJdbcTemplate.queryForObject(sql, sqlParameterSource, Integer.class);
    }

    public List<HouseOverViewDTO> findBookmarks(Long userId) {
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
                house.setImages(houseDAO.findImages(rs.getLong("house_id")));
                house.setFavorite(true);
                return house;
            }
        });
        return houses;
    }
}
