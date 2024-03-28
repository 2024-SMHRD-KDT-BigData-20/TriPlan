<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.n4MyTripsVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.PoiVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!-- !����! -->
<%-- <%@page import="com.smhrd.controller.loadScheduleCon"%> --%>

<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>TriPlan ����</title>

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

#slideContainer {
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
/* ���� �� � �ð� ��Ÿ�� */
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
	height: 100%;
	object-fit: cover;
	display: flex;
	margin-right: 10px;
}

.Img.search {
	width: auto;
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

/* ======================================================================= css ��  --------------------------------------------------------------------- */
</style>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<!-- ���� �Լ� ��ũ��Ʈ -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=rUw2inMtFc3RpPULkR6di5FZAXdX8YtU4H0nJxbF"></script>
<script>

        
        <%HttpSession session2 = request.getSession();
List<PoiVO> myUniquePOI = 

(List<PoiVO>) session.getAttribute("myUniquePOI");
n4MyTripsVO currentTrip = (n4MyTripsVO) session.getAttribute("currentTrip");%>
    var map;
    var markers = []; // ��Ŀ�� ���� â�� ������ �迭
	var travelPaths=[];
    function initTmap() {
        map = new Tmapv2.Map("map_div", {
            center: new Tmapv2.LatLng(33.5070339, 126.4937486),
            width: "100%",
            height: "100Vh",
            zoom: 11
        });



        <%-- 
        <%for (int i = 0; i < myUniquePOI.size(); i++) {
			PoiVO poi = (PoiVO) myUniquePOI.get(i);%>
                positions.push({
                    lat: <%=poi.getPoi_lat()%>,
                    lng: <%=poi.getPoi_lng()%>,
                    info: "<div style='padding:5px; white-space: normal;'><%=poi.getPoi_name()%></div>"
                });
            <%}%>

        // ��Ŀ�� ���� â ����
        for (var i = 0; i < positions.length; i++) {
            var position = new Tmapv2.LatLng(positions[i].lat, positions[i].lng);
            
            var marker = new Tmapv2.Marker({
                position: position,
                map: map,
                title: i.toString() // ��Ŀ�� ǥ�õ� Ÿ��Ʋ(����)
            });

            var infoWindow = new Tmapv2.InfoWindow({
                position: position,
                content: positions[i].info,
                border: "1px solid #2c81ba",
                visible: false,
                map: map
            });

            // ��Ŀ Ŭ�� �̺�Ʈ
            (function (marker, infoWindow) {
                marker.addListener("click", function () {
                    // �ٸ� ��� ��Ŀ�� ǥ���ϰ� ��� ���� â�� ����ϴ�.
                    markers.forEach(function (m) {
                        m.marker.setVisible(true);
                        m.infoWindow.setVisible(false);
                    });
                    // ���� ��Ŀ�� ����� ���� â�� ǥ���մϴ�.
                    marker.setVisible(false);
                    infoWindow.setVisible(true);
                });
            })(marker, infoWindow);

            markers.push({ marker: marker, infoWindow: infoWindow }); // �迭�� ��Ŀ�� ���� â ����
        }

        // ��Ŀ���� �̾��ִ� ���� �׸��ϴ�.
        var linePath = positions.map(function (position) {
            return new Tmapv2.LatLng(position.lat, position.lng);
        });

        var polyline = new Tmapv2.Polyline({
            path: linePath,
            strokeColor: "#FF0000", // ���� ����
            strokeWeight: 3, // ���� �β�
            map: map
        });

        // ���� Ŭ�� �̺�Ʈ
        map.addListener("click", function (evt) {
            // ��� ���� â�� ����� ��� ��Ŀ�� ǥ���մϴ�.
            markers.forEach(function (m) {
                m.infoWindow.setVisible(false);
                m.marker.setVisible(true);
            });
        }); --%>
        
        
        
        
    }
    </script>

<!-- ���� �Լ� �� -->

<!-- �巡�� �� ��� �ҽ� -->
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

	<!-- ���� ȭ�鿡 ���� ��� -->
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
				<i class="fa-brands fa-wordpress"></i> <a href="">TriPlan</a>
			</div>
			<ul class="navbar___menu">
				<li><a href="MyPage.jsp">Ȩ</a></li>
				<li><a href="n3Preference.jsp">�� ����������</a></li>
				<li><a href="n5CreateSchedule.jsp">��������</a></li>
			</ul>

			<ul>
				<li><a href="">�α׾ƿ�</a></li>
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
				int period = (int) Math.ceil(diffDays);
				System.out.println(period);
				%>
				<p><%=sdf.format(startDate)%>
					~
					<%=sdf.format(endDate)%>
					(<%=period - 1%>��<%=period%>��)
					
				</p>
				<button type="button" onclick="checkPOI()">����</button>
			</div>
			<!-- <h3>
				�巡�� & ��� �ڽ��� div.item�Դϴ�. <br>div.center > div.container > div.
				item<br> ������, Į�� �� ������ �������ּ��� <br>��� ������ �� div.item >
				div.detail ? ������ּ���
			</h3>
			</div> -->
			<!-- ���� ��Һ� �巡�� �� ��� -->
			<div class="container">

				<h1 style="margin-top: 30px;">��Ұ˻�</h1>
				<div class="search_title">
					<input type="text" class="searchBox" name="search">
					<button onclick="search()" draggable="false">�˻�</button>
				</div>
				<div class="column" id="searchResultList">

					<!-- ��Ұ˻��ϴ� �÷����� -->
					<br>


				</div>




				<%
				List<List<Integer>> allDayCourses = (List<List<Integer>>) session2.getAttribute("allDayCourses");

				/* List<PoiVO> myUniquePOI = (List<PoiVO>) request.getAttribute("myUniquePOI"); */

				System.out.println("����ũPOI Ȯ��: " + myUniquePOI);

				System.out.println("�����ڽ� Ȯ��: " + allDayCourses);

				for (int i = 0; i < allDayCourses.size(); i++) {
				%>
				<h2 draggable="false">
					<%=i + 1%>����
				</h2>

				<div class="column" id="Day<%=i + 1%>">
					<button onclick="PrintMap(<%=i + 1%>)">���� �������� ����</button>
					<%--  --%>
					<!-- <div class="ite/2m-plus">
							<button>+ ����߰�</button>
						</div> -->



					<%
					for (int item : allDayCourses.get(i)) {
						PoiVO poi = null;
						// allDayCourses�� �������� myUniquePOI�� �ε����� ���εǴ� POI�� ã���ϴ�.
						for (PoiVO p : myUniquePOI) {
							if (p.getPoi_idx() == item) {
						poi = p;
						break;
							}
						}
						// �ش� POI�� �߰ߵǸ� ����մϴ�.
						if (poi != null) {
							System.out.println(poi.getPoi_name());
					%>

					<div class="list-group-item" draggable="true"
						id=<%=poi.getPoi_idx()%> onclick="mouse()">
						<p class="delete" id="del" type="button" onclick="update();PrintMap(1);">����</p>
						<!-- �̹��� ��� -->
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

								<!-- ��� �߽� : �������� �����浵 ���� ������ �ּ� Ǯ���ּ���-->
								<%-- <div class="operation-time"><%=poi.getPoi_lat()%></div>
						<div class="operation-time"><%=poi.getPoi_lng()%></div>
						--%>
							</div>
							<span class="material-icons-round">drag_indicator</span>
						</div>

						<!-- �ٸ� POI ������ �ʿ��� ��� ���� ���� �߰��ϸ� �˴ϴ�. -->
						<div id="slideContainer">
							<p
								style="background-color: #ddd; border-radius: 50px; width: 200px;">�����
								���</p>
							<section class="center slider">
								<!-- id�� poi_idx�� ���� �� -->
								<div id="otherpoi" class="otherpoi">
									<div style="height: 70px; width: 70px">
										<!-- �̹��� ���� -->
										<img src="http://placehold.it/350x300?text=1">
									</div>
									<div
										style="display: flex; justify-content: center; text-align: center; align-items: center;">
										<a>������� ��</a>
									</div>
								</div>
								<div id="otherpoi" class="otherpoi">
									<div style="height: 70px; width: 70px">
										<img src="http://placehold.it/350x300?text=1">
									</div>
									<div
										style="display: flex; justify-content: center; text-align: center; align-items: center;">
										<a>����Ʈ���簳�߿�</a>
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
	// �����۵��� �ʱ� ������ ������ �迭
	let itemOrders = [];
	
	 
	
/* 	const items = document.querySelectorAll("#Day2 > .list-group-item");
	items.forEach((item,index)=>{
		itemOrders.push(item.id);
	});
	console.log(itemOrders)
 */

 	// �ݺ����� ����Ͽ� �� ��¥�� ���� �����۵��� �����ϰ� �ʱ� ������ ����

  	for (let j = 0; j < <%=period%> ; j++) {//session���� period �޾ƿ;� ��. MyTripsVO.getPeriod()
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
		       	  <%for (int j = 0; j < 4; j++) {%>//session���� period �޾ƿ;� ��. MyTripsVO.getPeriod()

	       	        const Items<%=j+1%> = document.querySelectorAll("#Day<%=j+1%>>.list-group-item");
		       	        
		       	        let updatedItemOrder<%=j+1%> = []; // �迭 �ʱ�ȭ
		       	        //���� ������� �����۵��� id�� �迭�� �߰�
		       	        Items<%=j+1%>.forEach((item, index) => {
		       	            updatedItemOrder<%=j+1%>.push(item.id);
		       	        });
					  	console.log(updatedItemOrder<%=j+1%>)
		       	        updatedItemOrders.push(updatedItemOrder<%=j+1%>);
				  	<%}%>
		   			return updatedItemOrders
		       	  // ������ �迭�� �����Ͽ� �����ϴ� ���� �۾��� ������ �� �ֽ��ϴ�.
		       	} --%>
/* 		    let testOrder = saveItemOrder();
			console.log(testOrder); */
			
	</script>
	<script>
/*  	$(document).ready(function(){
		.navbar position: fixed;

		#right_col_inner margin-top: 85px;

		.fixed-element :85px

		 $("#right_col_inner").css("margin-top","15px"); 
		 $(".fixed-element").css("top","85px");
	});  */
	
	
	//jquery ���� ����� ������ js �ڵ� ����� ��!!
	//ajax�� jquery �������� ������
	<%Gson gson = new Gson();%>
<%-- 	<%Map<Integer,List<String>> MUpdatedItemOrders = new Map<>();%> --%>
	newCourseOrder = [];
	function saveItemOrder() {
	let updatedItemOrders = [];
	       	  <%for (int j = 0; j < period; j++) {
	       	  System.out.println("saveItemOrder����"+period);%>//session���� period �޾ƿ;� ��. MyTripsVO.getPeriod()
       	        const Items<%=j + 1%> = document.querySelectorAll("#Day<%=j + 1%>>.list-group-item");
	       	        
	       	        let updatedItemOrder<%=j + 1%> = []; // �迭 �ʱ�ȭ
	       	        //���� ������� �����۵��� id�� �迭�� �߰�
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
		//������ ������
		//js ��ü {key:value, key:value}
		//key ���� controller���� name���� �ν�
		//$(������)
		data : {"updatedSchedule" :JSON.stringify(saveItemOrder())},////
		//�޾ƿ��� ������ Ÿ��
 		dataType : "json", 
		success : function(res){
			newPOI=[];
			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				newPOI.push(res[i]);
			}
			console.log("������Ʈ ����",newPOI);
		},
		 error: function(){
			alert("��� ����")
		} 
/* 		 error: function(xhr, status, error){
		     console.log(xhr);
		     console.log(status);
		    // console.log(error);
			 alert("Error!" + xhr.status);
		    }, */
	}); //ajax �� 
		console.log("����");
		return newPOI;
	}
	
	
	function checkPOI() {
		
		console.log("checkPOI() ����")
		
	    let pathCoordinates = []; // ���� �׸� ��ǥ�� ������ �迭
	    let infoWindow; // ���������츦 �����ϱ� ���� ���� ����
	    markers = []; // ��Ŀ �迭 �ʱ�ȭ

	    // ��� ������ ��ȸ
	    for (let day = 0; day < newCourseOrder.length; day++) {
	        for (let i = 0; i < newCourseOrder[day].length; i++) {
	            let poi = newCourseOrder[day][i];
	            for (let detail of newPOI) {
	                if (poi == detail.poi_idx) {
	                    let poi_lat = detail.poi_lat;
	                    let poi_lng = detail.poi_lng;

	                    // ��Ŀ ���� �� ������ �߰�
	                    let marker = new Tmapv2.Marker({
	                        position: new Tmapv2.LatLng(poi_lat, poi_lng),
	                        map: map
	                    });

	                    // ��Ŀ �迭�� �߰�
	                    markers.push(marker);

	                    // ���� �׸� ��ǥ �迭�� ���� ��Ŀ�� ��ġ �߰�
	                    pathCoordinates.push(new Tmapv2.LatLng(poi_lat, poi_lng));

	                    // ��Ŀ�� ���� Ŭ�� �̺�Ʈ �ڵ鷯 ����
	                    marker.addListener("click", function(evt) {
	                        if (infoWindow) {
	                            infoWindow.setVisible(false);
	                        }

	                        // ���ο� ���������� ���� �� ����
	                        infoWindow = new Tmapv2.InfoWindow({
	                            position: new Tmapv2.LatLng(poi_lat, poi_lng),
	                            content: detail.poi_name,
	                            map: map
	                        });

	                        // ���������� ���̱�
	                        infoWindow.setVisible(true);
	                    });
	                }
	            }
	        }
	    }

	    // ���� Ŭ�� �̺�Ʈ �ڵ鷯 ����
	    map.addListener("click", function(evt) {
	        if (infoWindow) {
	            infoWindow.setVisible(false);
	        }
	    });

	    // ��Ŀ���� ������ ����
	    let travelPath = new Tmapv2.Polyline({
	        path: pathCoordinates,
	        strokeColor: "#FF0000",
	        strokeWeight: 6,
	        map: map
	    });
	    
	    

	    console.log("checkPOI() �Ϸ�")
	}
	
	 let dayX=1;

	 console.log("dayX�ʱⰪ",dayX)
	 
	 
	 markers = [];
	 function PrintMap(dayX) {
		 
		 console.log("PrintMap����");
		 console.log("��Ŀ�� �迭 Ȯ��: ", markers);
		 console.log("���� �迭 Ȯ��: ",travelPaths);
		 for(var i = 0; i < markers.length; i++){
			 console.log("markers ", i,"�� ", markers[i])
			 markers[i].setMap(null); // ��Ŀ ����			 
		 }
		 for(var i = 0; i < travelPaths.length; i++){
			 console.log("Path ", i,"�� ", travelPaths[i])
			 travelPaths[i].setMap(null); // ��Ŀ ����			 
		 }
		 

			//markers.clearMarkers();

		/*  for(Tmapv2.Marker marker of markers){
			 marker.clearMarkers();
		 } */
			newCourseOrder=saveItemOrder();
			//newCourseOrder = itemOrders;
			console.log("newCourseOrder��",newCourseOrder)
			newPOI = update();
			console.log("newPOI��",newPOI)
		    let pathCoordinates = []; // ���� �׸� ��ǥ�� ������ �迭
		    let infoWindow; // ���������츦 �����ϱ� ���� ���� ����
		    markers = []; // ��Ŀ �迭 �ʱ�ȭ
		    travelPaths = [];
		    // ��� ������ ��ȸ
		  
		        for (let i = 0; i < newCourseOrder[dayX-1].length; i++) {
		            let poi = newCourseOrder[dayX-1][i];
		            console.log("newCourseOrder[dayx-i][",i,"]��",newCourseOrder[dayX-1][i]);
		            for (let detail of newPOI) {
		            	console.log("detail �ݺ��� ����",detail)
		                if (poi == detail.poi_idx) {
		                    let poi_lat = detail.poi_lat;
		                    let poi_lng = detail.poi_lng;

		                    // ��Ŀ ���� �� ������ �߰�
		                    let marker = new Tmapv2.Marker({
		                        position: new Tmapv2.LatLng(poi_lat, poi_lng),
		                        map: map
		                    });

		                    // ��Ŀ �迭�� �߰�
		                    markers.push(marker);

		                    // ���� �׸� ��ǥ �迭�� ���� ��Ŀ�� ��ġ �߰�
		                    pathCoordinates.push(new Tmapv2.LatLng(poi_lat, poi_lng));

		                    // ��Ŀ�� ���� Ŭ�� �̺�Ʈ �ڵ鷯 ����
		                    marker.addListener("click", function(evt) {
		                        if (infoWindow) {
		                            infoWindow.setVisible(false);
		                        }

		                        // ���ο� ���������� ���� �� ����
		                        infoWindow = new Tmapv2.InfoWindow({
		                            position: new Tmapv2.LatLng(poi_lat, poi_lng),
		                            content: detail.poi_name,
		                            map: map
		                        });

		                        // ���������� ���̱�
		                        infoWindow.setVisible(true);
		                    });
		                }console.log("detail �ݺ��� ���ʳ�")
		            }
		        }
		    

		    // ���� Ŭ�� �̺�Ʈ �ڵ鷯 ����
		    map.addListener("click", function(evt) {
		        if (infoWindow) {
		            infoWindow.setVisible(false);
		        }
		    });

		    // ��Ŀ���� ������ ����
		    let travelPath = new Tmapv2.Polyline({
		        path: pathCoordinates,
		        strokeColor: "#FF0000",
		        strokeWeight: 6,
		        map: map
		    });
		    travelPaths.push(travelPath);
		    console.log("PrintMap���� �Ϸ�")
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
		//������ ������
		//js ��ü {key:value, key:value}
		//key ���� controller���� name���� �ν�
		//$(������)
		data : {"search" :$("input[name=search]").val()},////
		//�޾ƿ��� ������ Ÿ��
 		dataType : "json", 
		success : function(res){
 			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				searchResult.push(res[i]);
			}
			console.log("�˻� ���",searchResult); 
			printSearch(res);
		},
		error: function(){
			alert("��� ����")
		}
	}); //ajax �� 
		console.log("��ġ ��� ����");
		return searchResult;
	}
	function printSearch(res){
	    let resultList = document.getElementById("searchResultList"); // �˻� ����� ǥ���� ����Ʈ ��Ҹ� ������
	    resultList.innerHTML = ""; // ���� �˻� ����� �ʱ�ȭ
	    
	    // �˻� �Է� ���� �������� �����ؾߵɵ� �;��
	 // ��� ����
	    let searchHeader = document.createElement("h1");
	    searchHeader.textContent = "��Ұ˻�";
	    resultList.appendChild(searchHeader);

	    // �˻� �Է� ���� ����
	    let searchInput = document.createElement("input");
	    searchInput.setAttribute("type", "text");
	    searchInput.classList.add("searchBox");
	    searchInput.setAttribute("name", "search");
	    resultList.appendChild(searchInput);

	    // �˻� ��ư ����
	    let searchButton = document.createElement("button");
	    searchButton.textContent = "�˻�";
	    searchButton.onclick = search;
	    resultList.appendChild(searchButton);

	    
	    for(let poi of res){
	        let listItem = document.createElement("div"); // ���ο� ����Ʈ ������ ����
	        listItem.classList.add("list-group-item", "search"); // Ŭ���� �߰�
	        listItem.setAttribute("id", poi.poi_idx); // ���̵� �߰�
	        
	        let imgDiv = document.createElement("div"); // �̹��� ��Ҹ� ���δ� div
	        imgDiv.classList.add("Img", "search");
	        let img = document.createElement("img"); // �̹��� ��� ����
	        img.src = "hotelImg/" + poi.poi_photo; // �̹��� ��� ����
	        img.alt = poi.poi_name; // ��ü �ؽ�Ʈ ����
	        img.width = "100%";
	        img.height = "100%";
	        imgDiv.appendChild(img); // �̹����� ���δ� div�� �߰�
	        listItem.appendChild(imgDiv); // ����Ʈ �����ۿ� �̹����� ���δ� div �߰�
	        
	        let placeInfoDiv = document.createElement("div"); // ��� ������ ��� div
	        placeInfoDiv.classList.add("place-info");
	        
	        let nameDiv = document.createElement("div"); // ��� �̸�
	        nameDiv.classList.add("name", "search");
	        nameDiv.textContent = poi.poi_name;
	        placeInfoDiv.appendChild(nameDiv);
	        
	        let tagNameDiv = document.createElement("div"); // �±� ��
	        tagNameDiv.classList.add("tag-name");
	        tagNameDiv.textContent = poi.poi_tag;
	        placeInfoDiv.appendChild(tagNameDiv);
	        
	        let addressDiv = document.createElement("div"); // ��� �ּ�
	        addressDiv.classList.add("address");
	        addressDiv.textContent = poi.addr;
	        addressDiv.style.display = "none";
	        placeInfoDiv.appendChild(addressDiv);
	        
	        listItem.appendChild(placeInfoDiv); // ����Ʈ �����ۿ� ��� ������ ��� div �߰�
	        
	        let dragIndicatorSpan = document.createElement("span"); // �巡�� �ε�������
	        dragIndicatorSpan.classList.add("material-icons-round");
	        dragIndicatorSpan.textContent = "drag_indicator";
	        listItem.appendChild(dragIndicatorSpan); // ����Ʈ �����ۿ� �巡�� �ε������� �߰�
	        
	        resultList.appendChild(listItem); // ����Ʈ�� ������ �߰�
	    }
	}
	
	function deletePOI(){
		update();
		PrintMap(1);
		
	}
	
	</script>

	


	<script>
	document.addEventListener("mousedown", (e) => {
		const drag_item = e.target.closest(".list-group-item");
		//const target_column = e.tager.closest(".column;")
		const drag_search = e.target.closest(".list-group-item.search");
		current_item = drag_item;
		search_item = drag_search;
		current_item.classList.add("insert-animation");
		iniY = e.clientY;
	})
	
	
	
	    document.addEventListener("drop", (e) => {
	    //target_column.classList.add("active");
        if(current_item){
                current_item.classList.remove("insert-animation");
		if(search_item != null){
			if(search_item.parentElement.innerText.includes("��Ұ˻�")){
				alert("���ϴ� �������� �巡�� ���ּ���")
			}else{
		const searchElements = search_item.querySelectorAll(".search");
		searchElements.forEach(element =>{
			element.classList.remove("search");
		});
 		search_item.classList.remove("search");
		search_item.querySelector('.tag-name').innerText = "";
/* 		search_item.querySelector(".address").style.display = 'block' */; 
 
 		addedItemPOI()
 
        // ���� ��
        const description = document.createElement('div');
        description.classList.add('description');
        description.innerText = '���� ���� ��';
        search_item.querySelector('.place-info').appendChild(description);
		// �ּ� ��
        const adress = document.createElement('div');
        adress.classList.add('adress');
        adress.innerText = '�ּ� ���� ��';
        search_item.querySelector('.place-info').appendChild(adress);
        // ������ư ��
         const Divdelete = document.createElement('p');
         Divdelete.classList.add('delete');
         Divdelete.setAttribute('type', 'button');
         Divdelete.setAttribute('onclick', 'deletePoi()');
         Divdelete.innerText = '����'; 
         console.log(Divdelete);
        search_item.appendChild(Divdelete);
 
			}
		}
		
		
                saveItemOrder();//���� ���� �ٲ��� ��������
				update();//�ش� PoiVO��������
				//checkPOI();//������ ������ �� ���
				PrintMap(1);
                console.log("�巡������");
                e.preventDefault();
            }
        });
	
			/* �����Լ� */
			 document.addEventListener('DOMContentLoaded', function() {
			  // ���� ��ҿ� �̺�Ʈ �����ʸ� �߰��մϴ�. ���⼭�� document�� ���������,
			  // ������ ���� ������ �� ����� �θ� ��ҿ� �߰��ϴ� ���� �����ϴ�.

			  document.addEventListener('click', function(e) {
			    // Ŭ���� ��Ұ� ���� ��ư���� Ȯ���մϴ�.
			    if (e.target && e.target.classList.contains('delete')) {
			      // ���� ��ư�� �θ� ��Ҹ� ã�� �����մϴ�.
			      // �� ���������� 'list-group-item' Ŭ������ ���� �θ� ��Ҹ� �����Ϸ��� �մϴ�.
			      // �̸� ���� closest �޼ҵ带 ����Ͽ� ���� ����� �ش� Ŭ���� ��Ҹ� ã���ϴ�.
			      var toDelete = e.target.closest('.list-group-item');
			      if (toDelete) {
			        toDelete.remove(); // ��Ҹ� �����մϴ�.
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
