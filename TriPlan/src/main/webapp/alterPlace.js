/**
 * 
 */



var alterPoi2 = [];


function printAlter4(alterPoi2,poiIdx) {
    console.log("printAlter4444444시작 ",poiIdx);
    // AlterPlace 요소에 접근
    
						
	var poiItem = document.getElementById(poiIdx);
	console.log(poiItem);
    
    var container = poiItem.querySelector(".center.slider.slick-initialized.slick-slider.slick-dotted");

    // AlterPlace 내부에 있는 AlterInfo 요소에 접근
    var list = container.querySelector(".slick-list.draggable");

    // AlterImg 요소에 접근
   // var 아몰라 = alterInfo.querySelector(".AlterImg");

    // AlterTitle 요소에 접근
    var alterTitle = alterInfo.querySelector(".AlterTitle");


    // 버튼을 클릭한 대체 장소의 정보를 출력
    alterPoi2.forEach(function(poi) {
        // AlterTitle에 장소 이름 출력
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = poi.poi_name;
        alterTitle.appendChild(titleAnchor);

        // AlterDesc에 이미지 출력
        var img = document.createElement("img");
        var encodedFilename = encodeURIComponent(poi.poi_photo);
        img.src = "poiImgs/" + encodedFilename;
        img.style.height = "50px";
        img.style.width = "70px";
        alterDesc.appendChild(img);
    });
}



function printAlter3(alterPoi2,poiIdx) {
    console.log("printAlter333333333333333333시작 ",poiIdx);
    // AlterPlace 요소에 접근
    
						
	var poiItem = document.getElementById(poiIdx);
	console.log(poiItem);
    
    var alterPlace = poiItem.querySelector(".AlterPlace");

    // AlterPlace 내부에 있는 AlterInfo 요소에 접근
    var alterInfo = alterPlace.querySelector(".AlterInfo");

    // AlterImg 요소에 접근
    var alterDesc = alterInfo.querySelector(".AlterImg");

    // AlterTitle 요소에 접근
    var alterTitle = alterInfo.querySelector(".AlterTitle");


    // 버튼을 클릭한 대체 장소의 정보를 출력
    alterPoi2.forEach(function(poi) {
        // AlterTitle에 장소 이름 출력
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = poi.poi_name;
        alterTitle.appendChild(titleAnchor);

        // AlterDesc에 이미지 출력
        var img = document.createElement("img");
        var encodedFilename = encodeURIComponent(poi.poi_photo);
        img.src = "poiImgs/" + encodedFilename;
        img.style.height = "50px";
        img.style.width = "70px";
        alterDesc.appendChild(img);
    });
}

function printAlter2(alterPoi2) {
	    console.log("printAlter시작");
    // section 요소에 접근
    var section = document.querySelector("section.center.slider");

    // PoiVO 객체를 반복하여 처리
    alterPoi2.forEach(function(poi) {
        console.log("대체 추천 장소: ", poi.poi_name);
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
        var encodedFilename = encodeURIComponent(poi.poi_photo)
        img.src = "poiImgs/" + encodedFilename; // 이미지 URL 설정
        imgDiv.appendChild(img);
        otherpoiDiv.appendChild(imgDiv);

        // 장소 제목 추가
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = poi.poi_name; // 장소 이름 설정
        otherpoiDiv.appendChild(titleAnchor);

        // section에 otherpoiDiv 추가
        section.appendChild(otherpoiDiv);

    });
}


function alter2(poiIdx){
	console.log("id확인: ",poiIdx)
	 	$.ajax({
		url : "n11alterPlaceCon",
		type : "get",
		//보내는 데이터
		//js 객체 {key:value, key:value}
		//key 값이 controller에서 name으로 인식
		//$(선택자)
		data : {
"mt_idx":366,
"currentSchedule" :JSON.stringify(saveItemOrder()),
"currentPoiIdx":poiIdx
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
			console.log("대체장소",alterPoi2);
			printAlter3(alterPoi2,poiIdx);
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
		return poiIdx;
	}

