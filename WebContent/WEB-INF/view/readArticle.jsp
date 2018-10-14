<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 보기</title>
<style type="text/css">
	body{
			margin: 0;
			font-size: medium;
			font-family:'Open Sans';
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
		
		.title{ text-align: left;  }

	table, td{
		text-align: left;
		border:1px solid black;
		border-collapse: collapse;

	}

	.artNun{ width: 30px; }
	.artform{ width: 80px; }
	.textHead{ border: 0px; }
	.artCon{ height: 500px; border-top: none;}
	.menu{ text-align: right; font-size: 0.8em; }
	.comm{ font-size: 0.8em; }
</style>
</head>


<body>

 
           
           
 <div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">           

 <table>
 
	<tr>
		<td class="artform">${articleData.article.articleId }</td>
		<td>${articleData.article.title }</td>	
	</tr>

	

	<tr>
		<td colspan="2" class="inner_td">${articleData.article.name }
		</td>

	</tr>
	<tr>
		<td colspan="2" class="artCon">
			<u:pre value='${articleData.articleContent }'/>
		</td>	
	</tr>


	<tr>
		<td colspan="2" class="menu">
			<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<a href="articlelist?pageNo=${pageNo }">[목록 보기]</a>
			
			<c:if test="${loginUser.userId == articleData.article.userId }">
				<a href="articlemodify?no=${articleData.article.articleId }">[게시글 수정]</a>
				<a href="articledelete?no=${articleData.article.articleId }">[게시글 삭제]</a>
			</c:if>
		</td>
	</tr>
	


	    <tr bgcolor="#F5F5F5">
                <!-- 본문 작성-->
                <td colspan="2" class="comm">
                      <textarea name="comment_content" rows="4" cols="70" ></textarea>
                   		<a href="#" onclick="writeCmt()">[댓글등록]</a>    
                    <!-- 댓글 등록 버튼 --> 
                </td>
    	 </tr>


 </table>
 

		</div>
	</div>
</div>    
     
</body>
</html>