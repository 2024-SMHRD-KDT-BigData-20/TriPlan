package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor


public class PoiVO {
	@NonNull
	private int poi_idx;
	@NonNull
	private String poi_name;
	private String poi_addr;
	private String poi_desc;
	private double poi_lat;
	private double poi_lng;
	@NonNull
	private String poi_tag;
	private String poi_runingtime;
	private String poi_offday;
	private String poi_img_location;
	
	public PoiVO(@NonNull int poi_idx, @NonNull String poi_name, String poi_addr, String poi_desc, double poi_lat,
			double poi_lng, @NonNull String poi_tag, String poi_img_location) {
		super();
		this.poi_idx = poi_idx;
		this.poi_name = poi_name;
		this.poi_addr = poi_addr;
		this.poi_desc = poi_desc;
		this.poi_lat = poi_lat;
		this.poi_lng = poi_lng;
		this.poi_tag = poi_tag;
		this.poi_img_location = poi_img_location;
	}
	
	
	
}
