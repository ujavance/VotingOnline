<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="UTF-8">
<title>VotingOnline首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<style type="text/css">
body, a {
	color: #666;
	font-size: 14px;
}

.navbar-light {
	background: #fff;
	box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.5);
}

.fa {
	padding-right: 0.3rem;
}

.card {
	background: none;
	border: none;
	padding: 0.3rem;
}

.cardFolder {
	width: 123px;
}

.cardFolder:hover, .cardFolder.active, .cardFile:hover, .cardFile.active {
	background-color: #e9e9e9;
	border-color: #d9d9d9;
}

/*.cardFolder .cardFolderImg{
			width: 40px;
		}*/
footer {
	background: #333;
	border-top: 1px solid #eee;
	padding: 30px 0 0;
	color: #aaa;
	text-align: center;
	min-height: 50px;
}

.contentCenter {
	/*-webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.3);*/
	/*box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.3);*/
	/*padding-top: 1.8rem;*/
	
}

.contentCenter li.nav-item {
	width: 7rem;
}
</style>
<script type="text/javascript">
	$(function() {
		// $("#newFile").click(function () {
		// });
		// 点击创建 - 弹出创建文件 和 创建文件夹的选项
		$("#newFile").dropdown();
		$("#funMenu .nav-item").click(function() {
			$("#remindWord").text($(this).text());
		});
		
		// 点击文件夹
		$(".cardFolder").click(function(){
			var folderId= $(this).attr("name");
			console.log("folderId :" + folderId);
			
            $.getJSON("${pageContext.request.contextPath}/IndexServlet?method=getFileOfFolder", {folderId: folderId},
            	function (data) {
            	console.log("data - " + data.filelist);
            	var newHtml = "";
            	// 循环拼接 文件html 
            		for (var i = 0; i < data.filelist.length; i++) {
            			newHtml = newHtml + "<div class=\"col-2\">\r\n" + 
        				"<a href=\"${pageContext.request.contextPath}/IndexServlet?method=getQuestOfFile"+ "&fileId="+  data.filelist[i].questionnaireId +"\"><div class=\"cardFile\" name=\""+ data.filelist[i].questionnaireId +"\">\r\n" + 
        				"								<div class=\"card text-center\">\r\n" + 
        				"									<div class=\"cardFolderImg fa fa-file-o fa-5x\"\r\n" + 
        				"										aria-hidden=\"true\"></div>\r\n" + 
        				"									<div class=\"cardFolderDesc pb-2\">"+ data.filelist[i].questionnaireName +"</div>\r\n" + 
        				"								</div>\r\n" + 
        				"							</div>\r\n" + 
        				"						</a></div>";
					}
            		$("#contentBody").html(newHtml);
            		
            		// 打开目标文件问卷
            		$(".cardFile").click(function(){
            			var fileId= $(this).attr("name");
            			$.getJSON("${pageContext.request.contextPath}/IndexServlet?method=getQuestOfFile", {fileId: fileId},
           	            	function (data) {
	            				/* [{id: "1", options: ["会", "不会", "不确定"], quesType: 1, title: "您会向朋友推荐我们的产品/服务么？"},…] */
	            				for (var i = 0; i < data.questList.length; i++) {
	            					console.log("fileId - " + data.questList[i].title);
	            					console.log("fileId - " + data.questList[i].options);
	            					console.log("fileId - " + data.questList[i].id);
	            					console.log("fileId - " + data.questList[i].quesType);
	            				}
           	            	}, "json"
            	        );
            		});
            	}, "json"
            );
		});
	});
</script>
</head>

<body>

	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="navHeader">
		<a class="navbar-brand ml-5" href="#"> Online Voting </a>
		<ul class="nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="#">首页
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">探索</a></li>
			<li class="nav-item"><a class="nav-link" href="#">登录</a></li>
		</ul>
	</nav>
	<!-- /navbar -->
	<div class="container-fluid pt-5 mt-5 pb-5"
		style="background: #f2f2f2;">
		<!-- <div class="row">
    		<div class="col-md-auto">
    		</div>
    	</div> -->
		<div class="row justify-content-md-center">
			<div class="col-md-auto" style="border-right: 1px solid #f2f2f2;">
				<button data-toggle="dropdown" type="button"
					class=" btn btn-sm bg-dark text-white ml-2 mb-2" id="newFile">
					<i class="fa fa-plus" aria-hidden="true"></i> 新建文件
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/EditServlet?method=registerUI">新建文件</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">新建文件夹</a>
				</div>
			</div>
			<div class="col col-sm-8" style="">
				<button type="button" class="btn btn-sm"
					style="border: none; background: none;" id="remindWord">
					我的文档</button>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-sm-10">
				<hr>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto contentCenter "
				style="border-right: 1px solid #f2f2f2;">
				<ul class="nav flex-column nav-fill text-center" id="funMenu">

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fa fa-files-o" aria-hidden="true"></i> 我的问卷
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fa fa-pencil-square-o" aria-hidden="true"></i> 最近编辑
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fa fa-star-o" aria-hidden="true"></i> 标星文件
					</a></li>
					<li class="nav-item"><a class="nav-link " href="#"> <i
							class="fa fa-trash" aria-hidden="true"></i> 删除记录
					</a></li>
				</ul>
			</div>
			<div class="col col-sm-8 contentCenter" style="min-height: 500px;">
	
				<div class="row" id="contentBody">

					<c:forEach items="${folder}" var="item">
						<div class="col-2">
							<div class="cardFolder" name="${item.folderId}">
								<div class="card text-center">
									<div class="cardFolderImg fa fa-folder-o fa-5x"
										aria-hidden="true"></div>
									<div class="cardFolderDesc pb-2">${item.folderName}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<footer> </footer>
</body>

</html>