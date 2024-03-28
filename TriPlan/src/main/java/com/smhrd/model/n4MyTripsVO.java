package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class n4MyTripsVO {
	
	private int mt_idx;
	private String mt_name;
	private String mt_preference;
	private String user_id;
	private String mt_st_dt;
	private String mt_ed_dt;
	private int mt_select;
	private String mt_img;


}
