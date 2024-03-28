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
public class n7TourCourseVO {
	@NonNull
	int bc_idx;
	String bc_name;
	int bc_period;
	@NonNull
	String bc_theme;
	String bc_img;
	
	

}
