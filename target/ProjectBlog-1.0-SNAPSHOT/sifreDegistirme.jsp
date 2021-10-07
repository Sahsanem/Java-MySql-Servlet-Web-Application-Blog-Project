<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<html>
<head>
  <title>Sifre Degistir</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

</head>
<body>
<div class="container">
  <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="index.jsp">Anasayfa</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="logout">Çıkış</a>
    </li>

  </ul>

  <div class="row">
    <div class="col-sm-6">
      <h2>Şifre Değiştir</h2>
      <%
        Admin admin=new Admin();
      %>
      <form action="sifre-servlet" method="post" >

        <div class="mb-3">
          <input type="email" name="email" placeholder="Email" class="form-control" required />
        </div>
        <div class="mb-3">
          <input  type="password" name="oldpassword" placeholder="Eski Şifre" class="form-control" required />
        </div>
        <div class="mb-3">
          <input  type="password" name="password" placeholder="Yeni Şifre" class="form-control" required />
        </div>
        <button class="btn btn-success" type="submit"> Kaydet </button>
      </form>
    </div>

  </div>


  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</div>
</body>
</html>
