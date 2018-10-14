<%@page import="dao.UserDao"%>
<%@page import="join.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="login.LoginUser"%>
<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

	//뒤로가기 못하게 막음
	history.pushState(null, null, location.href);
	window.onpopstate = function() {
		history.go(1);
	};
	
</script>
<style type="text/css">
    body{
    		width:80%;
            margin: 0;
            font-size: small;
            text-align: center;
            font-family:'Open Sans';
        }       

        input{
            width: 300px;
            height: 30px;
        }


        table, .info, .form{
            border: 1px solid black;
            border-collapse: collapse;

        }

        table{ border:0; }
        th{ text-align: center; color: gray; font-size: 2.5em; }

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
                margin-top: 5px;}
        .logtitle{ font-size: 0.9em; }
        .cancel{ border-top: 1px solid black; font-size: small; padding-top: 10px; }

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		LoginUser loginUser = (LoginUser)request.getSession().getAttribute("loginUser");
		String username = loginUser.getName();
		
		//roomdate를 가져오는변수
		String roomdate = request.getParameter("dateroom");

		//time을 getParameterValues 가져오는변수
		String timeStr[] = request.getParameterValues("time");
		//int형으로 변환해서 넣기위한 변수
		int[] time = new int[timeStr.length];
		//str로 바꿔 넣기 위한 변수
		String realTime = "";
		
		//String배열을  int배열로 변환후 저장
		for (int i = 0; i < timeStr.length; i++) {
			time[i] = Integer.parseInt(timeStr[i]);
		}
		
		for (int j = 0; j < time.length; j++) {
			switch (time[j]) {
			case 1:
				realTime += " AM 09:00 ~ AM 10:00 " + "<br>";
				break;
			case 2:
				realTime += " AM 10:00 ~ AM 11:00 " + "<br>";
				break;
			case 3:
				realTime += " AM 11:00 ~ PM 12:00 " + "<br>";
				break;
			case 4:
				realTime += " PM 12:00 ~ PM 01:00 " + "<br>";
				break;
			case 5:
				realTime += " PM 01:00 ~ PM 02:00 " + "<br>";
				break;
			case 6:
				realTime += " PM 02:00 ~ PM 03:00 " + "<br>";
				break;
			case 7:
				realTime += " PM 03:00 ~ PM 04:00 " + "<br>";
				break; 
			case 8:
				realTime += " PM 04:00 ~ PM 05:00 " + "<br>";
				break;
			case 9:
				realTime += " PM 05:00 ~ PM 06:00 " + "<br>";
				break;
			}
		}
	%>
	
	<div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">
     
    <table>
        <tr>
            <!-- 로그인 위에 이미지가 들어가는 자리 -->
            <td class="logo" colspan="2"><img src="image/하자.png" width="180px"></td>
        </tr>
        <tr>
            <th colspan="2">
                 대관 신청 완료
            </th>
        </tr>

        <tr>
            <td id="title" class="info">신청인</td>
            <td class="form"><%= username %></td>
        </tr>

    <tr>
        <td id="title" class="info">날짜 방이름</td>
        <td class="form"><%= roomdate%></td>
    </tr>
    <tr>
        <td id="title" class="info">신청 시간</td>
        <td class="form"><%= realTime %></td>
    </tr>
        <tr>
           <td colspan="2">
           	<button type="button"  class="logbtn" onclick="location.href='main.jsp' ">메인으로</button>
            </td>
        </tr>
        </table>
        </div>
    </div>  
</div>  
</body>
</html>