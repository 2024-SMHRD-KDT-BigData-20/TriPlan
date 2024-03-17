<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<form action="createScheduleCon" method="post">
		<input name="mt_idx" value = "30001" placeholder = "제주도">
		<input name="mt_name" value = "제주도" placeholder = "제주도">
		<input name="mt_preference" value = "액티비티" placeholder = "액티비티">
		<input name="mt_headcount" value = 2 placeholder = 2>
		<input name="user_id" value = "jinnie" placeholder = "jinnie">
		<input name="mt_st_dt" value = "24/04/30" placeholder = "24/04/30">
		<input name="mt_st_tm" value = "10:00" placeholder = "10:00">
		<input name="mt_ed_dt" value = "24/05/04" placeholder = "24/05/04">
		<input name="mt_ed_tm" value = "17:00" placeholder = "17:00">
		<input name="mt_select" value = 1 placeholder = 1>
		
		<button type="submit">코스 더미 1로 나의 여행 30001 생성</button>
	</form>
</body>
</html>