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
public class tagInfoVO {
	private int tag_cat_index;
	private int tag_index;
	@NonNull
	private String cat_name;
	@NonNull
	private String tag_name;

}
