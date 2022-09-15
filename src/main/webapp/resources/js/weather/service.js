const weatherService = function (render) {
    let state = {}

    function setState(newstate) {

        state = {...state, ...newstate}

        if(newstate) {
            render.renderCalendar(state.date)
            getServerMonthData()
            getServerWeekData()
        }
    }

    async function getServerMonthData() {
        const target = `${state.date.getFullYear()}/${state.date.getMonth()+1}/${state.geoID}`
        const resp = await axios.get(`${path}/data/month/${target}`)

        render.renderMonthData(resp.data)
        // render.renderWeekData(resp.data)

    }

    async function getServerWeekData() {
        const target = `${state.date.getFullYear()}/${state.date.getMonth()+1}/${state.date.getDate()}/${state.geoID}`
        const resp = await axios.get(`${path}/data/week/${target}`)

        render.renderWeekData(resp.data)
    }

    return {setState, getServerMonthData, getServerWeekData}
}