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

public class n3PreferenceVO {
	int pf_idx;
	@NonNull
	String user_id;
	@NonNull
	String companion;
	@NonNull
	String transportation; 
	@NonNull
	String pace; 
	@NonNull
	String poi;
	@NonNull
	String food; 
	@NonNull
	String sleep;

}
