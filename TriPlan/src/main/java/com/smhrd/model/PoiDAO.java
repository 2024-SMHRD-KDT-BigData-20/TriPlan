package com.smhrd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PoiDAO {
	private static final String URL = "jdbc:mysql://project-db-campus.smhrd.com:1523/xe";
    private static final String USERNAME = "sc_21K_bigdata20_p2_3";
    private static final String PASSWORD = "smhrd3";

    public List<PoiVO> getAllPOI() {
        List<PoiVO> poiList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
            String sql = "SELECT * FROM poi_info";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        PoiVO poi = new PoiVO();
                        poi.setPoi_idx(rs.getInt("poi_idx"));
                        poi.setPoi_name(rs.getString("poi_name"));
                        poi.setPoi_desc(rs.getString("poi_desc"));
                        poi.setPoi_runingtime(rs.getString("poi_runingtime"));
                        poi.setPoi_img_location(rs.getString("poi_img_location"));
                        poi.setPoi_lat(rs.getDouble("poi_lat"));
                        poi.setPoi_lng(rs.getDouble("poi_lng"));
                        poiList.add(poi);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return poiList;
    }
}