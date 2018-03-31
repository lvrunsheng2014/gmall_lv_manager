<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function click_attr(index){
	
	var b='<table  border="1" width="800">';
	var c='<tr><td>属性名:<input type="text" name="list_attr['+index+'].shxm_mch"/></td><td></td><td>添加属性值</td></tr>';
	var d='<tr><td>属性值:<input type="text" name="list_attr['+index+'].list_value[0].shxzh"/></td><td>单位:<input type="text" name="list_attr['+index+'].list_value[0].shxzh_mch"/></td><td>删除</td></tr>';
	var e='<tr><td>属性值:<input type="text" name="list_attr['+index+'].list_value[1].shxzh"/></td><td>单位:<input type="text"  name="list_attr['+index+'].list_value[1].shxzh_mch"/></td><td>删除</td></tr>';
	var f='</table>';
	
	$("#button_id").attr("onclick","click_attr("+(index+1)+")")
	$("#table_id").after(b+c+d+e+f);
}
</script>
<title>硅谷商城</title>
</head>
<body>
	添加商品属性
	
	<hr>
	<form action="attr_add.do">
	<input type="hidden" value="${flbh2 }" name="flbh2">
	
	<table id="table_id" border="1" width="800"  >
		<tr><td>属性名:<input type="text" name="list_attr[0].shxm_mch"/></td><td></td><td>添加属性值</td></tr>
		<tr><td>属性值:<input type="text" name="list_attr[0].list_value[0].shxzh"/></td><td>单位:<input type="text" name="list_attr[0].list_value[0].shxzh_mch"/></td><td>删除</td></tr>
		<tr><td>属性值:<input type="text" name="list_attr[0].list_value[1].shxzh"/></td><td>单位:<input type="text"  name="list_attr[0].list_value[1].shxzh_mch"/></td><td>删除</td></tr>
	</table>
	<table border="1" width="800">
		<tr><td>属性名:<input type="text" name="list_attr[1].shxm_mch"/></td><td></td><td>添加属性值</td></tr>
		<tr><td>属性值:<input type="text" name="list_attr[1].list_value[0].shxzh"/></td><td>单位:<input type="text"  name="list_attr[1].list_value[0].shxzh_mch"/></td><td>删除</td></tr>
		<tr><td>属性值:<input type="text"name="list_attr[1].list_value[1].shxzh"/></td><td>单位:<input type="text"  name="list_attr[1].list_value[1].shxzh_mch"/></td><td>删除</td></tr>
	</table>
	
	
	
	<!--  
	<input id="button_id" type="button" onclick="click_attr(1)" value="添加">
	-->
	<input type="submit" value="提交"/>
	</form>
</body>
</html>