package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
@NoArgsConstructor
@Getter
@AllArgsConstructor
@ToString
@RequiredArgsConstructor

public class n5CreateScheduleVO {
	@NonNull
	private int d_sche_idx;	
	@NonNull
	private int mt_idx;
	private String mt_name;
	private String mt_preference;
	private int mt_headcount;
	private String user_id;
	private String mt_st_dt;
//	private String mt_st_tm;
	private String mt_ed_dt;
//	private String mt_ed_tm;
	private String mt_select;
	@NonNull
	private int day;
	@NonNull
	private String mt_course;
	public n5CreateScheduleVO(@NonNull int mt_idx, String mt_name, String mt_preference, int mt_headcount, String user_id,
			String mt_st_dt,String mt_ed_dt, String mt_select) {
		super();
		this.mt_idx = mt_idx;
		this.mt_name = mt_name;
		this.mt_preference = mt_preference;
		this.mt_headcount = mt_headcount;
		this.user_id = user_id;
		this.mt_st_dt = mt_st_dt;
		this.mt_ed_dt = mt_ed_dt;
		this.mt_select = mt_select;
	}

	
	
	
}
