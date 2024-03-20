package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class PoiVO {
	private int poi_idx;
	private String poi_name;
	private String poi_addr;
	private String poi_desc;
	private double poi_lat;
	private double poi_lng;
	private String poi_tag;
	private String poi_runingtime;
	private String poi_offday;
	private String poi_img_location;
	
}
