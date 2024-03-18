package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import oracle.sql.NUMBER;


@Getter

@NoArgsConstructor

@AllArgsConstructor//모든 파라미터


public class autoCourseVO {
	int d_sche_idx;
	int bc_idx;
	int day;
	String bc_course;
	/*
	 * String bc_name; int bc_period; String bc_theme;
	 */
}
