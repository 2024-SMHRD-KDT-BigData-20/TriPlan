<%@page import="com.smhrd.model.n3PreferenceVO"%>
<%@page import="com.smhrd.model.n1UserDAO"%>
<%@page import="com.smhrd.model.n1UserVO"%>
<%@page import="com.smhrd.model.n5CreateScheduleVO"%>
<%@page import="com.smhrd.model.courseDAO"%>
<%@page import="com.smhrd.model.n7TourCourseVO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.smhrd.model.tagInfoVO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.smhrd.model.myCourseVO"%>
<%@page import="com.smhrd.model.autoCourseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="assets/css/loading.css">

<title>Insert title here</title>
</head>
<body>
<!-- <?xml version="1.0" encoding="utf-8"?> -->
<!-- Generator: Adobe Illustrator 25.4.2, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<div id="awyloading">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 119.5 40.4" style="enable-background:new 0 0 119.5 40.4;" xml:space="preserve">
<path class="gray-bg" d="M118.6,21.3H1.6c-0.5,0-1-0.4-1-1v0c0-0.5,0.4-1,1-1h117c0.5,0,1,0.4,1,1v0C119.6,20.8,119.1,21.3,118.6,21.3z"
/>
      	<defs>
  		<linearGradient id="gradient" x1="100%" y1="0%" x2="0%" y2="0%">
		      <stop offset="6.25%" style="stop-color:#87FFFE;"/>
		      <stop offset="18.75%" style="stop-color:#88FF89;"/>
		      <stop offset="31.25%" style="stop-color:#F8F58A;"/>
		      <stop offset="43.75%" style="stop-color:#EF696A;"/>
		      <stop offset="56.25%" style="stop-color:#F36ABA;"/>
		      <stop offset="68.75%" style="stop-color:#EF696A;"/>
		      <stop offset="81.25%" style="stop-color:#F8F58A;"/>
		      <stop offset="93.75%" style="stop-color:#88FF89;"/>
		      <stop offset="100%" style="stop-color:#87FFFE;"/>
		    </linearGradient>
	    </defs>
  
  	    <pattern id="pattern" x="0" y="0" width="400%" height="100%" patternUnits="userSpaceOnUse">
	      <rect x="-150%" y="0" width="200%" height="100%" fill="url(#gradient)" transform="rotate(-65)">
	        <animate attributeType="XML"
	                 attributeName="x"
	                 from="-150%" to="50%"
	                 dur="4s"
	                 repeatCount="indefinite"/>
	      </rect>
	      <rect x="-350%" y="0" width="400%" height="400%" fill="url(#gradient)" transform="rotate(-65)">
	        <animate attributeType="XML"
	                 attributeName="x"
	                 from="-350%" to="-50%"
	                 dur="4s"
	                 repeatCount="indefinite"/>
	      </rect>
	    </pattern>
  
<g id="colorchange1" data-name="colorchange1">
	<path d="M118.6,21.3H1.6c-0.5,0-1-0.4-1-1v0c0-0.5,0.4-1,1-1h117c0.5,0,1,0.4,1,1v0C119.6,20.8,119.1,21.3,118.6,21.3z" fill-rule="nonzero" fill="url(#pattern)">
<animate dur="15s" attributeName="d" values="M1.9,21.3H1.6c-0.5,0-1-0.4-1-1v0c0-0.5,0.4-1,1-1h0.4c0.5,0,1,0.4,1,1v0C2.9,20.8,2.5,21.3,1.9,21.3z; M118.6,21.3H1.6c-0.5,0-1-0.4-1-1v0c0-0.5,0.4-1,1-1h117c0.5,0,1,0.4,1,1v0C119.6,20.8,119.1,21.3,118.6,21.3z; M118.6,21.3H1.6c-0.5,0-1-0.4-1-1v0c0-0.5,0.4-1,1-1h117c0.5,0,1,0.4,1,1v0C119.6,20.8,119.1,21.3,118.6,21.3z' fill="url(#pattern)"
      calcMode="spline"
      keySplines="0.1 0 .3 1; 0 0 1 1" > 
  </path>
  </path>
  </g>

  
	<g id="plane" data-name="plane">
		<path d="M117.9,18.4c1.1,0.4,1.7,1.2,1.7,2c-0.1,0.9-0.6,1.5-1.7,2c-0.8,0.4-2,0.6-3.6,0.8c-1.7,0.1-3.6,0.2-5.8,0.2
			l-0.1,0.5c0.5,0.1,0.8,0.6,0.8,1.1v0.6c0,0.4-0.1,0.6-0.4,0.8c-0.2,0.2-0.5,0.4-0.8,0.4h-1.3l-0.9,1.6c0.5,0.1,0.8,0.6,0.8,1.1
			v0.6c0,0.6-0.5,1.1-1.1,1.1h-1.3l-2.9,5.1c-0.2,0.5-0.8,0.8-1.4,0.8H100c-0.3-0.1-0.6-0.1-0.8-0.3c-0.2-0.2-0.3-0.5-0.3-0.8
			c0-0.1,0-0.1,0-0.2l2.4-12.5c-2.5-0.2-5.7-0.5-8.2-0.9l-2.6,4.8c-0.3,0.5-0.8,0.8-1.4,0.8h-0.2c-0.4,0-0.6-0.1-0.8-0.4
			c-0.2-0.2-0.4-0.5-0.4-0.8c-0.1-0.1,1.1-5.1,1.1-5.1c-0.4-0.1-0.7-0.1-1-0.2c-0.7-0.1-1.2-0.2-1.5-0.4c-0.2-0.1-0.9-0.4-0.9-0.4
			c-0.1-0.1-0.2-0.3-0.2-0.4c0-0.2,0.2-0.4,0.2-0.5c0.1-0.1,0.6-0.2,0.8-0.3c0.4-0.1,2.2-0.5,2.5-0.5l-1.2-5c0-0.1,0-0.2,0-0.2
			c0-0.5,0.2-0.7,0.4-0.8c0.2-0.2,0.5-0.4,0.8-0.4H89c0.6,0.1,1.1,0.4,1.3,0.8l2.6,4.8c2.5-0.3,5.7-0.7,8.2-0.9L98.7,4.8
			c0-0.1,0-0.1,0-0.2c0-0.6,0.5-1.1,1.1-1.1h0.1c0.5,0.1,1.1,0.4,1.3,0.8l3.2,5.4h1.2c0.6,0,1.1,0.5,1.1,1.1v0.6
			c0,0.4-0.1,0.6-0.4,0.8c-0.1,0.1-0.3,0.2-0.5,0.2l0.9,1.6h1.2c0.6,0,1.1,0.5,1.1,1.1v0.6c0,0.4-0.1,0.6-0.4,0.8
			c-0.1,0.1-0.2,0.2-0.4,0.3l0.3,0.5c2.1,0,4.1,0.1,5.7,0.2C115.9,17.9,117.1,18.1,117.9,18.4z M117.3,21.4c0.9-0.4,0.9-0.8,0.9-1.1
			c-0.1-0.3,0-0.4-0.2-0.6c-0.2-0.2-0.4-0.4-0.7-0.5c-0.7-0.2-1.8-0.5-3.2-0.7c-2.3-0.2-5.5-0.2-8.8-0.2l-1.8,0
			c-2.8-0.1-7.3,0.5-10.7,1c-1.9,0.2-5,0.9-5.2,0.9c0,0.1,3.1,0.6,5.1,1c3.4,0.5,8,1,10.7,1h1.8c3.3,0,6.5,0,8.8-0.2
			C115.5,21.9,116.6,21.8,117.3,21.4z M108,15.7v-0.6l-0.1-0.1h-0.6l0.4,0.8h0.1C107.9,15.8,107.9,15.8,108,15.7z M107.9,25.6V25
			l-0.1-0.1h-0.2l-0.4,0.8h0.6C107.9,25.6,107.9,25.6,107.9,25.6C107.9,25.6,107.9,25.6,107.9,25.6z M107.4,17.5l-7-12.6
			c-0.1-0.2-0.3-0.3-0.4-0.3h-0.1l2.4,12.8C102.8,17.4,106.7,17.5,107.4,17.5z M100.3,35.8l7-12.4c-0.6,0-4.5-0.1-5-0.1l-2.4,12.7
			C100,36.1,100.2,36,100.3,35.8z M105.4,30.1v-0.6l-0.1-0.1h-0.2l-0.5,0.7L105.4,30.1L105.4,30.1z M105.4,11.3v-0.6l-0.1-0.1h-0.6
			l0.4,0.8L105.4,11.3L105.4,11.3z M91.8,18.7l-2.4-4.5c-0.1-0.2-0.3-0.3-0.4-0.3h-0.2L88.7,14L88.7,14l1.1,4.9
			C90.7,18.8,90.9,18.8,91.8,18.7z M89.5,26.7l2.4-4.5c-0.7-0.1-1.4-0.2-2-0.2l-1.1,4.9C88.7,27.1,89,27,89,27
			C89.2,26.9,89.4,26.9,89.5,26.7z"/>
		<path class="white-fill" d="M118.3,20.4c0,0.2-0.1,0.6-0.9,1.1c-0.7,0.4-1.8,0.5-3.2,0.6c-2.3,0.2-5.5,0.2-8.8,0.2h-1.8
			c-2.7,0-7.3-0.5-10.7-1c-2-0.4-5.1-0.9-5.1-1c0.2-0.1,3.3-0.7,5.2-0.9c3.4-0.5,7.9-1,10.7-1l1.8,0c3.3,0,6.5,0,8.8,0.2
			c1.5,0.2,2.5,0.4,3.2,0.7c0.4,0.1,0.5,0.3,0.7,0.5C118.3,20,118.2,20.1,118.3,20.4z"/>
	</g>
	<g>
	</g>
</g>
</svg>
<p>  여정이 준비되고 있습니다</p>
</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>
<script>
function findMatchignTrip(){
 	 	$.ajax({
		url : "n8FindMatchingTripCon",
		type : "get",
		//보내는 데이터
		//js 객체 {key:value, key:value}
		//key 값이 controller에서 name으로 인식
		//$(선택자)
		data : {"dummy" :"더미"},////
		//받아오는 데이터 타입
 		dataType : "json", 
		success : function(res){
			console.log(res)
			console.log(typeof(res));
			if(parseInt(res) > 0){
                window.location.href = "loadscheduleCon";
            }
		},
		error: function(){
			alert("통신 실패")
		}
	}); //ajax 끝 
		console.log("업뎃");
	}
	
findMatchignTrip();
</script>



</body>
</html>