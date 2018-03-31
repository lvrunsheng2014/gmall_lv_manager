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
<body >
	<div class="easyui-layout" data-options="fit:true">
	
				<div data-options="region:'north',split:true" style="height:50px">
						<div style="margin-top: 10px;margin-left: 10px">
						一级：<select class="easyui-combobox" style="width:200px;" id="attr_class_1_select" onchange="get_attr_class_2(this.value);"><option>请选择</option></select>
						二级：<select class="easyui-combobox"  style="width:200px;"id="attr_class_2_select" onchange="get_attr_list(this.value);"><option>请选择</option></select>
						<a href="javascript:goto_attr_add()">添加</a><br>
						</div>
				</div>
				<div data-options="region:'west',split:true" style="width:100px">
					查询<br>
					删除<br>
					编辑<br>
				</div>
				<div data-options="region:'center'">
				<div id="attrListInner" class="easyui-datagrid" ></div>
				</div>

</div>

	
	<hr>
	
	<script type="text/javascript">
$(function(){
	/* $.getJSON("js/json/class_1.js",function(data){
		$(data).each(function(i,json){
			$("#attr_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>")	;
		});
	}); */
	
	$('#attr_class_1_select').combobox({    
	    url:'js/json/class_1.js',    
	    valueField:'id',    
	    textField:'flmch1'  ,
	    onChange:function get_attr_class_2(){
	    	var class_1_id=$(this).combobox("getValue");
	    	
	    	$('#attr_class_2_select').combobox({    
   		 	url:"js/json/class_2_"+class_1_id+".js",    
    		valueField:'id',    
    		textField:'flmch2',
    		onChange:function(){
    			var flbh2=$(this).combobox("getValue");
    			get_attr_list(flbh2);
    		}
			});  
	    }
	}); 
});

function get_attr_class_2(class_1_id){
	$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
		$("#attr_class_2_select").empty();
		$(data).each(function(i,json){
			
			$("#attr_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>")	;
		});
	});
	
	
}
function goto_attr_add(){
	
	var attr_class_2_id=$("#attr_class_2_select").combobox("getValue");
	
		/*  window.location.href="goto_attr_add.do?flbh2="+attr_class_2_id;   */
		 add_tab("goto_attr_add.do?flbh2="+attr_class_2_id,"添加属性");
		
	}
	//异步查询商品属性信息
	function get_attr_list(flbh2){
/* 		$.post("get_attr_list.do",{flbh2:flbh2},function(data){
			$("#attrListInner").html(data);
		}); */
		
		$('#attrListInner').datagrid({    
		    url:'get_attr_list_json.do',   
		    queryParams: {
		    	flbh2: flbh2,
				
			},

		    columns:[[    
		    	{field:'id',title:'id',width:100},
		        {field:'shxm_mch',title:'属性名',width:100},    
		        {field:'list_value',title:'属性值',width:150,
		        	formatter: function(value,row,index){
						var str="";
						
						$(value).each(function(i,json){
							str=str+json.shxzh+json.shxzh_mch+" ";
						});
						return str;
					}
	
		        },    
		        {field:'chjshj',title:'创建时间',width:150,
		        	formatter: function(value,row,index){
						var d=new Date(value);
						var str=d.toLocaleString();
						return str;
					}
	
		        
		        }    
		    ]]    
		});  
	}
</script>
	
</body>
</html>