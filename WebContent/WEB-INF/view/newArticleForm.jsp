<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
<style type="text/css">
	body{
			margin: 0;
			font-size: small;
			text-align: center;
			font-family:'Open Sans';
		}		

		input{
			width: 300px;
			height: 30px;
		}
		table{
			
		    border-collapse: collapse;

		}
		.info{
			width: 100px;
			text-align: left;
		}

		.outer-container {
		    position : absolute;
		    display: table;
		    width: 100%;
		    height: 100%;
		    background: #ccc;
		}

		.inner-container {
		    display: table-cell;
		    vertical-align: middle;
		    text-align: center;
		}

		.centered-content {
		    display: inline-block;
		    background: #fff;
		    padding : 20px;
		    border : 1px solid #000;
		}
		
		.logo{ padding-bottom: 17px; }
		.logbtn{ background-color: black; color: white; font-size: 0.9em; height: 35px; 
				margin-top: 15px;}
		.logtitle{ font-size: 0.9em; }
		.cancel{ border-top: 1px solid black; font-size: small; padding-top: 10px; }
		
		.title{ text-align: left; width: 100%;  }
		#inputtitle{ width: 99%;  }
</style>
</head>
<body>



	
<form action="articlewrite" method="post">
<div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">

<table>
<tr>
	<td class="title"><input id="inputtitle" type="text" name="title" value="${param.title }" placeholder="제목"><c:if test="${errors.title }">제목을 입력하세요</c:if></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td colspan="1"><textarea rows="15" cols="70" name="content" placeholder="내용">${param.content }</textarea></td>
</tr>
<tr>
	
	<td colspan="1"><input class="logbtn" type="submit" value="등록"></td>
</tr>


</table>
		</div>
	</div>
</div>

</form>

</body>
</html>