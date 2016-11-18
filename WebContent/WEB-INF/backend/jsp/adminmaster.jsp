<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
				  <li role="presentation" class="active"><a href="<%=path %>/master/adminMaster">账户管理</a></li>
				  
				</ul>
			</div>
			<div class="col-xs-12 col-sm-10">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">管理员</h3>
					</div>
					<div class="panel-body">
						
						<!--table-->

						<table class="table table-bordered table-hover table-responsive">
							<thead>
						        <tr>
						          
						          <th class="text-center">用户名</th>
						          <th class="text-center">密码</th>
						          <th class="text-center">操作</th>
						        </tr>
						      </thead>
						      <tbody class="text-center">
						       <c:forEach items="${userlist}" var="user">
						        <tr>
						          
						          <td>${user.adminuserName}</td>
						          <td>${ user.adminuserPwd}</td>
						          <td class="text-center">
						          	  <a class="glyphicon glyphicon-edit" href="<%=path %>/master/editUser?id=${user.adminuserId}"></a>
						          	  <a class="glyphicon glyphicon-trash" href="<%=path %>/master/delUser?id=${user.adminuserId}"></a>
						          </td>
						        </tr>
						        </c:forEach>
						        
						      

						      </tbody>
						</table>
						<a href="<%=path %>/master/adduser" class="btn btn-primary glyphicon glyphicon-plus"></a>
						<!--  
						
						<form class="form-horizontal" role="form">
							<div class="form-group ">
								<div class="col-sm-2">
									
									<a href="<%=path %>/master/adduser" class="btn btn-primary glyphicon glyphicon-plus"></a>
									
										
								</div>
								<div class=" col-sm-4 ">
									<div class="row">
									<label class="col-sm-1 col-sm-offset-6 control-label ">共</label>
									<label class="col-sm-2   control-label text-info">10000</label>
									<label class="col-sm-1   control-label ">页</label>
									</div>
								</div>
								<div class=" col-sm-2">
								<button class="btn btn-primary">&laquo;</button>
								
								<button class="btn btn-inverse">9999</button>
								
								<button class="btn btn-primary">&raquo;</button>
								</div>
								<div class="col-sm-4 ">
									<div class="row">
									<label class="col-sm-2 control-label">跳转</label>
									<div class="col-sm-3">
									<input type="text" name="" class="form-control" />
									</div>
									
									<label class="col-sm-1   control-label ">页</label>
									</div>
								</div>
								    
								 
							</div>
						</form>
						-->
						
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
		$('#datetimepicker').datetimepicker({
			
			format: "yyyy-mm-dd",
		    autoclose: true,
		    minView: "month",
		    maxView: "decade",
		    todayBtn: true,
		    pickerPosition: "bottom-left"
		});
		$('#datetimepicker').datetimepicker('setStartDate', null);
		
				$("#datetimeStop").datetimepicker({
		    format: "yyyy-mm-dd hh:ii:ss",
		    autoclose: true,
		    minView: "hour",
		    maxView: "decade",
		    todayBtn: true,
		    pickerPosition: "bottom-left"
		}).on("click", function (ev) {
		    $("#datetimeStop").datetimepicker("setStartDate", $("#activityLaunchTime").val());
		});

		$('#datetimeStart')
		    .on('changeDate show', function(e) {
		        // Revalidate the date when user change it
		        $('#selectForm').bootstrapValidator('revalidateField', 'activityLaunchTime');
		});
		
	</script>

</body>
</html>