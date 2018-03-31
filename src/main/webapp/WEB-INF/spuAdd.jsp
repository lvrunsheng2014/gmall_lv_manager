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
	spu商品信息<br>
	${spu.flbh1}|${spu.flbh2}|${spu.pp_id}<br>
	
	<form action="spu_add.do" method="post"  enctype="multipart/form-data">>
	<input type="hidden" value="${spu.flbh1}" name="flbh1">
	<input type="hidden" value="${spu.flbh2}" name="flbh2">
	<input type="hidden" value="${spu.pp_id}" name="pp_id">
	商品名称：<input type="text" name="shp_mch" /><br><br>
	商品描述：<textarea rows="10" cols="50" name="shp_msh"></textarea><br>
	商品图片：<br>
	<div id="d_0" style="float: left;margin-left:10px;border:1px green solid;">
	<input id="file_0" type="file" name="files" style="display: none;" onChange="replace_image(0)"/>
	<img id="image_0" onclick="click_image(0)" src="image/upload/upload_hover.png" style="cursor: pointer;" width="100px">
	</div>
		<input type="submit" value="提交">
	</form>
	
	<script type="text/javascript">

function click_image(index){
	var length= $(":file").length;
	if(length<=3){
		$("#file_"+index).click();
	}
	
	
}
	
	function replace_image(index){
		
	//获取图片对象
	var blob_image=$("#file_"+index)[0].files[0];
	var url=window.URL.createObjectURL(blob_image);
	//替换添加图片的image
	$("#image_"+index).attr("src",url);
	
	var length= $(":file").length;
	if((index+1)==length){
		//用户点击的是最后一张图片
		add_image(index);
	}
	
	
		
	
	
	}
	function add_image(index){
		var a='<div id="d_'+(index+1)+'" style="float: left;margin-left:10px;border:1px green solid;">';
		var b='<input id="file_'+(index+1)+'" type="file" name="files" style="display: none;" onChange="replace_image('+(index+1)+')"/>';
		var c='<img id="image_'+(index+1)+'" onclick="click_image('+(index+1)+')" src="image/upload/upload_hover.png" style="cursor: pointer;" width="100px">';
		var d='</div>';
		
		$("#d_"+index).after(a+b+c+d);
	}

</script>
</body>
</html>