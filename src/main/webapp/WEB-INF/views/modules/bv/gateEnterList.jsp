<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>网关入库管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/bv/gateEnter/">网关入库列表</a></li>
		<shiro:hasPermission name="bv:gateEnter:edit"><li><a href="${ctx}/bv/gateEnter/form">网关入库添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gateEnter" action="${ctx}/bv/gateEnter/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>起始ID</th>
				<th>数量</th>
				<th>结束ID</th>
				<th>入库时间</th>
				<shiro:hasPermission name="bv:nodeEnter:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gateEnter">
			<tr>
				<td>${gateEnter.startId}</td>
				<td>${gateEnter.enterNumber}</td>
				<td>${gateEnter.endId}</td>
				<td><fmt:formatDate value="${gateEnter.enterTime}" type="both"/></td>
				<shiro:hasPermission name="bv:gateEnter:edit"><td>
    				<a href="${ctx}/bv/gateEnter/form?id=${gateEnter.id}">修改</a>
					<a href="${ctx}/bv/gateEnter/delete?id=${gateEnter.id}" onclick="return confirmx('确认要删除该网关入库吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>