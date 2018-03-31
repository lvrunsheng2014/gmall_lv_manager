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
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>硅谷商城</title>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
 	<div data-options="region:'north',split:true" style="height:50px">
 	一级：<select class="easyui-combobox" style="width:200px;" id="class_1_select" onchange="get_class_2(this.value);"><option>请选择</option></select>
	二级：<select class="easyui-combobox" style="width:200px;"  id="class_2_select"><option>请选择</option></select>
	品牌：<select class="easyui-combobox" style="width:200px;" id="tm_select" onchange="get_tm(this.value);"><option>请选择</option></select><br>
	<a href="javascript:goto_spu_add();">添加</a><br>
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
				$("#class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>")	;
			});
		}); */
		$('#class_1_select').combobox({    
		    url:'js/json/class_1.js',    
		    valueField:'id',    
		    textField:'flmch1'  ,
		    onChange:function get_class_2(){
		    	var class_1_id=$(this).combobox("getValue");
		    	
		    	$('#class_2_select').combobox({    
	   		 	url:"js/json/class_2_"+class_1_id+".js",    
	    		valueField:'id',    
	    		textField:'flmch2',
	    		onChange:function get_tm(){
	    			//var class_1_id=$(this).combobox("getValue");
	    			$('#tm_select').combobox({    
	    	   		 	url:"js/json/tm_class_1_"+class_1_id+".js",    
	    	    		valueField:'id',    
	    	    		textField:'ppmch',
	    			}); 
	    		}
				});  
		    }
		}); 
		
	});
	
	/* function get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#class_2_select").empty();
			$(data).each(function(i,json){
				
				$("#class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>")	;
			});
		});
		get_tm(class_1_id);
	}
	
	function get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_select").empty();
			$(data).each(function(i,json){
				
				$("#tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>")	;
			});
		});
	} */
	
	function goto_spu_add(){
		var class_1_id=$("#class_1_select").combobox("getValue");
		var class_2_id=$("#class_2_select").combobox("getValue");
		var class_tm_id=$("#tm_select").combobox("getValue");
	
		/* window.location.href="goto_spu_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+class_tm_id; */
		add_tab("goto_spu_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+class_tm_id,"商品信息添加")
	}
</script>
</body>
</html>