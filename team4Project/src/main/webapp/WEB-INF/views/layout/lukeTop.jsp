<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgb(227, 242, 253); --darkreader-inline-bgcolor:#202325;" data-darkreader-inline-bgcolor="">
    <a class="navbar-brand" href="#">HOME</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="register.jsp">會員註冊 <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/member/list">會員清單</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">商品功能</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">關於我們</a>
        </li>
      </ul>
      <form class="form-inline">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>