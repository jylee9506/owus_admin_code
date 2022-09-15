Number.prototype.fz = function(width){
    let n = String(this);//문자열 변환
    return n.length >= width ? n:new Array(width-n.length+1).join('0')+n;//남는 길이만큼 0으로 채움
}

const weatherRender = (function () {
    const weekKR = ["일", "월", "화", "수", "목", "금", "토"]

    const dateToString = ({year, month, day}) => {
        return year.fz(4) + month.fz(2) + day.fz(2)
    }

    const getSvg = (data, idx) => {
        // console.log(data["cloudCover"])
        const cloudCover = parseFloat(data["cloudCover"].split(",")[idx])
        const precipitation = parseFloat(data["precipitation"].split(",")[idx])

        let svg
        if (precipitation > 0) svg = precipitation >= 30 ? 10 : precipitation >= 15 ? 9 : precipitation >= 3 ? 8 : 7
        else svg = cloudCover > 66 ? 5 : cloudCover > 33 ? 3 : 1;

        return svg
    }

    function renderCalendar(date) {
        const viewYear = date.getFullYear();
        const viewMonth = date.getMonth();

        const prevLast = new Date(viewYear, viewMonth, 0);
        const thisLast = new Date(viewYear, viewMonth + 1, 0);
        const nextLast = new Date(viewYear, viewMonth + 2, 0);

        const prevLastdd = prevLast.getDate();
        const prevLastday = prevLast.getDay();

        const todayLastdd = thisLast.getDate();
        const todayLastday = thisLast.getDay();

        const calendarDates = []

        if ( prevLastday !== 6) {
            for(let day = prevLastdd-prevLastday; day <= prevLastdd; day++){
                calendarDates.push({
                    "year": prevLast.getFullYear(),
                    "month": prevLast.getMonth()+1,
                    "day": day
                });
            }
        }

        [...Array(todayLastdd +1).keys()].slice(1).forEach(day => {
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

            html += `<div class="col${dayInWeek === 0 ? " sunday" : dayInWeek === 6 ? " saturday" : ""}${(date.month === thisLast.getMonth() + 1) ? "" : " not-active"}" data-date="${dateToString(date)}">
                    <div class="weather-content">
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

        qs(".renderTarget").innerHTML = html
        qs(".year-month").textContent = `${viewYear}년 ${viewMonth + 1}월`;
    }

    function renderMonthData(data) {
        for (const key in data) {

            try {
                qs(`div[data-date='${key}']`).innerHTML += `
                    <div class="summary normal d-flex flex-low justify-content-center align-items-center">
                      <i class="wt-icon wt-small wt-${getSvg(data[key], 2)}"></i>
                      <div class="note">${getMonthData(data[key], "airTemperature80m")}º</div>
                    </div>
                    <div class="summary small text-start">
                      <div class="d-flex flex-row justify-content-center">
                        <div class="text-center p-1 sea-temperature">
                          <i class="wt-icon wt-xsmall wt-91"></i>
                          <div class="note">${getMonthData(data[key], "waterTemperature")}º</div>
                        </div>
                        <div class="text-center p-1 sea-wave">
                          <i class="wt-icon wt-xsmall wt-93"></i>
                          <div class="note">${getMonthData(data[key], "waveHeight")}m</div>
                        </div>
                        <div class="text-center p-1 sea-wind">
                          <i class="wt-icon wt-xsmall wt-94"></i>
                          <div class="note">${getMonthData(data[key], "windSpeed")}m/s</div>
                        </div>
                      </div>
                    </div>
                `
            } catch (e) {}
        }

        function getMonthData(data, key) {
            return Math.round(data[key].split(",")[2] * 10) / 10.0
        }

    }

    function renderWeekData(data) {
        console.log(data)
        const weekArea = qs(".weekArea")

        let html = ""
        let count = 0

        for (const key in data) {
            const wdata = data[key]
            const date = new Date(`${key.substring(0, 4)}-${key.substring(4, 6)}-${key.substring(6, 8)}`)

            const summary = document.createElement("div")
            summary.setAttribute("class", "col-auto d-flex")


            for (let i = 0; i < 2; i++) {
                let detailArea = ""

                const cellWeather = document.createElement("div")
                const weatherDate = document.createElement("div")
                const weatherIcon = document.createElement("div")
                const weatherMore = document.createElement("div")

                cellWeather.setAttribute("class", "d-flex ps-2 pe-2 cell-weather align-items-center")
                weatherDate.setAttribute("class", "text-center weather-date")
                weatherIcon.setAttribute("class", "weather-icon")
                weatherMore.setAttribute("class", "weather-more")


                if(count === 0) {
                    detailArea += `<div style="font-size: 1.1rem">${i===0?"오전":"오후"}</div>`
                }
                detailArea += `<div class="weather-temperature unit celsius">${getWeekData(wdata, "airTemperature80m", i)}</div>`

                weatherDate.innerHTML = detailArea
                weatherIcon.innerHTML = `<i class="wt-icon wt-small wt-${getSvg(wdata, i)}"></i>`
                weatherMore.innerHTML = `
                                <div class="weather-more-val d-flex">
                                  <i class="wt-icon wt-mini wt-90"></i>
                                  <div class="unit mmh">${getWeekData(wdata, "precipitation", i)}</div>
                                </div>
                                <div class="weather-more-val d-flex">
                                  <i class="wt-icon wt-mini wt-91"></i>
                                  <div class="unit celsius">${getWeekData(wdata, "waterTemperature", i)}</div>
                                </div>
                                <div class="weather-more-val d-flex">
                                  <i class="wt-icon wt-mini wt-93"></i>
                                  <div class="unit meter">${getWeekData(wdata, "waveHeight", i)}</div>
                                </div>
                `

                cellWeather.appendChild(weatherDate)
                cellWeather.appendChild(weatherIcon)
                cellWeather.appendChild(weatherMore)

                summary.appendChild(cellWeather)
            }

            html += `
                    <div class="card mb-2 week-card">
                        <div class="row g-0 align-items-center h-100">
                            <div class="col-4 text-center cell-date">
                                <div class="v-day ${date.getDay()===0?"sunday":date.getDay()===6?"saturday":""}">${weekKR[date.getDay()]}</div>
                                <div class="v-date">${date.getMonth()+1}.${date.getDate()}</div>
                            </div>
                            ${summary.outerHTML}
                        </div>
                    </div>
            `
            count++
        }

        weekArea.innerHTML = html

        function getWeekData(data, key, idx) {
            return Math.round(data[key].split(",")[idx] * 10) / 10.0
        }

    }

    return {renderCalendar, renderMonthData, renderWeekData}
})()