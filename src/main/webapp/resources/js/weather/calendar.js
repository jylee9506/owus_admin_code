
const dateToString = ({year, month, day}) => {
    return year.fz(4) + month.fz(2) + day.fz(2)
}

Number.prototype.fz = function(width){
    let n = String(this);//문자열 변환
    return n.length >= width ? n:new Array(width-n.length+1).join('0')+n;//남는 길이만큼 0으로 채움
}

const renderCalender = () => {
    let date = new Date();
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();

    document.querySelector(".year-month").textContent = `${viewYear}년 ${viewMonth+1}월`;

    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth +1 , 0);
    const nextLast = new Date(viewYear, viewMonth +2 , 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    // const prevDates = [];
    // const thisDates = [...Array(TLDate +1).keys()].slice(1);
    // const nextDates = [];

    const calendarDates = []

    if ( PLDay !== 6) {
        for(let day = PLDate-PLDay; day <= PLDate; day++){
            calendarDates.push({
                "year": prevLast.getFullYear(),
                "month": prevLast.getMonth()+1,
                "day": day
            });
        }
    }

    [...Array(TLDate +1).keys()].slice(1).forEach(day => {
        calendarDates.push({
            "year": thisLast.getFullYear(),
            "month": thisLast.getMonth()+1,
            "day": day
        })
    })

    const untilSixWeek = 42-calendarDates.length
    for(let day = 1; day <= untilSixWeek; day++) {
        calendarDates.push({
            "year": nextLast.getFullYear(),
            "month": nextLast.getMonth()+1,
            "day": day
        })
    }

    let dayInWeek = 0
    let weekCount = 1
    let html = ""
    // const today = {"year": }
    calendarDates.forEach(date => {

        if(dayInWeek === 0) {
            html += `<div class="row text-end dates ${weekCount === 1 ? "week-start" : ""}" data-week="${weekCount}">`
        }

        html += `<div class="col${dayInWeek === 0 ? " sunday" : dayInWeek === 6 ? " saturday" : ""}" data-date="${dateToString(date)}">
                    <div class="weather-content${(date.month === thisLast.getMonth() + 1) ? "" : " not-current"}">
                        <div class="day">${date.day}</div>
                    </div>
                </div>`

        if(dayInWeek === 6) {
            dayInWeek = 0
            weekCount++
            html += "</div>"
        } else {
            dayInWeek++
        }
    })

    document.querySelector(".renderTarget").innerHTML = html

    // console.log(calendarDates)

    // const dates = prevDates.concat(thisDates, nextDates);
    // const firstDateIndex = dates.indexOf(1);
    // const lastDateIndex = dates.lastIndexOf(TLDate);

    function makeDay(y, m, d) {

    }

    // let html = ""
    // for (const day of prevDates) {
    //     html += `<div class="date" data-date="${viewYear+dateFormat(viewMonth, day)}">
    //             <span class="other">${day}</span>
    //             </div>`
    // }
    //
    // for (const day of thisDates) {
    //
    //     html += `<div class="date" data-date="${viewYear+dateFormat(viewMonth+1, day)}">
    //             <span class="this">${day}</span>
    //             </div>`
    // }
    //
    // for (const day of nextDates) {
    //     html += `<div class="date" data-date="${viewYear+dateFormat(viewMonth+2, day)}">
    //             <span class="other">${day}</span>
    //             </div>`
    // }

    // dates.forEach((date, i) => {
    //     const condition = i >= firstDateIndex && i < lastDateIndex +1
    //                             ? 'this'
    //                             : 'other';
    //     dates[i] = `<div class="date" data-date="${date}"><span class="${condition}">${date}</span></div>`;
    // });

    // document.querySelector(".dates").innerHTML = dates.join("");
    // document.querySelector(".dates").innerHTML = html

    const today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for( let date of document.querySelectorAll(".this")){
            if( +date.innerText === today.getDate()){
                date.classList.add("today");
                break;
            }
        }
    }

    weatherService.getServerData()
};

renderCalender();

const mydate = new Date()
mydate.setMonth(mydate.getMonth()-12)
console.log(mydate.getFullYear())

const prevMonth = () =>{
    date.setMonth(date.getMonth() -1);
    renderCalender();
}


const nextMonth = () =>{
    date.setMonth(date.getMonth() + 1);
    renderCalender();
}

const goToday = () =>{
    date = new Date();
    renderCalender();
}
//
// document.querySelector(".go-prev").addEventListener("click", (e) =>{
//     prevMonth();
//     imgLoad();
// }, false)
//
// document.querySelector(".go-today").addEventListener("click", (e) =>{
//     goToday();
//     imgLoad();
// }, false)
//
// document.querySelector(".go-next").addEventListener("click", (e) =>{
//     nextMonth();
//     imgLoad();
// }, false)
