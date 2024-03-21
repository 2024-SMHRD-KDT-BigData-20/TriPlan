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
	gap : 30px; 
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
/* 설명 및 운영 시간 스타일 */
.description, .operation-time {
	margin-top: 10px;
	font-size: 14px;
	color: #757575;
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

@keyframes scaleit {from { transform:translate(-50%, 0)scale(1);
	
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
padding: 20px;
border-radius: 5px;
cursor: pointer;
}
.daycount{
    margin-top: 0px;
    margin-bottom: 0px;
}
.item-plus{
		display: flex;
	text-align: right; ;
	justify-content: right;
	float: right;
	
}
.Img{
	float: left;
}
.material-icons-round{
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



/* ======================================================================= css 끝  --------------------------------------------------------------------- */
</style>


<!-- 지도 함수 스크립트 -->
<script
	src="https://apis.openapi.sk.com/tmap/vectorjs?version=1&appKey=5xlrQgGGMeW9sjaWtFx1613MYzRTs0x8EaGbs2Da"></script>
<script type="text/javascript">
    // 페이지가 로딩이 된 후 호출하는 함수입니다.
    function initTmap(){
    var map = new Tmapv3.Map("map_div", {
        center : new Tmapv3.LatLng(33.5070339, 126.4937486),
        width : "100%",
        height : "800px",
        zoom : 13
    });
<% 
List<PoiVO> myUniquePOI = (List<PoiVO>) request.getAttribute("myUniquePOI");
%>
<%for(int i = 0; i<myUniquePOI.size(); i++){
	PoiVO poi = (PoiVO)myUniquePOI.get(i); 
	System.out.println(poi);
	%>
	    var marker = new Tmapv3.Marker({
	        position: new Tmapv3.LatLng(<%=poi.getPoi_lat()%>, <%=poi.getPoi_lng()%>),
	        map: map
	    });	
<%
}
%>
/*     // poiList를 반복하여 각 POI의 위도와 경도 정보를 사용하여 지도에 마커를 추가합니다.
    poiList.forEach(function(poi) {
        var marker = new Tmapv3.Marker({
            position: new Tmapv3.LatLng(poi.getPoi_lat(), poi.getPoi_lng()),
            map: map
        });
    }); */
}
</script>
<!-- 지도 함수 끝 -->
 
 <!-- 드래그 앤 드롭 소스 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js" integrity="sha512-zYXldzJsDrNKV+odAwFYiDXV2Cy37cwizT+NkuiPGsa9X1dOz04eHvUWVuxaJ299GvcJT31ug2zO4itXBjFx4w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
    		<h2><%= "여행주제" %></h2>
    		poiList확인<%=myUniquePOI.size() %>
   			 <p>2024-03-19 ~ 2024-03-20 (1박2일)</p>
</div>
			<!-- <h3>
				드래그 & 드롭 박스는 div.item입니다. <br>div.center > div.container > div.
				item<br> 사이즈, 칼라 등 디자인 조정해주세요 <br>장소 정보가 들어갈 div.item >
				div.detail ? 만들어주세요
			</h3>
			</div> -->
				<!-- 일정 장소별 드래그 앤 드롭 -->
				<div class="container">

					<%
					List<List<Integer>> allDayCourses = (List<List<Integer>>) request.getSession().getAttribute("allDayCourses");
					
					/* List<PoiVO> myUniquePOI = (List<PoiVO>) request.getAttribute("myUniquePOI"); */
					
					System.out.println("유니크POI 확인: " + myUniquePOI);
					
					System.out.println("데이코스 확인: " + allDayCourses);
					
					for (int i = 0; i < allDayCourses.size(); i++) {
					%>
						<h2 draggable="false">
							<%=i + 1%>일차
						</h2>
					<div class="column">
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
								System.out.println(poi.getPoi_desc());
							%>
								
							<div class="list-group-item"  draggable="true">
								
								<!-- 이미지 요소 -->
								<div class="Img">
									<img src=<%="poiImgs/" + poi.getPoi_img_location()%>
										width=150px height="110px" alt=<%=poi.getPoi_name()%>>
								</div>
								<div class="name"><%=poi.getPoi_name()%></div>
								<div class="description"><%=poi.getPoi_desc()%></div>
								<div class="operation-time"><%=poi.getPoi_runingtime()%></div>
								
								<!-- 재민 추신 : 현식이형 위도경도 정보 쓸려면 주석 풀어주세용-->
								<div class="operation-time"><%=poi.getPoi_lat()%></div>
								<div class="operation-time"><%=poi.getPoi_lng()%></div> --%>
								<!-- 다른 POI 정보도 필요한 경우 위와 같이 추가하면 됩니다. -->
								<span class="material-icons-round">drag_indicator</span>
							</div>
							<%
							}
							%>
					<%
					}%>
					</div><%
					}
					%>
				</div>
			</div>
		</div>
<script>
	document.addEventListener("mousedown", (e) => {
		const drag_item = e.target.closest(".list-group-item");
		current_item = drag_item;
		current_item.classList.add("insert-animation");
		iniY = e.clientY;
	})

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