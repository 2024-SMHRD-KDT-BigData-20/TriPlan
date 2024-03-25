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
	private int day_sched;
	@NonNull
	private String mt_course;
	@NonNull
	private String user_id;
}
