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
	private int pf_idx;
	@NonNull
	private String user_id;
	@NonNull
	private String people;
	@NonNull
	private String transportation; 
	@NonNull
	private String pace; 
	@NonNull
	private String poi;
	@NonNull
	private String food; 
	@NonNull
	private String sleep;
	
	
}
