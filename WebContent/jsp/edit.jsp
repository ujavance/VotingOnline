<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="UTF-8">
	<title>注册</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<style type="text/css">
	a {
		color: #666;
	}
	body {
		color: #666;
		background-color: 
	}
	/*题目覆盖样式*/
	.card:hover {
	    background-color: #d4edda33;
	}
	/*错误图标颜色*/
	.fa-times-circle{
		color: #f00;
	}
	/*正确图标颜色*/
	.fa-check{
		color: #00A65A;
	}
	/*警告图标颜色*/
	.fa-warning{
		color: #ffff00;
	}
	#btnGroup{
	    position: fixed;
	    left: 0;
	    width: 10rem;
	    /*background: #f0f2f5;*/
	    min-height: 500px;
	    border-top-right-radius: 5px;
	    border-bottom-right-radius: 5px;
	    padding-bottom: 1rem;
	}
	#editForm{
		position: fixed;
		right: 10rem;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		padding-bottom: 1rem;
		max-width: 16.666667%;
	}
	.navbar-light {
	    background: #fff;
	    -webkit-box-shadow: 0 2px 8px #f0f1f2;
	    box-shadow: 0 2px 8px #f0f1f2;
	    /* width: 100%; */
	}

/*
图标大小：fa-lg/fa-2x/..../fa-5x
旋转功能：fa-spin
图标颜色：设置i标签的color属性
旋转图标：fa-refresh 
警告图标：fa-warning  color:ffff00
错误图标：fa-times-circle     color:f00
正确图标： fa-check     color:00A65A
上传图标：fa-upload
删除图标：fa-trash-o/ fa-trash
修改图标：fa-edit
添加图标：fa-plus
下载图标：fa-download
导入图标：fa-sign-in
导出图标：fa-sign-out
*/
</style>
</head>

<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">

		<a class="navbar-brand" href="#">
			<img src="img/logo1.PNG" width="30" height="30" class="d-inline-block align-top" alt="">
			Online Voting
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">首页
						<span class="sr-only">(current)</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">探索</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">登录</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					关于
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="index.jsp">去index</a>
				</li>
			</ul>
		</div>
	</nav>
	<!-- /navbar -->
	<div class="container-fluid mt-5">
		<div class="row justify-content-md-center">

			<div id="btnGroup">
				<div class="d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-primary" id="radioVertical">单选题(竖向)</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-secondary" id="radioInline">单选题(横向)</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-success">Success</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-danger">Danger</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-warning" id="generateFinishQuestionForm">生成表单</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-info">Info</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-light">Light</button></div>
				<div class="mt-3 d-flex justify-content-center"><button type="button" class="btn btn-sm btn-outline-dark">Dark</button></div> 
			</div>
			<div class="col-sm-7" style="min-height: 500px;">
				
				<form id="myFormId" method="post" action="#">
					<h3>调查问卷</h3>
					<div class="card" id="card01" style="border-color: #c3e6cb">
						  <div class="card-body">
						  		<h5 class="card-title editResult">你最喜欢的明星？</h5>
						  		<div class="custom-control custom-radio custom-control-inline">
						  		  <input type="radio" id="customRadio001" name="customRadio" class="custom-control-input">
						  		  <label class="custom-control-label editResult" for="customRadio001">周***</label>
						  		</div>
						  		<div class="custom-control custom-radio custom-control-inline">
						  		  <input type="radio" id="customRadio002" name="customRadio" class="custom-control-input">
						  		  <label class="custom-control-label editResult" for="customRadio002">王**</label>
						  		</div>
						  		<div class="custom-control custom-radio custom-control-inline">
						  		  <input type="radio" id="customRadio003" name="customRadio" class="custom-control-input">
						  		  <label class="custom-control-label editResult" for="customRadio003">王**</label>
						  		</div>
						  		<div class="custom-control custom-radio custom-control-inline">
						  		  <input type="radio" id="customRadio004" name="customRadio" class="custom-control-input">
						  		  <label class="custom-control-label editResult" for="customRadio004">王**</label>
						  		</div>
						  </div>
						  <div class="cardfooter" style="position: absolute;right: 1rem;top: 1rem; display: none;">
	  					  		<span class="fa fa-times-circle mr-3 delete" name="card01"></span>
	  					  		<span class="fa fa-check copy"></span>
		  				  </div>
					</div>

					<div class="card mt-3" id="card02" style="border-color: #c3e6cb;">
					  <div class="card-body">
					  		<h5 class="card-title editResult">你喜欢周国平的哪一句话？</h5>
					  		<div class="custom-control custom-radio">
					  		  <input type="radio" id="customRadio01" name="customRadio" class="custom-control-input">
					  		  <label class="custom-control-label editResult" for="customRadio01">我始终相信，一切高贵的情感都羞于表白，一切深刻的体验都拙于言辞
					  		  </label>
					  		</div>
					  		<div class="custom-control custom-radio">
					  		  <input type="radio" id="customRadio02" name="customRadio" class="custom-control-input">
					  		  <label class="custom-control-label  editResult" for="customRadio02">被人理解是幸运的，但不被理解未必不幸。一个把自己的价值完全寄托于他人的理解上面的人往往并无价值</label>
					  		</div>
					  		<div class="custom-control custom-radio">
					  		  <input type="radio" id="customRadio03" name="customRadio" class="custom-control-input">
					  		  <label class="custom-control-label editResult" for="customRadio03">孤独和喧嚣都难以忍受。如果一定要忍受，我宁可选择孤独。</label>
					  		</div>
					  		<div class="custom-control custom-radio">
					  		  <input type="radio" id="customRadio04" name="customRadio" class="custom-control-input">
					  		  <label class="custom-control-label editResult" for="customRadio04">不要太在乎一些人，越在乎，越卑微。 _____周国平</label>
					  		</div>
						  <div class="cardfooter" style="position:  absolute;right: 1rem;top: 1rem;  display: none;">
	  					  		<span class="fa fa-times-circle mr-3 delete" name="card02"></span>
	  					  		<span class="fa fa-check copy"></span>
		  				  </div>
					  </div>
					</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
			<div id="editForm">
				<div id="editMyQuestion">
				<div class="form-group">
					<label for="itemTitle" hidden>标题</label>
					<div class="input-group">
					  <div class="input-group-prepend" hidden>
					    <span class="input-group-text" id="itemprepend0">标题</span>
					  </div>
					  <textarea class="form-control" rows="1" id="itemTitle" placeholder="标题" aria-describedby="itemprepend0" ></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="item0" hidden>选项一</label>
					<div class="input-group">
					  <div class="input-group-prepend" hidden>
					    <span class="input-group-text" id="itemprepend1">选项一</span>
					  </div>
					  <textarea class="form-control" rows="2" id="item0" placeholder="选项一" aria-describedby="itemprepend1" ></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="item1" hidden>选项二</label>
					<div class="input-group">
					  <div class="input-group-prepend" hidden>
					    <span class="input-group-text" id="itemprepend1">选项二</span>
					  </div>
					  <textarea class="form-control" rows="2" id="item1" placeholder="选项二" aria-describedby="itemprepend1" ></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="item2" hidden>选项三</label>
					<div class="input-group">
					  <div class="input-group-prepend" hidden>
					    <span class="input-group-text" id="itemprepend2">选项三</span>
					  </div>
					  <textarea class="form-control" rows="2" id="item2" placeholder="选项三" aria-describedby="itemprepend2" ></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="item3" hidden>选项四</label>
					<div class="input-group">
					  <div class="input-group-prepend" hidden>
					    <span class="input-group-text" id="itemprepend3">选项四</span>
					  </div>
					   <textarea class="form-control" rows="2" id="item3" placeholder="选项四" aria-describedby="itemprepend3" ></textarea>
					</div>
				</div>

				<div class="form-group">
					<button type="button" id="sureFinishBut" class="btn btn-sm btn-outline-success mr-2">
						确认
						<span class="fa fa-check copy"></span>
					</button>
					<button type="button" class="btn btn-sm btn-outline-danger">
						取消
						<span class="fa fa-times-circle" name="card02"></span>						
					</button>
				</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(document).ready(function(){

	// 全局的递增数字
	var num = 0;
	var formNum = 0;

	/*控制删除和复制按钮的显示*/
		function MoveToCard() {
		$(this).find(".cardfooter").show(1000);
	}
	function LeaveFromCard() {
		$(this).find(".cardfooter").hide();
	}
  $(".card").mouseenter(MoveToCard).mouseleave(LeaveFromCard);

  /*
  点击删除，删除该表单
  将一个问题的id保存到，删除按钮的 name属性上，获取name属性的值，将其隐藏。
  */
  function deleteRadioVertical() {
  	$("#"+$(this).attr("name")).hide(500);
  }
  $(".delete").click(deleteRadioVertical);

  /* ---- Center Start ---- */
  // 点击创建-竖直表单
  function addRadioInLine() {
  	$(".card:last").after(["<div class=\"card mt-3\" id=\"card" + num + "\" style=\"border-color: #c3e6cb\">",
"						  <div class=\"card-body\">",
"						  		<h5 class=\"card-title editResult\">你最喜欢的明星？</h5>",
"						  		<div class=\"custom-control custom-radio custom-control-inline\">",
"						  		  <input type=\"radio\" id=\"customRadio" + (++formNum) + "\" name=\"customRadio\" class=\"custom-control-input\">",
"						  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">周***</label>",
"						  		</div>",
"						  		<div class=\"custom-control custom-radio custom-control-inline\">",
"						  		  <input type=\"radio\" id=\"customRadio" + formNum + "\" name=\"customRadio\" class=\"custom-control-input\">",
"						  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">王**</label>",
"						  		</div>",
"						  		<div class=\"custom-control custom-radio custom-control-inline\">",
"						  		  <input type=\"radio\" id=\"customRadio" + formNum + "\" name=\"customRadio\" class=\"custom-control-input\">",
"						  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">王**</label>",
"						  		</div>",
"						  		<div class=\"custom-control custom-radio custom-control-inline\">",
"						  		  <input type=\"radio\" id=\"customRadio" + formNum + "\" name=\"customRadio\" class=\"custom-control-input\">",
"						  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">王**</label>",
"						  		</div>",
"						  </div>",
"						  <div class=\"cardfooter\" style=\"position: absolute;right: 1rem;top: 1rem; display: none;\">",
"	  					  		<span class=\"fa fa-times-circle mr-3 delete\" name=\"card" + (num++) + "\"></span>",
"	  					  		<span class=\"fa fa-check copy\"></span>",
"		  				  </div>",
"					</div>"].join(""));
  	  	 $(".card").mouseenter(MoveToCard).mouseleave(LeaveFromCard);
  	  $(".delete").click(deleteRadioVertical);
  	  $(".card").click(editQuestion);
  }
 	function addRadioVertical() {
 		$(".card:last").after(["					<div class=\"card mt-3\" id=\"card" + num + "\" style=\"border-color: #c3e6cb;\">",
"					  <div class=\"card-body\">",
"					  		<h5 class=\"card-title editResult\">你喜欢周国平的哪一句话？</h5>",
"					  		<div class=\"custom-control custom-radio\">",
"					  		  <input type=\"radio\" id=\"customRadio" + (++formNum) + "\" name=\"customRadio\" class=\"custom-control-input\">",
"					  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">我始终相信，一切高贵的情感都羞于表白，一切深刻的体验都拙于言辞",
"					  		  </label>",
"					  		</div>",
"					  		<div class=\"custom-control custom-radio\">",
"					  		  <input type=\"radio\" id=\"customRadio" + formNum + "\" name=\"customRadio\" class=\"custom-control-input\">",
"					  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">被人理解是幸运的，但不被理解未必不幸。一个把自己的价值完全寄托于他人的理解上面的人往往并无价值</label>",
"					  		</div>",
"					  		<div class=\"custom-control custom-radio\">",
"					  		  <input type=\"radio\" id=\"customRadio" + formNum + "\" name=\"customRadio\" class=\"custom-control-input\">",
"					  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">孤独和喧嚣都难以忍受。如果一定要忍受，我宁可选择孤独。</label>",
"					  		</div>",
"					  		<div class=\"custom-control custom-radio\">",
"					  		  <input type=\"radio\" id=\"customRadio" + formNum + "\" name=\"customRadio\" class=\"custom-control-input\">",
"					  		  <label class=\"custom-control-label editResult\" for=\"customRadio" + (formNum++) + "\">不要太在乎一些人，越在乎，越卑微。 _____周国平</label>",
"					  		</div>",
"						  <div class=\"cardfooter\" style=\"position:  absolute;right: 1rem;top: 1rem;  display: none;\">",
"	  					  		<span class=\"fa fa-times-circle delete mr-3\" name=\"card" + (num++) + "\"></span>",
"	  					  		<span class=\"fa fa-check copy\"></span>",
"		  				  </div>",
"					  </div>",
"					</div>"].join(""));

  	 $(".card").mouseenter(MoveToCard).mouseleave(LeaveFromCard);
  	  $(".delete").click(deleteRadioVertical);
  	  $(".card").click(editQuestion);
 	}

  $("#radioVertical").click(addRadioVertical);
  $("#radioInline").click(addRadioInLine);
  /* ---- Center End---- */

  /* ---- Right Start---- */
  // 获得四个选项的值
  function editQuestion() 
  {
	  	$(this).find(".custom-control-label").each(function(index,element){
	    	// 将题目的 文字 写到 输入框
	    	$("#item"+index).val($(this).text());
	  	});

	  	// 标题
	  	var title = $(this).find(".card-title").text();
	  	$("#itemTitle").val(title);
	  	// 将 ID 写入 到编辑栏目
	  	console.log("正在编辑 ： " + $(this).attr('id') + " title : "+ title);
	  	// 记住当前正在编辑的题目
	  	$("#sureFinishBut").attr("name" , $(this).attr('id'));
  }

  $(".card").click(editQuestion);

  // 将编辑后的值传回问题集合
  function finishEditQuestion() 
  {
	  	// 获取当前正咋编辑的id
	  	var editId = $(this).attr("name");
	  	var result = new Array();
		$("#editMyQuestion .form-control").each(function(index,element){
	  		// $("#item"+index).val($(this).val());
	  		// console.log($(element).val());
	  		 // console.log("#"+editId +" .customRadio"+index);
	  		// $().val($(this).val());
	  		// 将修改后的值写回问题
	  		result[index] = $(element).val();
	  		// $(".card")
		});
		console.log(result);
		var finalId = "#"+editId +" .editResult";
		console.log(finalId);
		$(finalId).each(function(index, item){console.log($(item).text(result[index]))});
		// $("#"+editId +" .editResult").each(function(index,element){
		// 	$(element).val(result[index+1]);
		// });
  }


  $("#sureFinishBut").click(finishEditQuestion);
  /* ---- Right End---- */

  /* ---- 提交表单 End---- */
  $("#generateFinishQuestionForm").click(function () {
  	// var form = document.getElementById("myFormId");
  	//form.action = "UserServlet";
  	//form.method = "post";
  	//form.submit();
	var postData = "[";
  	// 拿到所有问卷数据
  	$(".card").each(function (index, element) {
  		var txt = [];
  		$(element).find(".editResult").each(function (index, element) {
  			txt[index] = $(element).text().trim();
  		})
  		console.log(index + txt[0]);
		postData = postData + ["{",
		"\"title\": \""+ txt[0] +"\", ",
		"\"options\": [",
		"\""+ txt[1].trim() +"\",",
		"\""+ txt[2].trim() +"\",",
		"\""+ txt[3].trim() +"\",",
		"\""+ txt[4].trim() +"\"",
		"]",
		"},"].join("");

  	});
  	
  	postData = postData.substr(0, postData.length-1);
  	postData = postData +  "]";
  	console.log("PostData : " + postData);
  	/* postData = "{\"param\":" + postData +  "}"; */
  	
  	console.log("PostData : " + postData);
  	
  	$.post("${pageContext.request.contextPath}/UserServlet?method=createQuestion",{data:postData},function(data){
  	   
  	},"json");
  });
  /* ---- 提交表单 End---- */
});
</script>
</html>

<!-- 

[
        {
            "title": "黑龙江", 
            "options": {
                "a": "",
                "b": "",
                "c": "",
                "d": ""
            }
        }, 
        {
            "title": "黑龙江", 
            "options": {
                "a": "",
                "b": "",
                "c": "",
                "d": ""
            }
        }, 
        {
            "title": "黑龙江", 
            "options": {
                "a": "",
                "b": "",
                "c": "",
                "d": ""
            }
        }
]

 -->