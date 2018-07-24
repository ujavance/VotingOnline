<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <title>VotingOnline注册</title>
  
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/jquery.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>

<body style=" background: #f2f2f2; ">
  <div class="container">
 <div class="row align-items-center" style="margin-top: 10%;">
  <div class="col-sm-4 offset-sm-8">
    <div class="text-start mb-4">
      <h5>
        Online Voting
      </h5>
    </div>
    <div class="register" style="background: #ffff;padding: 30px 50px; box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.5);">
      <h5 class="text-center text-warning">${msg}</h5>
      <form method="post" action="${pageContext.request.contextPath}/UserServlet?method=registerUser">
        <div class="form-group">
          <label for="exampleInputEmail1">Username</label>
          <input type="text" class="form-control" name="username" id="username" aria-describedby="emailHelp" placeholder="Enter Username">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Password</label>
          <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirm Password</label>
          <input type="password" class="form-control" id="confirmPassword"" placeholder="Confirm Password">
        </div>
        <div class="form-check mb-2">
          <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
          <label class="form-check-label"  for="exampleCheck1">Check me out</label>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-dark">Submit</button>
        </div>
      </form>
    </div>
  </div>
</div>
</div>
</body>
</html>