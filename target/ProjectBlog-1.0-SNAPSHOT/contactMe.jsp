<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <title>Contact Me</title>
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
<img src="https://raw.githubusercontent.com/sumcvhr/websiteornegi/main/Group%2016601.png">
<div class="container">

    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">

    <form action="contact-servlet" method="post">
        <div class="form-group">
            <label for="name">Adınız:</label>
            <input type="text" class="form-control" name="name" id="name">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" name="email" id="email">
        </div>
        <div class="form-group">
            <label for="message">Mesajınız:</label>
            <input type="text" class="form-control" name="message" id="message">
        </div>
        <div>
        <button type="submit" class="btn btn-success">Gönder</button>
        </div>
    </form>
        </div>
        <div class="col-sm-4"></div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>