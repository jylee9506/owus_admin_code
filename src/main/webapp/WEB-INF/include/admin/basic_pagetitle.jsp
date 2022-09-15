<%--
  User: 
  Date: 2022-05-19
  Time: 오전 11:50
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<div class="pagetitle">
  <h1 class="topTitle"></h1>
  <nav>
    <ol class="breadcrumb"></ol>
  </nav>
</div><!-- End Page Title -->


<script>
    const sidebar = document.querySelector(".sidebar")
    const aTags = sidebar.querySelectorAll(".nav-link")
    const navContents = sidebar.querySelectorAll(".nav-content")

    let foundActiveClass = false
    let path = window.location.pathname
    path = path.at(path.length-1) === "/" ? path.slice(0, -1) : path

    try { path = path.split("/").slice(0, 4).join("/") }
    catch (e) {}

    let pageInfo = []
    aTags.forEach(a => { // just page
        if(a.getAttribute("href") === path) {
            a.classList.remove("collapsed")

            pageInfo.push(a.innerText)

            foundActiveClass = true
            return 0
        }
    })

    navContents.forEach(nav => { // dropdown
        if(!foundActiveClass) {
            nav.querySelectorAll("a").forEach(a => {
                if(a.getAttribute("href") === path) {
                    const prev = nav.previousElementSibling

                    nav.classList.add("show")
                    prev.classList.remove("collapsed")
                    a.classList.add("active")

                    pageInfo.push(prev.innerText)
                    pageInfo.push(a.innerText)

                    foundActiveClass = true
                    return 0
                }
            })
        }
    })

    let topTitle = pageInfo.slice(-1)
    document.querySelector(".topTitle").innerHTML = `\${topTitle}`
    document.querySelector("title").innerHTML = `\${topTitle}`

    let breadcrumbHTML = `<li class="breadcrumb-item"><a href="/admin">홈</a></li>`
    pageInfo.forEach(info => {
        breadcrumbHTML += `<li class="breadcrumb-item">\${info}</a></li>`
    })

    const breadcrumb = document.querySelector(".breadcrumb")
    breadcrumb.innerHTML = `\${breadcrumbHTML}`
    breadcrumb.lastElementChild.classList.add("active")

</script>