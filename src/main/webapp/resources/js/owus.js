function qs(selector, from) {

    if(from !== null && typeof from != "undefined") {
        return from.querySelector(selector)
    }
    return document.querySelector(selector)
}

function qsAll(selector, from) {
    if(from !== null && typeof from != "undefined") {
        return from.querySelectorAll(selector)
    }
    return document.querySelectorAll(selector)
}

function qsAddEvent(selector, event, callback) {
    const target = qs(selector)
    try {
        target.addEventListener(event, callback, false)
    } catch (err) {
        console.warn(`"${selector}"는 정의되지 않았습니다`)
    }
}

function qsClickEvent(selector, callback) {
    qsAddEvent(selector, "click", callback)
}

function inputTag(name, value) {
    return `<input type="hidden" name="${name}" value="${value}">`
}

function jsonParser(str) {
    return JSON.parse(str)
}

function hasClass(target, className) {
    return target.classList.contains(className)
    // return target.getAttribute("class").indexOf(className) >= 0
}