<%@ page import="props.Blog" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
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

<div class="container">
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">

      <%
        Blog blog=(Blog) request.getAttribute("blog");
      %>
      <h2><%=blog.getTitle()%></h2>
      <div><%=blog.getDetail()%></div>
    </div>
    <div class="col-md-3"></div>
  </div>
</div>
</body>
</html>
