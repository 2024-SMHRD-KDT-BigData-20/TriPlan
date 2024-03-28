/**
 * 
 */


var alterPoi2 = [];
function alter2(){
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
			alterPoi2=[];
			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				alterPoi2.push(res[i]);
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
		printAlter(alterPoi2);
		return alterPoi2;
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
}
