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

	table{
		width:100%;
	}

	.artNun{ width: 95%; }
	.artform{ width: 5%; }
	.textHead{ border: 0px; }
	.artCon{ height: 500px; border-top: none; vertical-align : top; width: 100%;}
	.menu{ text-align: right; font-size: 0.8em; }
	.comm{ font-size: 0.8em; }
	#commenttable{text-align: left; border:1px solid black; border-collapse: collapse;}
	#commenttable td{border:1px solid black; border-collapse: collapse;}
	#aritlcletable{text-align: left; border:1px solid black; border-collapse: collapse;}
	#aritlcletable td{border:1px solid black; border-collapse: collapse;}
	.innerTable{text-align: left; border:1px solid black; border-collapse: collapse;}
	.innerTable{border-collapse: collapse;}
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: underline; color: red;}
</style>
</head>


<body>

 
           
           
 <div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">           

 <table id="aritlcletable">
	<tr>
		<td class="artform" align="center">${articleData.article.articleId }</td>
		<td style="padding-left: 10px">${articleData.article.title }</td>	
	</tr>

	

	<tr>
		<td colspan="2" class="inner_td" style="padding-left: 10px">${articleData.article.name }
		</td>

	</tr>
	<tr>
		<td colspan="2" class="artCon" style="padding-top: 5px; padding-left: 10px">
			<u:pre value='${articleData.articleContent }'/>
		</td>	
	</tr>
 </table>
 	<br>
 	
	<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
		<a href="articlelist?pageNo=${pageNo }">[목록 보기]</a>
	<c:if test="${loginUser.userId == articleData.article.userId }">
		<a href="articlemodify?no=${articleData.article.articleId }">[게시글 수정]</a>
		<a href="articledelete?no=${articleData.article.articleId }">[게시글 삭제]</a>
	</c:if>
 
<hr>

<form action="commentwrite" method="post">

	<input type="hidden" name="articleId" value="${articleData.article.articleId }" readonly="readonly">
	<input type="hidden" name="name" value="${articleData.article.name }" readonly="readonly">

	
	게시글 번호<input type="text" name="articleId" value="${articleData.article.articleId }" readonly="readonly">
	작성자 이름<input type="text" name="name" value="${articleData.article.name }" readonly="readonly">
	

	
	<table>
	    <tr bgcolor="#F5F5F5">
                <!-- 본문 작성-->
                <td colspan="2" class="comm">
                	<input type="hidden" name="comId" value="${param.comId }">
                	<textarea name="comContent" rows="10pt" cols="100%" >${param.comContent }</textarea>
                   	작성자 <input type="text" style="width: 70px;" name="name" value="${articleData.article.name }" readonly="readonly">

                    <!-- 댓글 등록 버튼 --> 
                </td>
    	 </tr>
   	</table>
   	<input type="submit" value="댓글 작성">
   	<br><br><br>
</form>


	<!--댓글이 있으면 댓글이 보이고 -->
	<!--댓글작성자이면 수정 삭제버튼이 보임-->

<table id="commenttable">
	<c:forEach var="comment" items="${commentPage.commentList }">
		<c:if test="${articleData.article.articleId == comment.articleId}">
			<c:choose>
				<c:when test="${comment.userId == loginUser.userId }">
				<table class="innerTable">
					<tr>
						<td style="width: 84%; padding-left: 10px">${comment.name }</td>
						<td style="width: 16%;">
							<div style="width:100%; text-align: center;">
									<form action="commentdelete" method="post">
											<input type="hidden" name="comId" value="${comment.comId }">
											<input type="submit" value="삭제" style="background-color: #ccc; width: 48%;">
									</form>
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" width="95%" style="font-size: 25px; padding-left: 10px">${comment.comContent }</td>
					</tr>
				</table>
				</c:when>
				
				<c:otherwise>
				<table class="innerTable">
					<tr>
						<td colspan="2" style="padding-left: 10px">${comment.name }</td>
					</tr>
					
					<tr>
						<td colspan="2" style="font-size: 25px; padding-left: 10px">${comment.comContent }</td>
					</tr>
				</table>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
</table>



		</div>
	</div>
</div>    
     
</body>
</html>