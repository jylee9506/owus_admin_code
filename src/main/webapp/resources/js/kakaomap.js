const {map, markerImage, overlay} = (() => {
    const mapContainer = document.getElementById('map') // 지도의 중심좌표
    const map = new kakao.maps.Map(mapContainer, {
        center: new kakao.maps.LatLng(0, 0), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    });

    const mapTypeControl = new kakao.maps.MapTypeControl()
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT)
    const zoomControl = new kakao.maps.ZoomControl()
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT)

    const imageSrc = '/resources/img/marker.png', // 마커이미지의 주소입니다
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)} // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    const overlay = []

    return {map, markerImage, overlay}
})()

function getPointByMno(mno) {
    axios.get(`/details/dpoints/${mno}`).then(rst => {
            renderMap(rst.data, false)
        })
}

function getPointByDpno(dpno) {
    axios.get(`/details/dpoints/one/${dpno}`).then(rst => {
        renderMap(rst.data, true)
    })
}

function renderMap(data, showing) {
    console.log(data)

    let content = [];
    for(let i =0; i< data.length; i++){

        content[i] =
            `<div class="wrap">
            <div class="info">
                <div class="title">
                    <div>${data[i].title}</div>
                    <div class="close" onclick="closeOverlay(${i})" title="닫기"></div>
                </div>
               <div class="body">
                    <div class="img">
                        <img src="https://www.dailysecu.com/news/photo/201810/40220_32738_3604.jpg" width= "80px" height = "80px" >
                    </div>
                    <div class="desc">
                        <p class= "content">${data[i].content}</p>
                        <p class= "content">이곳에서 스쿠버 다이빙을 즐기면 수심에 따라 다양한 바닷속 풍경을 볼 수 있는 짜릿함을 느낄 수 있다.</p>
                    </div>
                </div>
                <button class="modal-point btn btn-outline-secondary btn-sm modal-point_btn" type='button' onclick="onClick(${data[i].dpno})" data-btnNo=${data[i].dpno} >자세히 보기</button>
            </div>
        </div>
        <div class ="arrow"></div>
        <div class="black_bg"></div>
        <div class="modal-point_wrap"  >
            <div class="modal-point_close"  onclick="offClick(${data[i].dpno})" >
                <a href="#">close</a>
            </div>
            <div class = "modal-point-title" >${data[i].title}</div>
            <div class ="imgbox" style="overflow-y:scroll; width:580px; height:430px;">
                <div class ="modal-point-img">
                    <img class ="img-1" >
                    <img class ="img-2" >
                    <img class ="img-3" >
                    <img class ="img-4" >
                    <img class ="img-5">
                </div>
            </div>
            <div class ="content-box">
                <p class="modal-point-desc" ></p>
            </div>
        </div>
        <div class ="aside">
        </div>
        `;
    }

    const points = []
    for (const d of data) {
        points.push(new kakao.maps.LatLng(d.lat, d.lng))
    }

    const bounds = new kakao.maps.LatLngBounds();

    let marker=[];


    for(let i = 0; i< points.length; i++){
        marker[i] = new kakao.maps.Marker({position : points[i],image: markerImage });
        marker[i].setMap(map);
        bounds.extend(points[i]);
        overlay[i]  = new kakao.maps.CustomOverlay({
            content: content[i],
            map: map,
            position: marker[i].getPosition()
        });
    }

    map.setBounds(bounds)
    map.setLevel(map.getLevel() < 5 ? 5 : map.getLevel())

    for(let i = 0; i<points.length; i++){
        kakao.maps.event.addListener(marker[i], 'click', function() {
            overlay[i].setMap(map);
        });
        !showing && overlay[i].setMap(null);
    }

}

function closeOverlay(i) {
    overlay[i].setMap(null);
}

function onClick(i){

    // 추가 설명 보여주기
    document.querySelector('.point-desc-box').style.display ='block';
    document.querySelector('.desc-1').innerHTML ="설명1";

    for(let j = 0; j<data.length; j++){
        // if(j != 1){
        //            document.querySelectorAll('.wrap')[j].style.display = 'none';
        //     document.querySelectorAll('.arrow')[j].style.display = 'none';
        // }
        if(i == data[j].dpno){
            document.querySelector(".modal-point-title").innerHTML = data[j].title;
            document.querySelector(".point-desc").innerHTML = data[j].content;
            document.querySelector(".img-1").setAttribute("src",data[j].mainImg);
            document.querySelector(".img-2").setAttribute("src",data[j].mainImg);
            document.querySelector(".img-3").setAttribute("src",data[j].mainImg);
            document.querySelector(".img-4").setAttribute("src",data[j].mainImg);
            document.querySelector(".img-5").setAttribute("src",data[j].mainImg);

        }
    }
    document.querySelector('.modal-point_wrap').style.display='block';
    document.querySelector('.black_bg').style.display='block';
}
function offClick(i){

    // for(let j = 0; j<data.length; j++){
    // if(j != 1){
    //                document.querySelectorAll('.wrap')[j].style.display = 'block';
    //         document.querySelectorAll('.arrow')[j].style.display = 'block';
    //     }

    // }


    document.querySelector('.point-desc-box').style.display ='none';
    document.querySelector('.modal-point_wrap').style.display='none';
    document.querySelector('.black_bg').style.display='none';
}