<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 보기</title>
</head>
<body>

<!--  ArticleData
article - articleId,Writer,날짜,카운트
articleContent - articleId, content  -->

<table border="1">
	<tr>
		<th width="200" height="50">게시글 번호</th>
		<td colspan="3" width="600" align="center">${articleData.article.articleId }</td>	
	</tr>

	<tr>
		<th width="200" height="50">작성자 이름</th>
		<td colspan="3" width="600" align="center">${articleData.article.name }</td>	
	</tr>
	
	<tr>
		<th width="200" height="50">제목</th>
		<td colspan="3" width="600" align="center">${articleData.article.title }</td>	
	</tr>
	
	<tr>
		<th width="200" height="50">내용</th>
		<td colspan="3" width="600" align="center"><u:pre value='${articleData.articleContent }'/></td>	
	</tr>



	






	
	
	
    
    
    
          
	<tr>
		<td colspan="3" height="50"  align="center">
			<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<a href="articlelist?pageNo=${pageNo }">[목록 보기]</a>
			
			<c:if test="${loginUser.userId == articleData.article.userId }">
				<a href="articlemodify?no=${articleData.article.articleId }">[게시글 수정]</a>
				<a href="articledelete?no=${articleData.article.articleId }">[게시글 삭제]</a>
			</c:if>
		</td>
	</tr>
	
	
</table>







<table>
    <tr bgcolor="#F5F5F5">
   
                <td width="150">
                    
                </td>
                <!-- 본문 작성-->
                <td width="550">
                    <div>
                        <textarea name="comment_content" rows="4" cols="70" ></textarea>
                    </div>
                </td>
                
                <!-- 댓글 등록 버튼 -->
                <td width="100">
                
                    <div id="btn" style="text-align:center;">
                        <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>    
                    </div>
                </td>
           
    </tr>
</table>

     
 
      
           
           
            

 
      
    
     
    

























</body>
</html>