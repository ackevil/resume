<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>admin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/bootstrap.min.css">
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/flat-ui.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/backend/css/common.css">

</head>
<body>
	<div class="nav navbar-default">
		<div class="container-fluid">
			<div class="nacbar-header">
				<a class="navbar-brand">Resume</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"data-target="#collapse-menu">
				    <span class="sr-only">Toggle navigation</span>
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span>
			    </button>
			</div>
			<div class="collapse navbar-collapse" id="collapse-menu">
			<!--
            	作者：offline
            	时间：2016-11-15
            	描述：
            
			<ul class="nav navbar-nav">
	            <li class="active"><a href="#">iOS</a></li>
	            <li><a href="#">SVN</a></li>
	            <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                    Java
	                    <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="#">jmeter</a></li>
	                    <li><a href="#">EJB</a></li>
	                    <li><a href="#">Jasper Report</a></li>
	                    <li class="divider"></li>
	                    <li><a href="#">分离的链接</a></li>
	                    <li class="divider"></li>
	                    <li><a href="#">另一个分离的链接</a></li>
	                </ul>
	            </li>
	        </ul>
	        -->
	         <ul class="nav navbar-nav navbar-right"> 
            	<li><a href="<%=path %>/master/adminMaster"><span class="glyphicon glyphicon-user"></span>${admin==null?"":admin.adminuserName }</a></li> 
            	<li><a href="<%=path%>/master/logout"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li> 
        	</ul> 
        	</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-sm-2 my-sidebar">
				<ul class="nav nav-pills nav-stacked" role="tablist">
				  <li role="presentation"><a href="<%=path %>/master/index">简历管理</a></li>
				  <li role="presentation"><a href="<%=path %>/master/adminMaster">账户管理</a></li>
				  
				</ul>
			</div>
			<div class="col-xs-12 col-sm-10">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">添加管理员</h3>
					</div>
					<div class="panel-body">
						<div class="form-horizontal">
						<div class="form-group">
							<label for="" class="control-label col-xs-4 text-right">用户名</label>
							<div class="col-xs-4">
								<input type="text" class="form-control" id="username" value="" />
							</div>
							
						</div>
						<div class="form-group">
							<label for="" class="control-label col-xs-4 ">密码</label>
							<div class="col-xs-4">
								<input type="text" class="form-control" id="password" value="" />
							</div>
						</div>
						<div class="form-group">
							
							<div class="col-xs-2 col-xs-offset-5">
								<button id="addUser" class="form-control btn btn-primary">确定</button>
							</div>
						</div>
						</div>
						
						
						
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<!--js-->
	<script type="text/javascript" src="<%=path%>/backend/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/backend/js/flat-ui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/backend/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
			$(function(){
				$("#addUser").click(function(){
					var name=$("#username").val();
					var passwd=$("#password").val();
					
					$.ajax({ 
						
						type:"POST",
						url: "<%=path%>/master/doAdd",
						
						data:{"username":name,
							"passwd":passwd
						},
						success: function(data){
							if(data=="0"){
								 location.href = "<%=path%>/master/adminMaster";
							}else{
								alert("添加失败");
							}
						}
 
				      });//ajax end
	
				}); //click end
					
				
				
			}); //function end
		</script>
		
	

</body>
</html>