<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>VotingOnline</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/js/jquery.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
</body>
</html>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6"></div>
			<div class="col-sm-4">
				<div class="register"
					style="margin-top: 40%; background: #eee; padding: 8px 10px;">
					<h3>
						Lgoin <small>Welcome~</small>
					</h3>
					<form method="post"
						action="${pageContext.request.contextPath}/UserServlet?method=loginUser">
						<div class="form-group">
							<label for="exampleInputEmail1">Username</label> <input
								type="text" class="form-control" name="username" id="username"
								aria-describedby="emailHelp" placeholder="Enter Username">
							<small id="emailHelp" class="form-text text-muted">We'll
								never share your info with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" name="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="form-check">
							<input type="checkbox" name="check" class="form-check-input"
								id="exampleCheck1" value="1"> <label class="form-check-label"
								for="exampleCheck1">Check me out</label>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>