window.addEventListener("load",function(){
    const section = document.querySelector(".info-gallery");
    const imgListBox = section.querySelector(".img-list-box");
    const showRoom = section.querySelector(".show-room");
    const img = showRoom.querySelector("img");

    let current = imgListBox.querySelector(".active");
    let isWorking = false;

    section.onkeydown = function(e){
        if(e.code == "ArrowLeft"){
            var prevNode = current.previousElementSibling;
            current.classList.remove("active");
            prevNode.classList.add("active");
            current = prevNode;
        }else if(e.code == "ArrowRight"){
            var nextNode = current.nextElementSibling;
            current.classList.remove("active");
            nextNode.classList.add("active");
            current = nextNode;
        }
        img.src = current.firstElementChild.src;
    };

    imgListBox.onwheel = function(e){
        e.preventDefault();

        if(isWorking)
            return;

        if(e.deltaY < 0){ // 왼쪽
            var prevNode = current.previousElementSibling;
            current.classList.remove("active");
            prevNode.classList.add("active");
            current = prevNode;

        }else{ // 오른쪽
            var nextNode = current.nextElementSibling;
            current.classList.remove("active");
            nextNode.classList.add("active");
            current = nextNode;
        }
        isWorking = true;

        img.src = current.firstElementChild.src;

        current.ontransitionend = function(e){
            // img.src = current.firstElementChild.src;
            isWorking = false;
        };

    };

    let scale = 1;
    img.onwheel = function(e){
        let min =1;
        let max =2;
        let current = 1;
        e.preventDefault();

        scale += e.deltaY*0.001;

        if(scale < min){
            scale = min;
            return
        }

        if(scale > max){
            scale = max;
            return
        }

        img.style.transform = "scale("+scale+")";
    };

});