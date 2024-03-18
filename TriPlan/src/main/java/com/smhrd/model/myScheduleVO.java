package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class myScheduleVO {
	private int d_sche_idx;	
	private int mt_idx;
	private int day;
	private String mt_course;
}
