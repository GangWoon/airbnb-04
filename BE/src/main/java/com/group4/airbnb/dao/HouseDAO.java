package com.group4.airbnb.dao;

import com.group4.airbnb.dto.HouseOverViewDTO;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class HouseDAO {

    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public HouseDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public List<HouseOverViewDTO> findAllHouseOverViews(Long houseId) {
        String sql = "SELECT house_id, house_name, host_is_super, room_type, bed_room_count, rate, review_count FROM house LIMIT :house_id, 10";
        SqlParameterSource sqlParameterSource;

        if(houseId == 1) {
            sqlParameterSource = new MapSqlParameterSource("house_id", houseId-1);
        } else {
            sqlParameterSource = new MapSqlParameterSource("house_id", houseId);
        }

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

                house.setImages(findImages(rs.getLong("house_id")));
                return house;
            }
        });
        return houses;
    }

    private List<String> findImages(Long houseId) {
        String sql ="SELECT url from house_image where house_id = :house_id";
        SqlParameterSource namedParameters = new MapSqlParameterSource("house_id", houseId);
        return namedParameterJdbcTemplate.queryForList(sql, namedParameters, String.class);
    }
}
