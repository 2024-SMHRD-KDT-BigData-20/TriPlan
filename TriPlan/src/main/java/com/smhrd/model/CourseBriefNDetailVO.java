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

public class CourseBriefNDetailVO {
	int bc_idx;
	@NonNull
	String bc_name;
	@NonNull
	int bc_period;
	@NonNull
	String bc_theme;
	@NonNull
	String bc_img;
	int d_sche_idx;
	@NonNull
	int day;
	@NonNull
	String bc_course;
}
