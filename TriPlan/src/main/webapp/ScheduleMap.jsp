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

<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>TriPlan 일정</title>

<!--Google Fonts and Icons-->
	<link rel="stylesheet" href="navStyle.css">
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

.fixed-element {
	position: sticky;
	text-align: center;
	top: 85px;
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
	flex-direction: row;
}

.list-group-item.search {
	background: #fff;
	margin: 20px;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	display: flex;
	flex-direction: row;
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
	width: 70%;
	height: 100%;
	object-fit: cover;
	display: flex;
	margin-right: 10px;
}

.Img.search {
	width: 10%;
	height: 5%;
	object-fit: cover;
	display: flex;
	margin-right: 10px;
}

.material-icons-round {
	display: flex;
	justify-content: right;
	align-items: center;
}

.list-froup-item.dragging {
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

.place-info {
	display: flex;
	flex-direction: column;
	width: 100%;
}
.delete{
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

    swiper-container {
      width: 100%;
      height: 100%;
    }

    swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

/* ======================================================================= css 끝  --------------------------------------------------------------------- */
</style>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<!-- 지도 함수 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=rUw2inMtFc3RpPULkR6di5FZAXdX8YtU4H0nJxbF"></script>
<script>
    var map;
    var markers = []; // 마커와 정보 창을 저장할 배열

    function initTmap() {
        map = new Tmapv2.Map("map_div", {
            center: new Tmapv2.LatLng(33.5070339, 126.4937486),
            width: "100%",
            height: "100Vh",
            zoom: 11
        });

        
        <%HttpSession session2 = request.getSession();
List<PoiVO> myUniquePOI = (List<PoiVO>) session.getAttribute("myUniquePOI");
n4MyTripsVO currentTrip = (n4MyTripsVO)session.getAttribute("currentTrip");
%>



        <%-- 
        <%for (int i = 0; i < myUniquePOI.size(); i++) {
			PoiVO poi = (PoiVO) myUniquePOI.get(i);%>
                positions.push({
                    lat: <%=poi.getPoi_lat()%>,
                    lng: <%=poi.getPoi_lng()%>,
                    info: "<div style='padding:5px; white-space: normal;'><%=poi.getPoi_name()%></div>"
                });
            <%}%>

        // 마커와 정보 창 생성
        for (var i = 0; i < positions.length; i++) {
            var position = new Tmapv2.LatLng(positions[i].lat, positions[i].lng);
            
            var marker = new Tmapv2.Marker({
                position: position,
                map: map,
                title: i.toString() // 마커에 표시될 타이틀(숫자)
            });

            var infoWindow = new Tmapv2.InfoWindow({
                position: position,
                content: positions[i].info,
                border: "1px solid #2c81ba",
                visible: false,
                map: map
            });

            // 마커 클릭 이벤트
            (function (marker, infoWindow) {
                marker.addListener("click", function () {
                    // 다른 모든 마커를 표시하고 모든 정보 창을 숨깁니다.
                    markers.forEach(function (m) {
                        m.marker.setVisible(true);
                        m.infoWindow.setVisible(false);
                    });
                    // 현재 마커를 숨기고 정보 창을 표시합니다.
                    marker.setVisible(false);
                    infoWindow.setVisible(true);
                });
            })(marker, infoWindow);

            markers.push({ marker: marker, infoWindow: infoWindow }); // 배열에 마커와 정보 창 저장
        }

        // 마커들을 이어주는 선을 그립니다.
        var linePath = positions.map(function (position) {
            return new Tmapv2.LatLng(position.lat, position.lng);
        });

        var polyline = new Tmapv2.Polyline({
            path: linePath,
            strokeColor: "#FF0000", // 선의 색깔
            strokeWeight: 3, // 선의 두께
            map: map
        });

        // 지도 클릭 이벤트
        map.addListener("click", function (evt) {
            // 모든 정보 창을 숨기고 모든 마커를 표시합니다.
            markers.forEach(function (m) {
                m.infoWindow.setVisible(false);
                m.marker.setVisible(true);
            });
        }); --%>
        
        
        
        
    }
    </script>
    
<!-- 지도 함수 끝 -->

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
<script src="https://kit.fontawesome.com/5366f35670.js" crossorigin="anonymous"></script>


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
            <i class="fa-brands fa-wordpress"></i>
            <a href="">TriPlan</a>
        </div>
        <ul class="navbar___menu">
            <li><a href="n3Preference.jsp">내 여행프로필</a></li>
            <li><a href="MyPage.jsp">마이페이지</a></li>
            <li><a href="ScheduleMap.jsp">스케쥴메이커</a></li>
            <li><a href="n5CreateSchedule.jsp">일정생성</a></li>
        </ul>
    </div>
		<div id="right_col_inner">
			<div class="fixed-element">
				<h2><%=currentTrip.getMt_name()%></h2>
				<%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				Date startDate = sdf.parse(currentTrip.getMt_st_dt());
				Date endDate = sdf.parse(currentTrip.getMt_ed_dt());
				long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
				double diffDays = (double) diffSec / (60 * 60 * 24);
				int period = (int) Math.ceil(diffDays);
				%>
				<p><%=sdf.format(startDate)%> ~ <%=sdf.format(endDate)%> (<%=period-1%>박<%=period%>일)</p>
				<button type="button" onclick="checkPOI()">저장</button>
			</div>
			<!-- <h3>
				드래그 & 드롭 박스는 div.item입니다. <br>div.center > div.container > div.
				item<br> 사이즈, 칼라 등 디자인 조정해주세요 <br>장소 정보가 들어갈 div.item >
				div.detail ? 만들어주세요
			</h3>
			</div> -->
			<!-- 일정 장소별 드래그 앤 드롭 -->
			<div class="container">

				<div class="column" id = "searchResultList">
					<h1>장소검색</h1>
					<!-- 장소검색하는 컬럼생성 -->
					<br>
					<!-- 검색창 출력 -->
					<input type="text" class="searchBox" name = "search">
					<button onclick="search()">검색</button>
					<!-- 검색결과에 따른 항목 출력 -->
<!-- 					<div class="list-group-item search">
						<div class="Img search">
							<img src="hotelImg/100-코델리아리조트.jpg" alt="테스트" width="100%"
								height="100%">
						</div>
						장소정보 출력
						<div class="place-info">
							<div class="name search">스마트인재개발원</div>
							장소이름
							<div class="tag-name" id="Tag">
								숙소ㆍ음식점
								ㆍ = 구분자? 이곳에 장소에 해당하는 태그 명 들어가야 함
							</div>
							장소설명
							<div class="address" style="display: none">
								주소 들어가야함
								마우스 드롭하면 보임
							</div>
						</div>
						<span class="material-icons-round">drag_indicator</span>
					</div> -->
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
					<%--  --%>
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

					<div class="list-group-item" draggable="true"
						id=<%=poi.getPoi_idx()%> onclick="mouse()">
						<p class="delete" id="del" type="button" onclick="deletePoi()">삭제</p>
						<!-- 이미지 요소 -->
						<div class="Img">
							<img src=<%="poiImgs/" + poi.getPoi_img_location()%> width=100%
								height="100%" alt=<%=poi.getPoi_name()%>>
						</div>
						<div class="place-info">
							<div class="name"><%=poi.getPoi_name()%></div>
							<div class="description"><%=poi.getPoi_desc()%></div>
							<div class="addrees"><%=poi.getPoi_addr()%></div>
							<%-- <div class="operation-time"><%=poi.getPoi_runingtime()%></div> --%>

							<!-- 재민 추신 : 현식이형 위도경도 정보 쓸려면 주석 풀어주세용-->
							<%-- <div class="operation-time"><%=poi.getPoi_lat()%></div>
						<div class="operation-time"><%=poi.getPoi_lng()%></div>
						--%>
						</div>
						<!--    <swiper-container class="mySwiper" navigation="true">
    						<swiper-slide>Slide 1</swiper-slide>
    						<swiper-slide>Slide 2</swiper-slide>
   						 </swiper-container> -->
    
						<!-- 다른 POI 정보도 필요한 경우 위와 같이 추가하면 됩니다. -->
						<span class="material-icons-round">drag_indicator</span>
						
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
	<script>
/*  	$(document).ready(function(){
		.navbar position: fixed;

		#right_col_inner margin-top: 85px;

		.fixed-element :85px

		 $("#right_col_inner").css("margin-top","15px"); 
		 $(".fixed-element").css("top","85px");
	});  */
	
	
	//jquery 먼저 실행된 다음에 js 코드 사용할 것!!
	//ajax는 jquery 문법에서 가져옴
	<%Gson gson = new Gson();%>
<%-- 	<%Map<Integer,List<String>> MUpdatedItemOrders = new Map<>();%> --%>
	newCourseOrder = [];
	function saveItemOrder() {
	let updatedItemOrders = [];
	       	  <%for (int j = 0; j < period ; j++) {%>//session에서 period 받아와야 함. MyTripsVO.getPeriod()

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
	}
	
	function checkPOI() {
		
		
		
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

	    // 마커 사이의 거리 레이블 추가
	    for (let i = 0; i < markers.length - 1; i++) {
	        addDistanceLabel(markers[i], markers[i + 1], map);
	    }
	    function addDistanceLabel(marker1, marker2, map) {
	        var latLng1 = marker1.getPosition();
	        var latLng2 = marker2.getPosition();
	        
	        var distance = Tmapv2.Util.getDistance(latLng1, latLng2);
	        var midpoint = new Tmapv2.LatLng((latLng1._lat + latLng2._lat) / 2, (latLng1._lng + latLng2._lng) / 2);
	        
	        var infoWindow = new Tmapv2.InfoWindow({
	            position: midpoint,
	            content: distance.toFixed(2) + " m",
	            map: map
	        });
	    }
	}

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

	    
	    for(let poi of res){
	        let listItem = document.createElement("div"); // 새로운 리스트 아이템 생성
	        listItem.classList.add("list-group-item", "search"); // 클래스 추가
	        listItem.setAttribute("id", poi.poi_idx); // 아이디 추가
	        
	        let imgDiv = document.createElement("div"); // 이미지 요소를 감싸는 div
	        imgDiv.classList.add("Img", "search");
	        let img = document.createElement("img"); // 이미지 요소 생성
	        img.src = "hotelImg/" + poi.poi_photo; // 이미지 경로 설정
	        img.alt = poi.poi_name; // 대체 텍스트 설정
	        img.width = "100%";
	        img.height = "100%";
	        imgDiv.appendChild(img); // 이미지를 감싸는 div에 추가
	        listItem.appendChild(imgDiv); // 리스트 아이템에 이미지를 감싸는 div 추가
	        
	        let placeInfoDiv = document.createElement("div"); // 장소 정보를 담는 div
	        placeInfoDiv.classList.add("place-info");
	        
	        let nameDiv = document.createElement("div"); // 장소 이름
	        nameDiv.classList.add("name", "search");
	        nameDiv.textContent = poi.poi_name;
	        placeInfoDiv.appendChild(nameDiv);
	        
	        let tagNameDiv = document.createElement("div"); // 태그 명
	        tagNameDiv.classList.add("tag-name");
	        tagNameDiv.textContent = poi.poi_tag;
	        placeInfoDiv.appendChild(tagNameDiv);
	        
	        let addressDiv = document.createElement("div"); // 장소 주소
	        addressDiv.classList.add("address");
	        addressDiv.textContent = poi.addr;
	        addressDiv.style.display = "none";
	        placeInfoDiv.appendChild(addressDiv);
	        
	        listItem.appendChild(placeInfoDiv); // 리스트 아이템에 장소 정보를 담는 div 추가
	        
	        let dragIndicatorSpan = document.createElement("span"); // 드래그 인디케이터
	        dragIndicatorSpan.classList.add("material-icons-round");
	        dragIndicatorSpan.textContent = "drag_indicator";
	        listItem.appendChild(dragIndicatorSpan); // 리스트 아이템에 드래그 인디케이터 추가
	        
	        resultList.appendChild(listItem); // 리스트에 아이템 추가
	    }
	}
	</script>
	<script>
	// 아이템들의 초기 순서를 저장할 배열
	let itemOrders = [];
	
/* 	const items = document.querySelectorAll("#Day2 > .list-group-item");
	items.forEach((item,index)=>{
		itemOrders.push(item.id);
	});
	console.log(itemOrders)
 */

 	// 반복문을 사용하여 각 날짜에 대한 아이템들을 선택하고 초기 순서를 저장

  	for (let j = 0; j < 4 ; j++) {//session에서 period 받아와야 함. MyTripsVO.getPeriod()
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
	document.addEventListener("mousedown", (e) => {
		const drag_item = e.target.closest(".list-group-item");
		const drag_search = e.target.closest(".list-group-item.search");
		current_item = drag_item;
		search_item = drag_search;
		current_item.classList.add("insert-animation");
		iniY = e.clientY;
	})
	
	
	
	    document.addEventListener("drop", (e) => {
	    	
        if(current_item){
                current_item.classList.remove("insert-animation");
		if(search_item != null){
			if(document.querySelector("#result1").parentElement.innerText.includes("장소검색")){
				alert("원하는 일정으로 드래그 해주세요")
			}else{
		search_item.classList.remove("search");
		document.querySelector(".name.search").classList.remove("search");
		document.querySelector(".Img.search").classList.remove("search");
		document.getElementById('Tag').innerText = "";
		document.querySelector(".address").style.display = 'block';
			}
		}
		
		
                saveItemOrder();//일정 순서 바뀐대로 가져오기
				update();//해당 PoiVO가져오기
				checkPOI();//가져온 정보로 맵 출력
                console.log("드래그종료");
                e.preventDefault();
            }
        });
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
