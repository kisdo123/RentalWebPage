<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>

<script type="text/javascript">

	function changeForm(val){
    	if(val == "1"){
        	location.href="main.jsp";
    	}else if(val == "2"){
        	location.href="change";
    	}
	}

</script>

</head>
<body>

 <b><font size="6" color="gray">내 정보</font></b>
 <br><br><br>
 
         <!-- 가져온 회원정보를 출력한다. -->
        <table border="1">
            <tr>
                <td id="title">아이디</td>
                <td>${loginUser.id }</td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td>${loginUser.pw }</td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td>${loginUser.name }</td>
            </tr>
                    
            <tr>
                <td id="title">소속</td>
                <td>${loginUser.team }</td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>${loginUser.birth }</td>
            </tr>
			  
                    
            <tr>
                <td id="title">연락처</td>
                <td>${loginUser.phone }</td>
            </tr>
            
        </table>
        <br>
        
        <input type="button" value="메인으로" onclick="changeForm(1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(2)">

</body>
</html>