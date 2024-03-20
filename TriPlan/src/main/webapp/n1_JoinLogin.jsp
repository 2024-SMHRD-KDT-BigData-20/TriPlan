<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Start TriPlan</title>
 <style>
        *,
*::before,
*::after {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Roboto, -apple-system, 'Helvetica Neue', 'Segoe UI', Arial, sans-serif;
	background: #eee9e0;
}

.forms-section {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.section-title { 
	font-size: 32px;
	letter-spacing: 1px;
	color: #f18a0d;
}

.forms {
	display: flex;
	align-items: flex-start;
	margin-top: 30px;
}


.form-wrapper {
	animation: hideLayer .3s ease-out forwards;
}

.form-wrapper.is-active {
	animation: showLayer .3s ease-in forwards;
}

@keyframes showLayer {
	50% {
		z-index: 1;
	}
	100% {
		z-index: 1;
	}
}

@keyframes hideLayer {
	0% {
		z-index: 1;
	}
	49.999% {
		z-index: 1;
	}
}

.switcher {
	position: relative;
	cursor: pointer;
	display: block;
	margin-right: auto;
	margin-left: auto;
	padding: 0;
	text-transform: uppercase;
	font-family: inherit;
	font-size: 16px;
	letter-spacing: .5px;
	color: #999;
	background-color: transparent;
	border: none;
	outline: none;
	transform: translateX(0);
	transition: all .3s ease-out;
}

.form-wrapper.is-active .switcher-login {
	color: #fff;
	transform: translateX(90px);
}

.form-wrapper.is-active .switcher-signup {
	color: #fff;
	transform: translateX(-90px);
}

.underline {
	position: absolute;
	bottom: -5px;
	left: 0;
	overflow: hidden;
	pointer-events: none;
	width: 100%;
	height: 2px;
}

.underline::before {
	content: '';
	position: absolute;
	top: 0;
	left: inherit;
	display: block;
	width: inherit;
	height: inherit;
	background-color: currentColor;
	transition: transform .2s ease-out;
}

.switcher-login .underline::before {
	transform: translateX(101%);
}

.switcher-signup .underline::before {
	transform: translateX(-101%);
}

.form-wrapper.is-active .underline::before {
	transform: translateX(0);

}

.form {
	overflow: hidden;
	min-width: 500px;
	margin-top: 50px;
	padding: 30px 25px;
    border-radius: 5px;
	transform-origin: top;
}

.form-login {
	animation: hideLogin .3s ease-out forwards;
	width: calc(100% - 50px); 
    padding: 30px 25px; 
}

.form-wrapper.is-active .form-login {
	animation: showLogin .3s ease-in forwards;
}

@keyframes showLogin {
	0% {
		background: #d7e7f1;
		transform: translate(40%, 10px);
	}
	50% {
		transform: translate(0, 0);
	}
	100% {
		background-color: #fff;
		transform: translate(35%, -20px);
	}
}

@keyframes hideLogin {
	0% {
		background-color: #fff;
		transform: translate(35%, -20px);
	}
	50% {
		transform: translate(0, 0);
	}
	100% {
		background: #f18a0d;
		transform: translate(40%, 10px);
	}
}

.form-signup {
	animation: hideSignup .3s ease-out forwards;
}

.form-wrapper.is-active .form-signup {
	animation: showSignup .3s ease-in forwards;
}

@keyframes showSignup {
	0% {
		background: #d7e7f1;
		transform: translate(-40%, 10px) scaleY(.8);
	}
	50% {
		transform: translate(0, 0) scaleY(.8);
	}
	100% {
		background-color: #fff;
		transform: translate(-35%, -20px) scaleY(1);
	}
}

@keyframes hideSignup {
	0% {
		background-color: #fff;
		transform: translate(-35%, -20px) scaleY(1);
	}
	50% {
		transform: translate(0, 0) scaleY(.8);
	}
	100% {
		background: #f18a0d ;
		transform: translate(-40%, 10px) scaleY(.8);
	}
}

.form fieldset {
	position: relative;
	opacity: 0;
	margin: 0;
	padding: 0;
	border: 0;
	transition: all .3s ease-out;
}

.form-login fieldset {
	transform: translateX(-50%);
}

.form-signup fieldset {
	transform: translateX(50%);
}

.form-wrapper.is-active fieldset {
	opacity: 1;
	transform: translateX(0);
	transition: opacity .4s ease-in, transform .35s ease-in;
}

.form legend {
	position: absolute;
	overflow: hidden;
	width: 1px;
	height: 1px;
	clip: rect(0 0 0 0);
}

.input-block {
	margin-bottom: 20px;
}

.input-block label {
	font-size: 14px;
  color: #f18a0d;
}

.col-half {
    font-size: 14px;
  color: #f18a0d; 
}

 .row {
    zoom: 1;
  }

  .row:before,
  .row:after {
    content: "";
    display: table;
  }

  .row:after {
    clear: both;
  }

  .col-half {
    padding-right: 10px;
    float: left;
    width: 50%;
  }

  .input-group .col-third {
    padding-right: 10px;
    width: calc(100% / 3);
    float: left;
	height : 100%;
  }

  .col-third:last-of-type {
    padding-right: 0;
  }

.input-group input[type="radio"] {
	display: none;
}
.input-group .col-third input[type="text"],
.input-group input[type="radio"] + label {
	display: flex;
	width: 100%;
	height: 40px; 
	line-height: 40px;
	text-align: center;
	align-items: center;
	justify-content: center;
	float: none;
	border-radius: 0;
	cursor: pointer;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	transition: background-color 0.35s ease-in-out, color 0.35s ease-in-out, border-color 0.35s ease-in-out;
	margin-bottom: 20px;
}
.input-group input[type="text"] {
    font-size: 12px;
}
.input-group input[type="radio"]:checked + label {
	background-color: #f18a0d;
	color: #fff;
	border-color: #f18a0d;
}
.input-group label {
    margin-top: 10px;
}

.input-group {
	height : auto;
	font-size: 14px;
  color: #190f02;
  display: flex; 
}

.input-block input {
	display: block;
	width: 100%;
	margin-top: 8px;
	padding-right: 15px;
	padding-left: 15px;
	font-size: 16px;
	line-height: 40px;
	color: #3b4465;
  background: #f9f9f9;
  border: 1px solid #d4d7dbd7;
  border-radius: 2px;
}

.form [type='submit'] {
	opacity: 0;
	display: block;
	min-width: 120px;
	margin: 30px auto 10px;
	font-size: 18px;
	line-height: 40px;
	border-radius: 25px;
	border: none;
	transition: all .3s ease-out;
}

.form-wrapper.is-active .form [type='submit'] {
	opacity: 1;
	transform: translateX(0);
	transition: all .4s ease-in;
}

.btn-login {
	color: #fbfdff;
	background: #5f605e;
	transform: translateX(-30%);
}

.btn-signup {
	color: #fbfdff;
	background: #5f605e;
	transform: translateX(30%);
}

    </style>
</head>
<body>
<section class="forms-section">
        <h1 class="section-title">Triplane</h1>
        <div class="forms">
          <div class="form-wrapper is-active">
            <button type="button" class="switcher switcher-login">
              Login
              <span class="underline"></span>
            </button>
            <form class="form form-login">
              <fieldset>
                <div class="input-block">
                  <label for="login-id">ID</label>
                  <input id="login-id" type="id" required>
                </div>
                <div class="input-block">
                  <label for="login-password">Password</label>
                  <input id="login-password" type="password" required>
                </div>
              </fieldset>

              <button type="submit" class="btn-login">Login</button>
            </form>
          </div>
          <div class="form-wrapper">
            <button type="button" class="switcher switcher-signup">
                Sign Up
              <span class="underline"></span>
            </button>
            <form class="form form-signup">
              <fieldset>
                <div class="input-block">
                  <label for="signup-id">ID</label>
                  <input id="signup-id" type="id" required>
                </div>
                <div class="input-block">
                  <label for="signup-password">Password</label>
                  <input id="signup-password" type="password" required>
                </div>
                <div class="input-block">
                  <label for="signup-password-confirm">Confirm password</label>
                  <input id="signup-password-confirm" type="password" required>
                </div>
				<div class="input-block">
                    <label for="signup-name">Name</label>
                    <input id="signup-name" type="name" required>
                </div>
                <div class="input-block">
                    <label for="signup-nick">Nick name</label>
                    <input id="signup-nick" type="nick" required>
                </div>
                <div class="input-block">
                    <label for="signup-email">E-mail</label>
                    <input id="signup-email" type="email" required>
                </div>
                <div class="row">
                    <div class="col-half input-block">
						<label for="signup-birth">Birth</label>
						<div class="input-group">
							<div class="col-third">
								<input type="text" placeholder="DD" id="signup-birth-day" class="styled-input" required>
							</div>
							<div class="col-third">
								<input type="text" placeholder="MM" id="signup-birth-month" class="styled-input" required>
							</div>
							<div class="col-third">
								<input type="text" placeholder="YYYY" id="signup-birth-year" class="styled-input" required>
							</div>
						</div>
					</div>
					
					<div class="col-half input-block">
						<label for="signup-gender">Gender</label>
						<div class="input-group">
							<input type="radio" id="gender-male" name="gender" value="male" required>
							<label for="gender-male">Male</label>
							<input type="radio" id="gender-female" name="gender" value="female" required>
							<label for="gender-female">Female</label>
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