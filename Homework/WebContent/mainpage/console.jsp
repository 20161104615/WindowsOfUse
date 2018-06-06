<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainPage</title>
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./css/admin.css" media="all">
</head>
<body>
<body>

	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">
								<%
									String str = "hello word";
									out.print(str);
								%>
							</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">待办事项</div>
						</div>
					</div>
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">数据概览</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">版本信息</div>
				</div>

				<div class="layui-card">
					<div class="layui-card-header">效果报告</div>
				</div>

				<div class="layui-card">
					<div class="layui-card-header">实时监控</div>
				</div>

				<div class="layui-card">
					<div class="layui-card-header">产品动态</div>
				</div>
			</div>
		</div>
	</div>

	<script src="./layui/layui.js?t=1"></script>
	<script>
		layui.config({
			base : './' //静态资源所在路径
		}).extend({
			index : 'lib/index' //主入口模块
		}).use([ 'index' ]);
	</script>
</body>
</body>
</html>