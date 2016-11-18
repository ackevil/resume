<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>ReView My Resume</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/backend/css/bootstrap.min.css">
	
		<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/flat-ui.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/common.css">
	</head>
	<body class="admin-login">
		<div class="container">
			<div class="hight100">
				
			</div>
			<div class="row ">
				<div class="col-xs-12 col-sm-4 col-sm-offset-4">
					
						
							<div class="form-horizontal">
								<div class="form-group	text-center">
									<label for="" class="control-label"><h5>管理员登录</h5></label>
								</div>
								<div class="form-group">
									<input type="text" id="username" class="form-control"  placeholder="用户名"/>
								</div>
								<div class="form-group">
									<input type="password" id="password" class="form-control"  placeholder="密码"/>
								</div>
								<div class="form-group">
									<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">
										<button id="login" class="btn btn-primary form-control">登录</button>
									</div>
								</div>
							</div>
						
					
				</div>
				
			</div>
			
			
		</div>
		<script src="<%=path %>/backend/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$("#login").click(function(){
					var name=$("#username").val();
					var passwd=$("#password").val();
					
					$.ajax({ 
						
						type:"POST",
						url: "<%=path%>/master/dologin",
						
						data:{"username":name,
							"passwd":passwd
						},
						success: function(data){
							if(data=="0"){
								 location.href = "<%=path%>/master/index";
							}else{
								alert("账号或密码错误");
							}
						}
 
				      });//ajax end
	
				}); //click end
					
				
				
			}); //function end
		</script>
	</body>
</html>
