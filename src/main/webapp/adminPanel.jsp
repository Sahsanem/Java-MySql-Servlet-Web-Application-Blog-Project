<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <title>Admin Panel</title>
</head>
<body>
<ul class="nav justify-content-end">
    <li class="nav-item">
        <a class="nav-link" href="index.jsp">Anasayfa</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="logout">Çıkış</a>
    </li>

</ul>
<div class="container">
<div class="row">
    <div class="col-sm-3">
        <h2>Blog Ekle</h2>

        <%
            Object insertErrorObject = request.getAttribute("insertError");
            if ( insertErrorObject != null ) {
                String errorMessage = ""+insertErrorObject;
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Hata!</strong> <%=errorMessage %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>

        <form action="blog-insert" method="post" >
            <div class="mb-3">
                <input type="text" name="title" placeholder="Başlık" class="form-control" required />
            </div>
            <div class="mb-3">
                <input type="textarea" name="detail" placeholder="Detay" class="form-control" required />
            </div>
            <button class="btn btn-success"> Kaydet </button>
        </form>
    </div>
    <div class="col-sm-9">
        <h2>Blog Listesi</h2>

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">Bid</th>
                <th scope="col">Başlık</th>
                <th scope="col">Detay</th>
                <th scope="col">Düzenle/Sil</th>
            </tr>
            </thead>
            <tbody>
            <%
                int aid=adm.getAid();
            %>

            <c:if test="${ dbUtil.allBlog(aid).size() == 0 }">
                <tr>Blog Yok</tr>
            </c:if>

            <c:if test="${ dbUtil.allBlog(aid).size() > 0 }">
                <c:forEach items="${ dbUtil.allBlog(aid) }" var="item" >
                    <tr>
                        <th scope="row"><c:out value="${item.bid}"></c:out></th>
                        <td><c:out value="${item.title}"></c:out></td>
                        <td><c:out value="${item.detail}"></c:out></td>
                        <td>
                            <a href="blog-update?bid=${item.bid}" class="btn btn-light btn-sm">Düzenle</a>
                            <a onclick="return show_alert()" href="blog-insert?bid=${item.bid}" class="btn btn-dark btn-sm">Sil</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>

            </tbody>
        </table>

    </div>
</div>
    <script>
        function show_alert() {
            return confirm("Silmek istediğinizden emin misniz?")
        }
    </script>
</div>
</body>
</html>
