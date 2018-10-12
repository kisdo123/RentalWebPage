<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function menu(val){
	switch (val) {
	case 0:
		location.href="main.jsp"
		break;
	case 1:
		location.href="main.jsp?contentPage=/WEB-INF/view/rentMenu.jsp";
		break;
	case 2:
		//location.href="main.jsp?contentPage=/WEB-INF/view/calendar.jsp";
		break;
	case 3:
		location.href="main.jsp?contentPage=/WEB-INF/view/daumMap2.jsp";
		break;
	}
}

</script>

</head>
<body>

<table class="funcTab">
		<tr>
			<td class="home">
				<button onclick="menu(0)"><img src="image/home.png" style= "width: 45px; height: 45px;" /></button>
			</td>
			<td class="func1"><button class="btn" onclick="menu(1)" >대관하기</button></td>
			<td class="func2"><button class="btn" onclick="menu(2)">Q&A</button></td>
			<td class="func3"><button class="btn" onclick="menu(3)">기타</button></td>
		</tr>
</table>
</body>
</html>