<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateSchedule</title>
<style>
		body {
        text-align: center;
        background: #eee9e0;
        }
        input {
        border: 2px solid whitesmoke;
        border-radius: 20px;
        padding: 12px 10px;
        text-align: center;
        width: 250px;
        margin-bottom: 20px;
        }
        button {
        border: none;
        border-radius: 3px;
        padding: 12px 10px;
        text-align: center;
        cursor: pointer;
        background: #f18a0d;
        color: whitesmoke;
        }
</style>
</head>
<body>
	<head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/dark.css">
      </head>
	<body>
        <h1>새로운 일정 생성</h1>
        <hr>
        <div>
        <form action ="n5CreateScheduleCon" method = "post">
          <h2>가는날</h2>
          <input type="text" id="go" name = "mt_st_dt" placeholder="날짜를 선택해주세요" data-input>
      
          <h2>오는날</h2>
          <input type="text" id="come" name = "mt_ed_dt" placeholder="날짜를 선택해주세요" data-input>
            
          <h2>여행 제목</h2>
          <input type="text" id="travel_title" name = "mt_name" placeholder="여행제목을 입력해주세요" required>
        </div>
        <button id="next">next</button>
        </form>
      </div>
        
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--  Flatpickr 캘린더  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
      </body>

      <script>
        $("#go").flatpickr({
        dateFormat: "Y-m-d"
        });

        $("#come").flatpickr({
        dateFormat: "Y-m-d"
        });
    </script>
</body>
</html>