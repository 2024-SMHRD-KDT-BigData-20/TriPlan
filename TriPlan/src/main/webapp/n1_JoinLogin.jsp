<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Start TriPlan</title>
<link rel="stylesheet" href="assets/css/n1_JoinLogin.css">
<%
int JoinResult = -2;
try{
JoinResult = Integer.parseInt(request.getParameter("JoinResult"));//1이면 성공
}catch(Exception e){
JoinResult = -1;
}
%>
</head>
<body>
	<section class="forms-section">
		<!-- <h1 class="section-title">Triplan</h1> -->
			<img alt="mainLogo" src="assets/TriPlan-logo.png">
				<%if(JoinResult == 0){ %>
				<p>회원가입에 실패했습니다.</p>
				<%} %>
		<div class="forms">
			<div class="form-wrapper is-active">
				<button type="button" class="switcher switcher-login">
					Login <span class="underline"></span>
				</button>
				<form class="form form-login" action="n2LoginCon" method="post">
					<fieldset>
						<div class="input-block">
							<label for="login-id">ID</label> <input id="user_id"
								name="user_id" type="id" required>
						</div>
						<div class="input-block">
							<label for="login-password">Password</label> <input
								id="login-password" name="user_pw" type="password" required>
						</div>
					</fieldset>

					<button type="submit" class="btn-login">Login</button>
				</form>
			</div>
			<div class="form-wrapper">
				<button type="button" class="switcher switcher-signup">
					Sign Up <span class="underline"></span>
				</button>
				<form class="form form-signup" action="n1_JoinCon" method="post">
					<fieldset>
						<div class="input-block">
							<label for="user_id">ID</label> <input id="user_id"
								name="user_id" type="id" required >
						</div>
						<div class="input-block">
							<label for="user_pw">Password</label> <input id="user_pw"
								name="user_pw" type="password" required>
						</div>
						<div class="input-block">
							<label for="signup-password-confirm">Confirm password</label> <input
								id="signup-password-confirm" type="password" required>
						</div>
						<div class="input-block">
							<label for="user_name">Name</label> <input id="user_name"
								name="user_name" type="name" required>
						</div>
						<div class="input-block">
							<label for="user_nick">Nick name</label> <input id="user_nick"
								name="user_nick" type="nick" required>
						</div>
						<div class="input-block">
							<label for="user_email">E-mail</label> <input id="user_email"
								name="user_email" type="email" required>
						</div>
						<div class="row">
							<div class="col-half input-block">
								<label for="signup-birth">Birth</label>
								<div class="input-group">
									<div class="col-third">
										<input type="text" placeholder="DD" name="birthDay"
											id="signup-birth-day" class="styled-input" required>
									</div>
									<div class="col-third">
										<input type="text" placeholder="MM" name="birthMonth"
											id="signup-birth-month" class="styled-input" required>
									</div>
									<div class="col-third">
										<input type="text" placeholder="YYYY" name="birthYear"
											id="signup-birth-year" class="styled-input" required>
									</div>
								</div>
							</div>

							<div class="col-half input-block">
								<label for="user_gender">성별</label>
								<div class="input-group">
									<input type="radio" id="gender-male" name="user_gender"
										value="남" required> <label for="gender-male">남</label>
									<input type="radio" id="gender-female" name="user_gender"
										value="여" required> <label for="gender-female">여</label>
								</div>
							</div>
					</fieldset>
					<button type="submit" class="btn-signup">Continue</button>
				</form>
			</div>
		</div>
	</section>

	<script>
        const switchers = [...document.querySelectorAll('.switcher')]

switchers.forEach(item => {
	item.addEventListener('click', function() {
		switchers.forEach(item => item.parentElement.classList.remove('is-active'))
		this.parentElement.classList.add('is-active')
	})
})

      </script>

</body>
</html>