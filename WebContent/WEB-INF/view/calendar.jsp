<%@page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
//캘린더 Month 이동 다음달(1) 이전달(0) 들어오는 요청
int action = 0;
//수신 URL에서 검색되지 않은 경우 현재 year로 설정됩니다.
int currYear = 0;
//수신 URL에서 검색되지 않은 경우 현재 month로 설정
int currMonth = 0; 

//캘린더 2개만들기
Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

//연도 및 월을 현재로 설정해야 하는지 확인합니다.
if (request.getParameter("action") == null) {
	currMonth = c.get(c.MONTH);
	currYear = c.get(c.YEAR);
	cal.set(currYear, currMonth, 1);
	
} else {
	//month를 다음달 또는 이전달로 이동
	if (!(request.getParameter("action") == null)) {
		currMonth = Integer.parseInt(request.getParameter("month"));
		currYear = Integer.parseInt(request.getParameter("year"));

		if (Integer.parseInt(request.getParameter("action")) == 1) {
			cal.set(currYear, currMonth, 1);
			cal.add(cal.MONTH, 1);
			currMonth = cal.get(cal.MONTH);
			currYear = cal.get(cal.YEAR);
			
		} else {
			cal.set(currYear, currMonth, 1);
			cal.add(cal.MONTH, -1);
			currMonth = cal.get(cal.MONTH);
			currYear = cal.get(cal.YEAR);
		}
	}
}
%>
<%!
//날짜를 확인하는 메소드
public boolean isDate(int m, int d, int y) {
	m -= 1;
	Calendar c = Calendar.getInstance();
	c.setLenient(false);
	try {
		c.set(y, m, d);
		Date dt = c.getTime();
	} catch (IllegalArgumentException e) {
		return false;
	}
	return true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<script type="text/javascript">

//날짜와 방이 선택됐는지 확인하기위한 변수
var submitCheck;

//year, month, day, roomId를 받아 roomname으로 바꾼후 input에 넣어줌
function dateroom(year , month , day, roomId){
	var roomname;
	switch(roomId){
		case 1 :
			roomname = "합주실(소)";
			break;
		case 2 :
			roomname = "합주실(대)";
			break;
		case 3:
			roomname = "커뮤니티스튜디오";
			break;
		case 4:
			roomname = "999홀";
			break;
		case 5:
			roomname = "허브홀";
			break;
	}
	submitCheck = year+"-"+month+"-"+day+" "+roomname;
	document.getElementById("dateroom").value = year+"-"+month+"-"+day+" "+roomname;
	
	document.getElementById("date").value = year+"-"+month+"-"+day;
	document.getElementById("roomId").value = roomId;
}

//선택 가능한 checkbox의 갯수
var maxChecked = 3;

//선택한 checkbox의 총갯수
var totalChecked = 0;

//checkbox총 선택수를 3개로 제한
function checkLimit(obj) {
    if (obj.checked == true){
        totalChecked += 1;
    	chkRow = obj.checked.value;
    }else{
        totalChecked -= 1;
    }
    if (totalChecked > maxChecked) {
        alert ("최대 3개 까지만 가능합니다.");
        obj.checked = false;
   		totalChecked -= 1;
    }
    
}

//취소 선택시 선택한 수를 0으로
function resetCount(){
    totalChecked = 0;
}

//대관신청 클릭시 연속된 시간인지 날짜와 방이 선택됐는지 확인
function chkContinuity() {
	// 체크박스를 가져옴
	var chk = document.getElementsByName("time");
	
	//체크박스의 전체 개수
	var len = chk.length;
	
	//체크된 체크박스의 value를 담기위한 변수
	var chkRow;
	
	for(var i=0; i<len; i++){
		//체크가 되어있는 값 구분
		if(chk[i].checked == true){
			 //value를 담음
			chkRow = chk[i].value;
			break;
			}
		}
	
	//배열로 넣어야되기 때문에 숫자 다시설정
	var select1 = (parseInt(chkRow) - 1);
	var select2 = (parseInt(chkRow));	
	var select3 = (parseInt(chkRow) + 1);
	
	//연속으로 체크되었는지 확인 선택된갯수로 switch문
	//날짜와 방이 선택됐는지 확인 선택 되었으면 submit
	//연속으로 선택하지 않으면  전체버튼을 해제하고 totalChecked 초기화	
	switch (totalChecked) {
	case 0:
		alert ("시간을 선택하세요");
		break;
		
	case 1:
		if(submitCheck != null){
			calendar.submit();
		}else{
			alert ("날짜와 방을 선택해주세요");
		}
		break;
		
	case 2:
		if(chk[select1].checked == true && chk[select2].checked == true){
			if(submitCheck != null){
				calendar.submit();
			}else{
				alert ("날짜와 방을 선택해주세요");
			}
			break;
		}else {
			alert ("시간이 연속되게 선택해주세요");
			for(i = 0; i < len; i++) {
				chk[i].checked = false;
			}
			totalChecked = 0;
			break;
		}
		break;
		
	case 3:
		if(chk[select1].checked == true && chk[select2].checked == true && chk[select3].checked == true){
			if(submitCheck != null){
				calendar.submit();
			}else{
				alert ("날짜와 방을 선택해주세요");
			}
			break;
		}else {
			alert ("시간이 연속되게 선택해주세요");
			for(i = 0; i < len; i++) {
				chk[i].checked = false;
			}
			totalChecked = 0;
			break;
		}
		break;
	}
}
</script>

<style type="text/css">

table{
	width: 100%;
}

.element{
	float: left;
}

#checkboxdiv{
	width: 20%%;
}

#calendardiv{
	width: 80%;
}
</style>

</head>
<body>
<div id="container">
	<div class="element" id="calendardiv">
		<table border="1">
			<tr>
				<td>
					<a href="calendar?month=<%=currMonth%>&year=<%=currYear%>&action=0">◀</a>
				</td>
				
				<td>
					<b><%=cal.get(cal.YEAR)+"년 "+(cal.get(cal.MONTH)+1)+"월"%></b>
				</td>
				
				<td>
					<a href="calendar?month=<%=currMonth%>&year=<%=currYear%>&action=1">▶</a>
				</td>
			</tr>
		</table>
		
		<table border="1">
			<tr>
				<td>
					<b>일</b>
				</td>
			
				<td>
					<b>월</b>
				</td>
						
				<td>
					<b>화</b>
				</td>
					
				<td>
					<b>수</b>
				</td>
				
				<td>	
					<b>목</b>
				</td>
	
				<td>				
					<b>금</b>
				</td>
				
				<td>
					<b>토</b>
				</td>
			</tr>
	<%
		int currDay;
		String todayColor;
		int count = 1;
		int dispDay = 1;
		
		for (int w = 1; w < 7; w++){
	%>
			<tr>
	<%
	  		for (int d = 1; d < 8; d++){
				if (! (count >= cal.get(c.DAY_OF_WEEK))){ 
	%>
				<td>&nbsp;</td>
	<%
					count += 1;
				} else{
					if (isDate ( currMonth + 1, dispDay, currYear) ) {// use the isDate method
						if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) {// Here we check to see if the current day is today
								todayColor = "#6C7EAA";
							}else{
								todayColor = "#ffffff";
							}
	%> 
					<td bgcolor="<%=todayColor%>"><%=dispDay + "일"%><br>
					<label>
						<font size="1"><input type="radio" name="room" value="1" onclick="dateroom(<%=currYear%>, <%=(currMonth+1)%>, <%=dispDay%>,1)">합주실(소)<br></font>
					</label>
					
					<label>
						<font size="1"><input type="radio" name="room" value="2" onclick="dateroom(<%=currYear%>, <%=(currMonth+1)%>, <%=dispDay%>,2)">합주실(대)<br></font>
					</label>
					
					<label>
						<font size="1"><input type="radio" name="room" value="3" onclick="dateroom(<%=currYear%>, <%=(currMonth+1)%>, <%=dispDay%>,3)">커뮤니티스튜디오<br></font>
					</label>
					
					<label>
						<font size="1"><input type="radio" name="room" value="4" onclick="dateroom(<%=currYear%>, <%=(currMonth+1)%>, <%=dispDay%>,4)">999홀<br></font>
					</label>
					
					<label>
						<font size="1"><input type="radio" name="room" value="5" onclick="dateroom(<%=currYear%>, <%=(currMonth+1)%>, <%=dispDay%>,5)">허브홀<br></font>
					</label>					
				</td>
	<%
						count += 1;
						dispDay += 1;
					}else{
	%>
				<td>&nbsp;</td>
	<%
					} 
				}
	
	       } 
	%>
			</tr>
	<% 
		}
	%>
		</table>
	</div>
	<div class="element" id="checkboxdiv">
		<form action="calendar" method="post" name="calendar">
			<input type="text" name="dateroom" id="dateroom" readonly><br>
			
			<input type="hidden" name="roomId" id="roomId" readonly>
			<input type="hidden" name="date" id="date" readonly>
			
			<input type="checkbox" name="time" id="chk1" value="1" onclick="checkLimit(this)" >AM 09:00 ~ AM 10:00<br>
			<input type="checkbox" name="time" id="chk2" value="2" onclick="checkLimit(this)" >AM 10:00 ~ AM 11:00<br>
			<input type="checkbox" name="time" id="chk3" value="3" onclick="checkLimit(this)" >AM 11:00 ~ PM 12:00<br>
			<input type="checkbox" name="time" id="chk4" value="4" onclick="checkLimit(this)" >PM 12:00 ~ PM 01:00<br>
			<input type="checkbox" name="time" id="chk5" value="5" onclick="checkLimit(this)" >PM 01:00 ~ PM 02:00<br>
			<input type="checkbox" name="time" id="chk6" value="6" onclick="checkLimit(this)" >PM 02:00 ~ PM 03:00<br>
			<input type="checkbox" name="time" id="chk7" value="7" onclick="checkLimit(this)" >PM 03:00 ~ PM 04:00<br>
			<input type="checkbox" name="time" id="chk8" value="8" onclick="checkLimit(this)" >PM 04:00 ~ PM 05:00<br>
			<input type="checkbox" name="time" id="chk9" value="9" onclick="checkLimit(this)" >PM 05:00 ~ PM 06:00<br>
			<button type="button"  onclick="chkContinuity()" >대관 신청</button>
			<input type="reset" name="reset" onclick="resetCount()" value="선택 취소">
		</form>
	</div>
</div>
</body>
</html>
