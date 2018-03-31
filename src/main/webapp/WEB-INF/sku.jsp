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

<title>硅谷商城</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',split:true" style="height:50px">
	一级：<select class="easyui-combobox" style="width:200px;" id="sku_class_1_select" onchange="get_sku_class_2(this.value);"><option>请选择</option></select>
	二级：<select class="easyui-combobox" style="width:200px;" id="sku_class_2_select" ><option>请选择</option></select><br>
	<a href="javascript:goto_sku_add()">添加</a><br>
	</div>
	<div data-options="region:'west',split:true" style="width:100px">
					查询<br>
					删除<br>
					编辑<br>
	</div>
	<div data-options="region:'center'">
				
	</div>			
	</div>
<script type="text/javascript">
$(function(){
	/* $.getJSON("js/json/class_1.js",function(data){
		$(data).each(function(i,json){
			$("#sku_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>")	;
		});
	}); */
	$('#sku_class_1_select').combobox({    
	    url:'js/json/class_1.js',    
	    valueField:'id',    
	    textField:'flmch1'  ,
	    onChange:function get_sku_class_2(){
	    	var class_1_id=$(this).combobox("getValue");
	    	
	    	$('#sku_class_2_select').combobox({    
   		 	url:"js/json/class_2_"+class_1_id+".js",    
    		valueField:'id',    
    		textField:'flmch2',
    		
			});  
	    }
	});
	
});

/* function get_sku_class_2(class_1_id){
	$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
		$("#sku_class_2_select").empty();
		$(data).each(function(i,json){
			
			$("#sku_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>")	;
		});
	});
	
} */

function goto_sku_add(){
	var class_1_id=$("#sku_class_1_select").combobox("getValue");
	var class_2_id=$("#sku_class_2_select").combobox("getValue");
	 add_tab("goto_sku_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id,"添加库存单元属性");
	
		
	}
</script>
</body>
</html>