package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import oracle.sql.DATE;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class n1_UserVO {
	@NonNull
	private String user_id;
	@NonNull
	private String user_pw;
	@NonNull
	private String user_name;
	@NonNull
	private String user_email;
	@NonNull
	private String  user_gender;
	@NonNull
	private String  user_birthdate;//타입 변환 어떻게 할지!!
	@NonNull
	private String user_nick;
	private DATE  created_at;
	@NonNull
	private String user_role;

}
