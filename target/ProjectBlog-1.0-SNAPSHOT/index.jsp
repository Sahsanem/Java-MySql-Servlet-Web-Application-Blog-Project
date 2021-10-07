<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<!DOCTYPE html>

<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand/logo -->
    <a class="navbar-brand" href="index.jsp">My Blog</a>

    <!-- Links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="adminLogin.jsp">Giriş</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="aboutMe.jsp">Hakkımızda</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="contactMe.jsp">İletişim</a>
        </li>
    </ul>
</nav>
<img src="https://images5.alphacoders.com/663/663858.png" class="img-fluid">
<div class="container">
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <h2 align="center">BLOGLAR</h2>
            <c:forEach items="${ dbUtil.allBlogMain() }" var="item" >
                <div class="md-3" align="center"><h4><a href="blog-detailservlet?bid=${item.bid}" >
                            ${item.title}</a></h4>
                </div>
                <div class="md-3" align="center">${item.date}</div>

            </c:forEach>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>