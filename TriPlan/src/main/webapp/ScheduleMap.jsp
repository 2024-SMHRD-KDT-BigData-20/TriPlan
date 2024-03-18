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
	color: #ffffff;
	text-align: center;
}

.center {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.container {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
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

.item.dragging {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 0) scale(1.15);
	pointer-events: none;
	z-index: 1000;
}

.insert-animation {
	animation: scaleit 0.1s ease-in-out;
}

@
keyframes scaleit {from { transform:translate(-50%, 0)scale(1);
	
}

}
.item.dragging .name {
	color: rgb(218, 83, 80);
}

.item.dragging span {
	color: rgb(214, 104, 103);
}
</style>
</style>

<!-- 지도 함수 스크립트 -->
<script src="https://apis.openapi.sk.com/tmap/vectorjs?version=1&appKey=5xlrQgGGMeW9sjaWtFx1613MYzRTs0x8EaGbs2Da"></script>
<script type="text/javascript">
	// 페이지가 로딩이 된 후 호출하는 함수입니다.
	function initTmap(){
		// map 생성
		// Tmapv3.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		var map = new Tmapv3.Map("map_div", { // 지도가 생성될 div
			center : new Tmapv3.LatLng(37.56520450, 126.98702028),
			width : "100%",	// 지도의 넓이
			height : "800px",	// 지도의 높이
			zoom : 16	// 지도 줌레벨
			
		});
	} 
</script> <!-- 지도 함수 끝 -->
</head>

<body>
	<!-- 왼쪽 화면에 지도 출력 -->
	<div id="left_col">
		<div id="left_col_inner">
			<body onload="initTmap()">
				<div id="map_div" onload="initTmap()"></div>
			</body>
		</div>
	</div>

	<div id="right_col">
		<div id="right_col_inner">
			<h1>스크롤 - 일정 관리</h1>
			<h2>상단에 제목을 출력할 div.title이 fix로 들어 있으면 좋겠어요</h2>
			<h3>드래그 & 드롭 박스는 div.item입니다. <br>div.center > div.container > div. item<br>
			사이즈, 칼라 등 디자인 조정해주세요
			<br>장소 정보가 들어갈 div.item > div.detail ? 만들어주세요</h3>
			<div class="center">

				<div class="container">

<%
List<List<Integer>> allDayCourses = (List<List<Integer>>) request.getSession().getAttribute("allDayCourses");
List<PoiVO> myUniquePOI = (List<PoiVO>) request.getAttribute("myUniquePOI");
System.out.println("유니크POI 확인: "+myUniquePOI);
System.out.println("데이코스 확인: "+allDayCourses);
for (int i = 0; i < allDayCourses.size(); i++) {
%>
<h2>
    Day <%= i + 1 %>
</h2>

<%
for (int item : allDayCourses.get(i)) {
    PoiVO poi = null;
    // allDayCourses의 아이템이 myUniquePOI의 인덱스와 매핑되는 POI를 찾습니다.
    for (PoiVO p : myUniquePOI) {
        if (p.getPoi_idx() == item) {
            poi = p;
            break;
            // TODO 테스트임 03/17 
            }
    }
    // 해당 POI가 발견되면 출력합니다.
    if (poi != null) {
    	System.out.println(poi.getPoi_desc());
%>
<div class="item">
    <div class="Img"><img src=<%="poiImgs/" + poi.getPoi_img_location() %> width = 100px alt=<%=poi.getPoi_name() %>></div>
    <div class="name"><%= poi.getPoi_name() %></div>
    <div class="description"><%= poi.getPoi_desc() %></div>
    <div class="operation-time"><%= poi.getPoi_runingtime() %></div>
    <!-- 다른 POI 정보도 필요한 경우 위와 같이 추가하면 됩니다. -->
    <span class="material-icons-round">drag_indicator</span>
</div>
<%
    }
}
}





%>
				</div>
			</div>

			<h4>To demonstrate the effect</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				mattis metus a purus tincidunt accumsan. Sed non orci felis. Vivamus
				eros risus, luctus vel vulputate id, vestibulum vel augue. In
				vulputate egestas volutpat. Donec in velit quis leo mollis porta.
				Suspendisse potenti. Etiam faucibus porttitor libero, in fermentum
				urna pulvinar quis. Sed pretium tortor nisl. Pellentesque auctor
				elementum urna laoreet molestie. Donec et mauris ante. Vestibulum
				malesuada lacinia nulla, vitae tristique erat interdum a.
				Suspendisse potenti. Cras magna neque, dictum at vehicula lobortis,
				varius eget libero. Curabitur a lectus ac nulla pharetra porttitor
				vel at magna. Donec neque risus, pellentesque at porta vitae.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				mattis metus a purus tincidunt accumsan. Sed non orci felis. Vivamus
				eros risus, luctus vel vulputate id, vestibulum vel augue. In
				vulputate egestas volutpat. Donec in velit quis leo mollis porta.
				Suspendisse potenti. Etiam faucibus porttitor libero, in fermentum
				urna pulvinar quis. Sed pretium tortor nisl. Pellentesque auctor
				elementum urna laoreet molestie. Donec et mauris ante. Vestibulum
				malesuada lacinia nulla, vitae tristique erat interdum a.
				Suspendisse potenti.</p>
		</div>
	</div>
	<script>
      let isDragging = false;
      let currentItem = null;
      let containerOffsetY = 0;
      let initY = 0;

      const container = document.querySelector(".container");
      container.style.width = container.offsetWidth + "px";
      container.style.height = container.offsetHeight + "px";

      document.addEventListener("mousedown", (e) => {
        const item = e.target.closest(".item");
        if (item) {
          isDragging = true;
          currentItem = item;
          containerOffsetY = currentItem.offsetTop;
          currentItem.classList.add("dragging");
          document.body.style.userSelect = "none";
          currentItem.classList.add("insert-animation");
          currentItem.style.top = containerOffsetY + "px";
          initY = e.clientY;
        }
      });
      document.addEventListener("mousemove", (e) => {
        if (isDragging && currentItem) {
          currentItem.classList.remove("insert-animation");
          let newTop = containerOffsetY - (initY - e.clientY);
          if (newTop < -50) {
            newTop = -50;
          } else if (newTop > container.offsetHeight - 30) {
            newTop = container.offsetHeight - 30;
          }
          currentItem.style.top = newTop + "px";

          let itemSibilings = [
            ...document.querySelectorAll(".item:not(.dragging)"),
          ];
          let nextItem = itemSibilings.find((sibiling) => {
            return (
              e.clientY - container.getBoundingClientRect().top <=
              sibiling.offsetTop + sibiling.offsetHeight / 2
            );
          });

          itemSibilings.forEach((sibiling) => {
            sibiling.style.marginTop = "10px";
          });

          if (nextItem) {
            nextItem.style.marginTop = currentItem.offsetHeight + 20 + "px";
          }
          container.insertBefore(currentItem, nextItem);
        }
      });

      document.addEventListener("mouseup", () => {
        if (currentItem) {
          currentItem.classList.remove("dragging");
          currentItem.style.top = "auto";
          currentItem = null;
          isDragging = false;

          document.body.style.userSelect = "auto";
        }

        let itemSibilings = [
          ...document.querySelectorAll(".item:not(.dragging)"),
        ];

        itemSibilings.forEach((sibiling) => {
          sibiling.style.marginTop = "10px";
        });
      });
    </script>
</body>
</html>