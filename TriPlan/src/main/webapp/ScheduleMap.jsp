<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.PoiVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!-- !참고! -->
<%-- <%@page import="com.smhrd.controller.loadScheduleCon"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TriPlan 일정</title>
<!--Google Fonts and Icons-->
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
	padding-left: 20px;
	color: black;
	text-align: center;
}

.fixed-element {
	position: sticky;
	text-align: center;
	top: 0;
	right: 0;
	width: 100%;
	background-color: #f0f0f0;
	padding: 10px;
	box-sizing: border-box;
	z-index: 1000;
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

/* ======================================================================= css 끝  --------------------------------------------------------------------- */
</style>


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

        var positions = [];
        
        <%HttpSession session2 = request.getSession();
List<PoiVO> myUniquePOI = (List<PoiVO>) session.getAttribute("myUniquePOI");%>
        
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
        });
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
		<div id="right_col_inner">
			<div class="fixed-element">
				<h2><%="여행주제"%></h2>
				poiList확인<%=myUniquePOI.size()%>
				<p>2024-03-19 ~ 2024-03-20 (1박2일)</p>
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

				<div class="column">
					<h1>장소검색</h1>
					<!-- 장소검색하는 컬럼생성 -->
					<br>
					<!-- 검색창 출력 -->
					<input type="text" class="search">
					<!-- 검색결과에 따른 항목 출력 -->
					<div class="list-group-item search">
						<div class="Img search">
							<img src="hotelImg/100-코델리아리조트.jpg" alt="테스트" width="100%"
								height="100%">
						</div>
						<!-- 장소정보 출력 -->
						<div class="place-info">
							<div class="name search">스마트인재개발원</div>
							<!-- 장소이름 -->
							<div class="tag-name" id="Tag">
								숙소ㆍ음식점
								<!-- ㆍ = 구분자? 이곳에 장소에 해당하는 태그 명 들어가야 함 -->
							</div>
							<!-- 장소설명-->
							<div class="address" style="display: none">
								주소 들어가야함
								<!-- 마우스 드롭하면 보임 -->
							</div>
						</div>
						<span class="material-icons-round">drag_indicator</span>
					</div>
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
	//jquery 먼저 실행된 다음에 js 코드 사용할 것!!
	//ajax는 jquery 문법에서 가져옴
	<%Gson gson = new Gson();%>
<%-- 	<%Map<Integer,List<String>> MUpdatedItemOrders = new Map<>();%> --%>
	newCourseOrder = [];
	function saveItemOrder() {
	let updatedItemOrders = [];
	       	  <%for (int j = 0; j < 4; j++) {%>//session에서 period 받아와야 함. MyTripsVO.getPeriod()

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
	}); //ajax 끝 
		console.log("업뎃");
	}
	
	function checkPOI(){
		console.log("사용가능한지", newPOI)
		let poi_lat = 0;
		let poi_lng = 0;
		console.log("선언 확인",poi_lat);
		console.log("newCourseOrder[0]확인: ",newCourseOrder[0])
		for (let poi of newCourseOrder[0]) {
			console.log("poi확인: "+poi)
		    for (let detail of newPOI) {
			console.log("detail확인: "+detail.poi_idx)
		        if (poi == detail.poi_idx) {
		        	console.log("매치!", poi, "<3", detail.poi_idx)
		        	console.log("detail.poi_lat")
		            poi_lat = detail.poi_lat;
		            poi_lng = detail.poi_lng;
		            console.log(poi_lat," ",poi_lng);
		            //여기에 맵 추가?
		            
		        }
		    }
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
  

/* 	const drag_item = e.target.closest(".list-group-item")
	
	drag_item.addEventListener("mousedown",(e) => {
		current_item = drag_item;
		current_item.classList.add("insert-animation");
		iniY=e.clientY;
	}) */
	
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
		search_item.classList.remove("search");
		document.querySelector(".name.search").classList.remove("search");
		document.querySelector(".Img.search").classList.remove("search");
		document.getElementById('Tag').innerText = ""
		document.querySelector(".address").style.display = 'block';
		/* document.querySelector(".tag-name").innerText = "우리집이요"; */
		/* document.querySelector(".tag-name").classList.replace("tag-name", "description") */
		}
                saveItemOrder();//일정 순서 바뀐대로 가져오기
				update();//해당 PoiVO가져오기
				checkPOI();//가져온 정보로 맵 출력
                console.log("드래그종료");
                e.preventDefault();
            }
        });
	
/*        document.addEventListener("mouseup", (e) => {
          if(currentItem){
          const drag_item = e.target.closest(".list-group-item");
          current_item = drag_item;
          current_item.classList.add("mouseup-success");
          current_item.classList.remove("insert-animation");
          }

       }); */


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
    
    
/*     document.querySelectorAll(".list-group-item.insert-animation").forEach(function(event){
        event.addEventListener("mouseup", function(){
        	console.log("마우스 뗌!!");
        });
    }); */
    
/*     	document.addEventListener("mouseup", (e) => {
    		if(currentItem){
    			console.log("성공");
    		}

    	}) */
    
    
    
/* 	$(".list-group-item").mouseup(function(){
		console.log("asdfasdf");
	});
 */	
    
    
    
</script>
</body>
</html>