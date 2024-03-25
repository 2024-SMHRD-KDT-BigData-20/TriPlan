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

public class myCourseVO {
	private int d_sche_idx;
	@NonNull
	private int mt_idx;
	@NonNull
	private int day_sche;
	@NonNull
	private String mt_course;
	@NonNull
	private String user_id;
	public myCourseVO(@NonNull int mt_idx, @NonNull int day_sche, @NonNull String mt_course) {
		super();
		this.mt_idx = mt_idx;
		this.day_sche = day_sche;
		this.mt_course = mt_course;
	}
	
	
	
}
