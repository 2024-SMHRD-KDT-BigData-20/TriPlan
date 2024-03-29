<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.n4MyTripsVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.PoiVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!-- !참고! -->
<%-- <%@page import="com.smhrd.controller.loadScheduleCon"%> --%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TriPlan 일정</title>

<!--Google Fonts and Icons-->
<link rel="stylesheet" href="navStyle.css">
<link rel="stylesheet" type="text/css" href="slick.css">
<link rel="stylesheet" type="text/css" href="slick-theme.css">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Round|Material+Icons+Sharp|Material+Icons+Two+Tone"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@200;300;400;500;600;700;800&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<style>
#background {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 50%;
	height: 100%;
	background-color: red;
	z-index: 1;
}

body {
	color: #ffffff;
	width: 50%;
	min-height: 100%;
	float: right;
	background-color: white;
}

#left_col {
	float: left;
	width: 100%;
	margin-left: -100%;
	text-align: center;
	background-color: white;
}

#left_col_inner {
	padding: 0px;
	color: black;
}

#content {
	position: relative;
	z-index: 2;
	padding: 30px;
	text-align: center;
	font-weight: bold;
	font-family: Arial, sans-serif;
}

#right_col {
	
}

#right_col_inner {
	color: black;
	text-align: center;
}

.slideContainer {
	width: 100%;
	display: flex;
	margin: auto;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.fixed-element {
	position: sticky;
	text-align: center;
	top: 107px;
	right: 0;
	width: 100%;
	background-color: #f0f0f0;
	padding: 10px;
	box-sizing: border-box;
	z-index: 1000;
	border-radius: 10px;
}

.center {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.container {
	display: flex;
	gap: 30px;
	flex-direction: column;
	justify-content: center;
	position: relative;
	/* align-items: center; */
}

.item {
	width: 500px;
	height: 150px;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
	background: white;
	border-radius: 3mm;
	margin: 10px 0;
	cursor: grab;
	box-shadow: rgba(0, 0, 0, 0.19) 0px 5px 10px, rgba(0, 0, 0, 0.23) 0px
		3px 3px;
	transition: margin 0.25s;
}

.name {
	width: 100%;
	text-align: center;
	font-family: poppins;
	font-size: 18px;
	font-weight: 500;
	color: black;
}

.name.search {
	width: 100%;
	text-align: center;
	font-family: poppins;
	font-size: 14px;
	font-weight: 500;
	color: black;
}

.tag-name {
	margin-top: 10px;
	font-size: 10px;
	color: #757575;
	text-align: center;
}
/* 설명 및 운영 시간 스타일 */
.description, .operation-time, .address {
	margin-top: 10px;
	font-size: 14px;
	color: #757575;
	text-align: center;
}

.item span {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translate(0, -50%);
	font-size: 30px;
	color: rgb(180, 180, 180);
}

.insert-animation {
	animation: scaleit 0.1s ease-in-out;
}

@
keyframes scaleit {from { transform:translate(-50%, 0)scale(1);
	
}

}
.column {
	flex-basis: 20%;
	background: #ddd;
	min-height: 20vh;
	padding: 5px;
	border-radius: 10px;
	flex-direction: column
}

.column h1 {
	text-align: center;
	font-size: 22px;
}

.list-group-item {
	background: #fff;
	margin: 20px;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	display: flex;
	flex-direction: column;
}

.testElement {
	display: flex;
	flex-direction: row;
	width: 100%;
}

.list-group-item.search {
	background: #fff;
	margin: 20px;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	display: flex;
	flex-direction: row;
	min-height: 20px;
}

.testElement.search {
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 45px;
}

.daycount {
	margin-top: 0px;
	margin-bottom: 0px;
}

.item-plus {
	display: flex;
	text-align: right;;
	justify-content: right;
	float: right;
}

.Img {
	width: 50%;
	height: 70%;
	object-fit: cover;
	display: flex;
	margin-right: 10px;
}

.Img.search {
	min-width: 100px;
	min-width:70px;
	/* 	width: auto; */
	object-fit: cover;
	display: flex;
	margin-right: 10px;
}

.Img.search>img {
	width: 100px;
	height: 70px;
	height: auto; /* 이미지의 비율을 유지하면서 너비에 맞춤 */
}

.Img>img {
	width: 70%;
	height: 70%;
}

.material-icons-round {
	display: flex;
	justify-content: right;
	align-items: center;
}

.list-group-item.dragging {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 0) scale(1.15);
	pointer-events: none;
	z-index: 1000;
}

.searchBox {
	width: 70%;
	height: 40px;
}

.search_title {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.place-info {
	display: flex;
	flex-direction: column;
	width: 100%;
}

.delete {
	position: absolute;
	right: 20px;
	height: 20px;
	font-size: 15px;
	display: flex;
	text-align: center;
	flex-direction: row;
	background-color: #ddd;
	justify-content: center;
	border-radius: 50px;
	width: 10%;
	margin: 0;
	margin-right: 15px;
}

.slider {
	width: 50%;
	margin: 0;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}

* {
	box-sizing: border-box;
}

.otherpoi {
	width: 100%;
	display: flex;
	flex-direction: row;
}

.otherpoi img {
	height: 80%;
}

.daily-marker {
	display: block;
	justify-content: center;
	align-items: center;
}

.otherButton {
	background-color: #ddd;
	border-radius: 50px;
	width: 200px;
	cursor: pointer;
}

.AlterPlace {
    display: flex;
    flex-wrap: wrap;
}

.AlterInfo {
    flex: 1 0 100px; /* 각 아이템의 너비 설정, 원하는 너비로 조정하세요 */
    margin: 10px; /* 아이템 간 간격 조정 */
}


/* ======================================================================= css 끝  --------------------------------------------------------------------- */
</style>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<!-- 지도 함수 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=rUw2inMtFc3RpPULkR6di5FZAXdX8YtU4H0nJxbF"></script>
<script>

        
        <%HttpSession session2 = request.getSession();
List<PoiVO> myUniquePOI = (List<PoiVO>) session.getAttribute("myUniquePOI");
n4MyTripsVO currentTrip = (n4MyTripsVO) session.getAttribute("currentTrip");%>
    var map;
    var markers = []; // 마커와 정보 창을 저장할 배열
	var travelPaths=[];
    function initTmap() {
        map = new Tmapv2.Map("map_div", {
            center: new Tmapv2.LatLng(33.3606281, 126.5358345),
            width: "100%",
            height: "100Vh",
            zoom: 11
        });

    }
    <!-- 지도 -->
    </script>


<!-- 드래그 앤 드롭 소스 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"
	integrity="sha512-zYXldzJsDrNKV+odAwFYiDXV2Cy37cwizT+NkuiPGsa9X1dOz04eHvUWVuxaJ299GvcJT31ug2zO4itXBjFx4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>
<script src="https://kit.fontawesome.com/5366f35670.js"
	crossorigin="anonymous"></script>


</head>

<body>

	<!-- 왼쪽 화면에 지도 출력 -->
	<div id="left_col">
		<div id="background">
			<div id="left_col_inner">
				<body onload="initTmap()">
					<div id="map_div" onload="initTmap()"></div>
				</body>
			</div>
		</div>
	</div>



	<div id="right_col">
		<div class="navbar">
			<div class="navbar___logo">
				<img alt="Logo" src="Triplan.png" style="height: 100%;">
			</div>
			<ul class="navbar___menu">
				<li><a href="MyPage.jsp">홈</a></li>
				<li><a href="ConfirmPreference2.jsp">내 여행프로필</a></li>
				<li><a href="n5CreateSchedule.jsp">일정생성</a></li>
			</ul>
			<ul class="navbar___menu">
				<li><a href="LogOutCon">로그아웃</a></li>
			</ul>
		</div>
		<div id="right_col_inner">
			<div class="fixed-element">
				<h2><%=currentTrip.getMt_name()%></h2>
				<%
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date startDate = sdf.parse(currentTrip.getMt_st_dt());
				Date endDate = sdf.parse(currentTrip.getMt_ed_dt());
				long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
				System.out.println(diffSec);
				double diffDays = (double) diffSec / (60 * 60 * 24);
				System.out.println(diffDays);
				int period = (int) Math.ceil(diffDays) + 1;
				System.out.println(period);
				%>
				<p><%=sdf.format(startDate)%>
					~
					<%=sdf.format(endDate)%>
					(<%=period - 1%>박<%=period%>일)

				</p>
			</div>
			<!-- 일정 장소별 드래그 앤 드롭 -->
			<div class="container">
				<div class="column" id="searchResultList">
					<h1 style="margin-top: 30px;">장소검색</h1>
					<div class="search_title">
						<input type="text" class="searchBox" name="search">
						<button onclick="search()" draggable="false">검색</button>
					</div>
					<!-- 장소검색하는 컬럼생성 -->
					<br>


				</div>

				<%
				List<List<Integer>> allDayCourses = (List<List<Integer>>) session2.getAttribute("allDayCourses");

				/* List<PoiVO> myUniquePOI = (List<PoiVO>) request.getAttribute("myUniquePOI"); */

				System.out.println("유니크POI 확인: " + myUniquePOI);

				System.out.println("데이코스 확인: " + allDayCourses);

				for (int i = 0; i < allDayCourses.size(); i++) {
				%>
				<h2 draggable="false">
					<%=i + 1%>일차
				</h2>

				<div class="column" id="Day<%=i + 1%>">
					<button id="fixedButton" class="daily-marker" draggable="false"
						onclick="PrintMap(<%=i + 1%>)">일정 지도에서 보기</button>
					<!-- <div class="ite/2m-plus">
							<button>+ 장소추가</button>
						</div> -->



					<%
					for (int item : allDayCourses.get(i)) {
						PoiVO poi = null;
						// allDayCourses의 아이템이 myUniquePOI의 인덱스와 매핑되는 POI를 찾습니다.
						for (PoiVO p : myUniquePOI) {
							if (p.getPoi_idx() == item) {
						poi = p;
						break;
							}
						}
						// 해당 POI가 발견되면 출력합니다.
						if (poi != null) {
							System.out.println(poi.getPoi_name());
					%>
					<!-- 일정 장소 출력 -->
					<div class="list-group-item" draggable="true"
						id=<%=poi.getPoi_idx()%>>
						<p class="delete" id="del" type="button" onclick="update()">삭제</p>
						<!-- 이미지 요소 -->
						<div class="testElement" id="testElement">
							<div class="Img">
								<img src="poiImgs/<%=poi.getPoi_photo()%>" width=100%
									height="100%" alt=<%=poi.getPoi_name()%>>
							</div>
							<div class="place-info">
								<div class="name"><%=poi.getPoi_name()%></div>
								<div class="description"><%=poi.getPoi_desc()%></div>
								<div class="addrees"><%=poi.getPoi_addr()%></div>
								<%-- <div class="operation-time"><%=poi.getPoi_runingtime()%></div> --%>

							</div>
							<span class="material-icons-round">drag_indicator</span>
						</div>
						
						<button class="<%=poi.getPoi_idx()%>"
								onclick="alter2(<%=poi.getPoi_idx()%>)" style="max-width: 150px;">비슷한 장소</button>
						<div class="AlterPlace">
						
						</div>


						<!-- 다른 POI 정보도 필요한 경우 위와 같이 추가하면 됩니다. -->
						<div class="slideContainer">
		<%-- 	<button onclick="alter3(<%=poi.getPoi_idx()%>)">비슷한 장소 슬라이더에??</button> --%>
							<p class="otherButton">비슷한장소</p>
							<section class="center slider" style="display: none;">
								<!-- id에 poi_idx값 들어가야 함 -->
								<div id="otherpoi1" class="otherpoi">
									<div style="height: 70px; width: 70px">
										이미지 삽입
										<img src="http://placehold.it/350x300?text=1">
									</div>
									<div
										style="display: flex; justify-content: center; text-align: center; align-items: center;">
										<a>장소제목 들어감</a>
									</div>
								</div>
								<div id="otherpoi2" class="otherpoi">
									<div style="height: 70px; width: 70px">
										<img src="http://placehold.it/350x300?text=1">
									</div>
									<div
										style="display: flex; justify-content: center; text-align: center; align-items: center;">
										<a>스마트인재개발원</a>
									</div>
								</div>
							</section>
						</div>


					</div>
					<%
					}
					%>
					<%
					}
					%>
				</div>
				<%
				}
				%>



			</div>
		</div>
	</div>
	<script src="slick.js" type="text/javascript" charset="utf-8"></script>
	<script>
		   $(document).on('ready', function() {
         $(".center").slick({
          dots: true,
          infinite: true,
          centerMode: true,
          slidesToShow: 1,
          slidesToScroll: 1
        });
         $(".center slider.slick-initialized.slick-slider.slick-dotted").css("margin", "0");
         $(".center slider.slick-initialized.slick-slider.slick-dotted").css("width", "80%");
         $(".center slider.slick-initialized.slick-slider.slick-dotted").css("display", "flex");
         $(".slick-dots").css("display", "none");
      });
	// 아이템들의 초기 순서를 저장할 배열
	let itemOrders = [];
	
	 
	
/* 	const items = document.querySelectorAll("#Day2 > .list-group-item");
	items.forEach((item,index)=>{
		itemOrders.push(item.id);
	});
	console.log(itemOrders)
 */

 	// 반복문을 사용하여 각 날짜에 대한 아이템들을 선택하고 초기 순서를 저장

  	for (let j = 0; j < <%=period%> ; j++) {//session에서 period 받아와야 함. MyTripsVO.getPeriod()
		    const items = document.querySelectorAll("#Day" +String(j+1) +"> .list-group-item");
		    let itemOrder = [];
		    items.forEach((item, index) => {
		        itemOrder.push(item.id);
		    });
		    itemOrders.push(itemOrder);
		}
		    console.log(itemOrders);
		    
<%-- 			function saveItemOrder() {
		   	   let updatedItemOrders = [];
		       	  <%for (int j = 0; j < 4; j++) {%>//session에서 period 받아와야 함. MyTripsVO.getPeriod()

	       	        const Items<%=j+1%> = document.querySelectorAll("#Day<%=j+1%>>.list-group-item");
		       	        
		       	        let updatedItemOrder<%=j+1%> = []; // 배열 초기화
		       	        //현재 순서대로 아이템들의 id를 배열에 추가
		       	        Items<%=j+1%>.forEach((item, index) => {
		       	            updatedItemOrder<%=j+1%>.push(item.id);
		       	        });
					  	console.log(updatedItemOrder<%=j+1%>)
		       	        updatedItemOrders.push(updatedItemOrder<%=j+1%>);
				  	<%}%>
		   			return updatedItemOrders
		       	  // 서버에 배열을 전송하여 저장하는 등의 작업을 수행할 수 있습니다.
		       	} --%>
/* 		    let testOrder = saveItemOrder();
			console.log(testOrder); */
			
	</script>
	<script>

	document.addEventListener('DOMContentLoaded', function() {
	    // '비슷한장소'를 클릭했을 때 실행될 이벤트 리스너 추가
	    var buttons = document.querySelectorAll('p.otherButton'); // 모든 '비슷한장소' 버튼을 선택
	    buttons.forEach(function(button, index) {
	        button.addEventListener('click', function() {
	            // 클릭된 버튼에 해당하는 .center.slider 요소의 display 상태를 변경
	            // 여기서는 버튼과 .center.slider 요소가 순서대로 대응된다고 가정
	            var sliders = document.querySelectorAll('.center.slider');
	            if (sliders[index].style.display === 'none' || sliders[index].style.display === '') {
	                sliders[index].style.display = 'block';
	            } else {
	                sliders[index].style.display = 'none'; // 다시 클릭하면 숨깁니다
	            }
	        });
	    });
	});	
	
	//jquery 먼저 실행된 다음에 js 코드 사용할 것!!
	//ajax는 jquery 문법에서 가져옴
	<%Gson gson = new Gson();%>
<%-- 	<%Map<Integer,List<String>> MUpdatedItemOrders = new Map<>();%> --%>
	newCourseOrder = [];
	function saveItemOrder() {
	let updatedItemOrders = [];
	       	  <%for (int j = 0; j < period; j++) {
	System.out.println("saveItemOrder길이" + period);%>//session에서 period 받아와야 함. MyTripsVO.getPeriod()
       	        const Items<%=j + 1%> = document.querySelectorAll("#Day<%=j + 1%>>.list-group-item");
	       	        
	       	        let updatedItemOrder<%=j + 1%> = []; // 배열 초기화
	       	        //현재 순서대로 아이템들의 id를 배열에 추가
	       	        Items<%=j + 1%>.forEach((item, index) => {
	       	            updatedItemOrder<%=j + 1%>.push(item.id);
	       	        });
<%-- 				  	console.log(updatedItemOrder<%=j+1%>) --%>
	       	        updatedItemOrders.push(updatedItemOrder<%=j + 1%>);
<%-- 	       	        <%MupdatedItemORders.put(j+1,%>updatedItemOrder<%)%>--%>
			  	<%}%> 
	       	console.log(updatedItemOrders);
<%-- 	       	<%String JsonUpdatedItemOrders = gson.toJson(updatedItemOrders);%> --%>
			newCourseOrder=updatedItemOrders;
	   		return updatedItemOrders;
	       	}
	let updatedCourseDetail = saveItemOrder();
	let newPOI = [];
	
	function update(){
	 	$.ajax({
		url : "n14UpdateScheduleCon",
		type : "get",
		//보내는 데이터
		//js 객체 {key:value, key:value}
		//key 값이 controller에서 name으로 인식
		//$(선택자)
		data : {"updatedSchedule" :JSON.stringify(saveItemOrder())},////
		//받아오는 데이터 타입
 		dataType : "json", 
		success : function(res){
			newPOI=[];
			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				newPOI.push(res[i]);
			}
			console.log("업데이트 일정",newPOI);
		},
		 error: function(){
			alert("통신 실패")
		} 
/* 		 error: function(xhr, status, error){
		     console.log(xhr);
		     console.log(status);
		    // console.log(error);
			 alert("Error!" + xhr.status);
		    }, */
	}); //ajax 끝 
		console.log("업뎃");
		return newPOI;
	}
	
	
	function checkPOI() {
		
		console.log("checkPOI() 실행")
		
	    let pathCoordinates = []; // 선을 그릴 좌표를 저장할 배열
	    let infoWindow; // 인포윈도우를 관리하기 위한 변수 선언
	    markers = []; // 마커 배열 초기화

	    // 모든 일차를 순회
	    for (let day = 0; day < newCourseOrder.length; day++) {
	        for (let i = 0; i < newCourseOrder[day].length; i++) {
	            let poi = newCourseOrder[day][i];
	            for (let detail of newPOI) {
	                if (poi == detail.poi_idx) {
	                    let poi_lat = detail.poi_lat;
	                    let poi_lng = detail.poi_lng;

	                    // 마커 생성 및 지도에 추가
	                    let marker = new Tmapv2.Marker({
	                        position: new Tmapv2.LatLng(poi_lat, poi_lng),
	                        map: map
	                    });

	                    // 마커 배열에 추가
	                    markers.push(marker);

	                    // 선을 그릴 좌표 배열에 현재 마커의 위치 추가
	                    pathCoordinates.push(new Tmapv2.LatLng(poi_lat, poi_lng));

	                    // 마커에 대한 클릭 이벤트 핸들러 설정
	                    marker.addListener("click", function(evt) {
	                        if (infoWindow) {
	                            infoWindow.setVisible(false);
	                        }

	                        // 새로운 인포윈도우 생성 및 설정
	                        infoWindow = new Tmapv2.InfoWindow({
	                            position: new Tmapv2.LatLng(poi_lat, poi_lng),
	                            content: detail.poi_name,
	                            map: map
	                        });

	                        // 인포윈도우 보이기
	                        infoWindow.setVisible(true);
	                    });
	                }
	            }
	        }
	    }

	    // 지도 클릭 이벤트 핸들러 설정
	    map.addListener("click", function(evt) {
	        if (infoWindow) {
	            infoWindow.setVisible(false);
	        }
	    });

	    // 마커들을 선으로 연결
	    let travelPath = new Tmapv2.Polyline({
	        path: pathCoordinates,
	        strokeColor: "#FF0000",
	        strokeWeight: 6,
	        map: map
	    });
	    
	    

	    console.log("checkPOI() 완료")
	}
	
	 let dayX=1;

	 console.log("dayX초기값",dayX)
	 
	 

	 function PrintMap(dayX) {
		 
		 console.log("PrintMap실행");
		 console.log("마커스 배열 확인: ", markers);
		 console.log("라인 배열 확인: ",travelPaths);
		 for(var i = 0; i < markers.length; i++){
			 console.log("markers ", i,"는 ", markers[i])
			 markers[i].setMap(null); // 마커 제거			 
		 }
		 for(var i = 0; i < travelPaths.length; i++){
			 console.log("Path ", i,"는 ", travelPaths[i])
			 travelPaths[i].setMap(null); // 선 제거			 
		 }
		  

			//markers.clearMarkers();

		/*  for(Tmapv2.Marker marker of markers){
			 marker.clearMarkers();
		 } */
		 
			newCourseOrder=saveItemOrder();
			//newCourseOrder = itemOrders;
			console.log("newCourseOrder는",newCourseOrder)
			newPOI = update();
			console.log("newPOI는",newPOI)
		    let pathCoordinates = []; // 선을 그릴 좌표를 저장할 배열
		    let infoWindow; // 인포윈도우를 관리하기 위한 변수 선언
		    markers = []; // 마커 배열 초기화
		    travelPaths = [];
		    
		  
		        for (let i = 0; i < newCourseOrder[dayX-1].length; i++) {
		            let poi = newCourseOrder[dayX-1][i];
		            console.log("newCourseOrder[dayx-i][",i,"]는",newCourseOrder[dayX-1][i]);
		            for (let detail of newPOI) {
		            	console.log("detail 반복문 실행",detail)
		                if (poi == detail.poi_idx) {
		                    let poi_lat = detail.poi_lat;
		                    let poi_lng = detail.poi_lng;

		                    // 마커 생성 및 지도에 추가
		                    let marker = new Tmapv2.Marker({
		                        position: new Tmapv2.LatLng(poi_lat, poi_lng),
		                        map: map
		                    });

		                    // 마커 배열에 추가
		                    markers.push(marker);

		                    // 선을 그릴 좌표 배열에 현재 마커의 위치 추가
		                    pathCoordinates.push(new Tmapv2.LatLng(poi_lat, poi_lng));

		                    // 마커에 대한 클릭 이벤트 핸들러 설정
		                    marker.addListener("click", function(evt) {
		                        if (infoWindow) {
		                            infoWindow.setVisible(false);
		                        }

		                        // 새로운 인포윈도우 생성 및 설정
		                        infoWindow = new Tmapv2.InfoWindow({
		                            position: new Tmapv2.LatLng(poi_lat, poi_lng),
		                            content: detail.poi_name,
		                            map: map
		                        });

		                        // 인포윈도우 보이기
		                        infoWindow.setVisible(true);
		                    });
		                }console.log("detail 반복문 안쪽끝")
		            }
		        }
		    

		    // 지도 클릭 이벤트 핸들러 설정
		    map.addListener("click", function(evt) {
		        if (infoWindow) {
		            infoWindow.setVisible(false);
		        }
		    });

		    // 마커들을 선으로 연결
		    let travelPath = new Tmapv2.Polyline({
		        path: pathCoordinates,
		        strokeColor: "#FF0000",
		        strokeWeight: 6,
		        map: map
		    });
		    travelPaths.push(travelPath);
		    console.log("PrintMap실행 완료")
		}

	 PrintMap(1);
	// checkPOI();
	</script>
	<script type="text/javascript">
	let searchResult = []
	function search(){
	 	$.ajax({
		url : "n10SearchCon",
		type : "get",
		//보내는 데이터
		//js 객체 {key:value, key:value}
		//key 값이 controller에서 name으로 인식
		//$(선택자)
		data : {"search" :$("input[name=search]").val()},////
		//받아오는 데이터 타입
 		dataType : "json", 
		success : function(res){
 			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				searchResult.push(res[i]);
			}
			console.log("검색 결과",searchResult); 
			printSearch(res);
		},
		error: function(){
			alert("통신 실패")
		}
	}); //ajax 끝 
		console.log("서치 결과 나옴");
		return searchResult;
	}
	function printSearch(res){
	    let resultList = document.getElementById("searchResultList"); // 검색 결과를 표시할 리스트 요소를 가져옴
	    resultList.innerHTML = ""; // 이전 검색 결과를 초기화
	    
 	    // 검색 입력 상자 생성까지 삭제해야될듯 싶어요
	 // 헤더 생성
	    let searchHeader = document.createElement("h1");
	    searchHeader.textContent = "장소검색";
	    resultList.appendChild(searchHeader);

	    // 검색 입력 상자 생성
	    let searchInput = document.createElement("input");
	    searchInput.setAttribute("type", "text");
	    searchInput.classList.add("searchBox");
	    searchInput.setAttribute("name", "search");
	    resultList.appendChild(searchInput);

	    // 검색 버튼 생성
	    let searchButton = document.createElement("button");
	    searchButton.textContent = "검색";
	    searchButton.onclick = search;
	    resultList.appendChild(searchButton); 

	    
	    for(let i=0; i<res.length; i++){
	        let listItem = document.createElement("div"); // 새로운 리스트 아이템 생성
	        listItem.classList.add("list-group-item", "search"); // 클래스 추가
	        listItem.setAttribute("id", res[i].poi_idx); // 아이디 추가
	        listItem.setAttribute("data_custom", i);
	        
	        let testEleDiv = document.createElement("div"); // testElement div추가
	        testEleDiv.classList.add("testElement", "search");
	        
	        let imgDiv = document.createElement("div"); // 이미지 요소를 감싸는 div
	        imgDiv.classList.add("Img", "search");
	        let img = document.createElement("img"); // 이미지 요소 생성
	        img.src = "poiImgs/" + res[i].poi_photo; // 이미지 경로 설정
	        img.alt = res[i].poi_name; // 대체 텍스트 설정
	        img.width = "100%";
	        img.height = "100%";
	        imgDiv.appendChild(img); // 이미지를 감싸는 div에 추가
	        testEleDiv.appendChild(imgDiv); // testElement에 이미지를 감싸는 div 추가
	        
	        let placeInfoDiv = document.createElement("div"); // 장소 정보를 담는 div
	        placeInfoDiv.classList.add("place-info");
	        
	        let nameDiv = document.createElement("div"); // 장소 이름
	        nameDiv.classList.add("name", "search");
	        nameDiv.textContent = res[i].poi_name;
	        placeInfoDiv.appendChild(nameDiv);
	        
	        let tagNameDiv = document.createElement("div"); // 태그 명
	        tagNameDiv.classList.add("tag-name");
	        tagNameDiv.textContent = res[i].poi_tag;
	        placeInfoDiv.appendChild(tagNameDiv);
	        
	        let addressDiv = document.createElement("div"); // 장소 주소
	        addressDiv.classList.add("address");
	        addressDiv.textContent = res[i].addr;
	        addressDiv.style.display = "none";
	        placeInfoDiv.appendChild(addressDiv);
	        
	        testEleDiv.appendChild(placeInfoDiv); // testElement에 장소 정보를 담는 div 추가
	        
	        let dragIndicatorSpan = document.createElement("span"); // 드래그 인디케이터
	        dragIndicatorSpan.classList.add("material-icons-round");
	        dragIndicatorSpan.textContent = "drag_indicator";
	        testEleDiv.appendChild(dragIndicatorSpan); // testElement 드래그 인디케이터 추가
	        
	        listItem.appendChild(testEleDiv); // 리스트 아이템에 testElement 추가
	        resultList.appendChild(listItem); // 리스트에 아이템 추가
	    }
	}
	
	function deletePOI(){
		update();
		PrintMap(1);
		
	}
	
	</script>

	<script type="text/javascript" src="alterPlace.js"></script>
	<script type="text/javascript">
var alterPoi = [];
function alter(){
	console.log("alter실행");
 	$.ajax({
	url : "n11alterPlaceCon",
	type : "get",
	//보내는 데이터
	//js 객체 {key:value, key:value}
	//key 값이 controller에서 name으로 인식
	//$(선택자)
	data : {
"mt_idx":366,
"updatedSchedule" :JSON.stringify(saveItemOrder()),
"currentPoiIdx":100244
},////
	//받아오는 데이터 타입
		dataType : "json", 
	success : function(res){
		alterPoi=[];
		console.log(res)
		console.log(typeof(res));
		for(let i=0; i<res.length;i++){
			alterPoi.push(res[i]);
		}
		console.log("대체장소",alterPOI);

	},
	 error: function(){
		alert("통신 실패")
	} 
/* 		 error: function(xhr, status, error){
	     console.log(xhr);
	     console.log(status);
	    // console.log(error);
		 alert("Error!" + xhr.status);
	    }, */
}); //ajax 끝 
	console.log("성공");
	printAlter(alterPoi);
	return alterPoi;
}

function printAlter(alterPoi) {
// center slider 요소에 접근
var slider = document.querySelector(".center.slider");

// PoiVO 객체를 반복하여 처리
alterPoi.forEach(function(poi) {
    // otherpoi div 요소 추가
    var otherpoiDiv = document.createElement("div");
    otherpoiDiv.className = "otherpoi";
    otherpoiDiv.id = "otherpoi_" + poi.poi_idx; // poi_idx 값을 id로 설정
    
    // 이미지 div 추가
    var imgDiv = document.createElement("div");
    imgDiv.style.height = "70px";
    imgDiv.style.width = "70px";
    
    // 이미지 추가
    var img = document.createElement("img");
    img.src = poi.image_url; // 이미지 URL 설정
    imgDiv.appendChild(img);
    otherpoiDiv.appendChild(imgDiv);
    
    // 장소 제목 추가
    var titleAnchor = document.createElement("a");
    titleAnchor.textContent = poi.poi_name; // 장소 이름 설정
    otherpoiDiv.appendChild(titleAnchor);
    
    // center slider에 otherpoiDiv 추가
    slider.appendChild(otherpoiDiv);
});
}</script>

	<script>
	document.addEventListener("mousedown", (e) => {
		const drag_item = e.target.closest(".list-group-item");
		//const target_column = e.tager.closest(".column;")
		const drag_search = e.target.closest(".list-group-item.search");
		const from_coloumn = e.target.closest(".column");//안되면 여기 지우기!
		const previous_to_column = document.querySelector(".column.to");
		current_item = drag_item;
		search_item = drag_search;
		current_item.classList.add("insert-animation");
		previous_to_column.classList.remove("to");//안되면 여기 지우기!
		iniY = e.clientY;
	})
	
	
	
	    document.addEventListener("drop", (e) => {
	    //target_column.classList.add("active");
	    const to_coloumn = e.target.closest(".column");//안되면 여기 지우기!
	    to_coloumn.classList.add("to");//안되면 여기 지우기!
        if(current_item){
                current_item.classList.remove("insert-animation");
		if(search_item != null){
			if(search_item.parentElement.innerText.includes("장소검색")){
				alert("원하는 일정으로 드래그 해주세요")
			}else{
		const searchElements = search_item.querySelectorAll(".search");
		searchElements.forEach(element =>{
			element.classList.remove("search");
		});
 		search_item.classList.remove("search");
		search_item.querySelector('.tag-name').innerText = "";
/* 		search_item.querySelector(".address").style.display = 'block' */; 
 
 		console.log(searchResult);
 		const i=search_item.getAttribute("data_custom");
 		console.log("i확인: ",i);
/*         // testElement로 감싸주기
        const testElement = document.createElement('div');
        testElement.classList.add('testElement');
        search_item.querySelector('.list-group-item').appendChild(testElement); */
        // 설명 들어감
        const description = document.createElement('div');
        description.classList.add('description');
        description.innerText = searchResult[i].poi_desc;
        search_item.querySelector('.place-info').appendChild(description);
		// 주소 들어감
        const adress = document.createElement('div');
        adress.classList.add('adress');
        adress.innerText = searchResult[i].poi_addr;
        search_item.querySelector('.place-info').appendChild(adress);
        // 삭제버튼 들어감
         const Divdelete = document.createElement('p');
         Divdelete.classList.add('delete');
         Divdelete.setAttribute('type', 'button');
         Divdelete.setAttribute('onclick', 'deletePoi()');//여기 수정 필요!!!
         Divdelete.innerText = '삭제'; 
         console.log(Divdelete);
        search_item.appendChild(Divdelete);
 
			}
		}
		
		
                saveItemOrder();//일정 순서 바뀐대로 가져오기
				update();//해당 PoiVO가져오기
				//checkPOI();//가져온 정보로 맵 출력
				const column = document.querySelector(".column.to");
				if (column) {
				    const id = column.getAttribute("id");
				    const idNumber = id.replace("Day", ""); // "Day" 부분을 제거하여 숫자만 추출
				    PrintMap(idNumber); // idNumber를 PrintMap 함수에 전달하여 호출
				}
                console.log("드래그종료");
                e.preventDefault();
            }
        });
	
			/* 삭제함수 */
			 document.addEventListener('DOMContentLoaded', function() {
			  // 상위 요소에 이벤트 리스너를 추가합니다. 여기서는 document를 사용했지만,
			  // 성능을 위해 가능한 한 가까운 부모 요소에 추가하는 것이 좋습니다.

			  document.addEventListener('click', function(e) {
			    // 클릭된 요소가 삭제 버튼인지 확인합니다.
			    if (e.target && e.target.classList.contains('delete')) {
			      // 삭제 버튼의 부모 요소를 찾아 삭제합니다.
			      // 이 예제에서는 'list-group-item' 클래스를 가진 부모 요소를 삭제하려고 합니다.
			      // 이를 위해 closest 메소드를 사용하여 가장 가까운 해당 클래스 요소를 찾습니다.
			      var toDelete = e.target.closest('.list-group-item');
			      if (toDelete) {
			        toDelete.remove(); // 요소를 삭제합니다.
			      }
			    }
			  });
			});



    const columns = document.querySelectorAll(".column");
	console.log(columns);
columns.forEach((column) => {
  new Sortable(column, {
    group: "shared",
    animation: 150,
    ghostClass: "blue-background-class"
  });
});
</script>
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        var elements = document.querySelectorAll('h2');
        for (var i = 0; i < elements.length; i++) {
            elements[i].addEventListener('dragstart', function(event) {
                event.preventDefault();
            });
        }
    });  
</script>
</body>
</html>
