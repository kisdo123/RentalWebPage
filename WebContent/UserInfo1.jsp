
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
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

 
            

        

<form action="change" method="post">
<div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">
    
   

    <table>
        <tr>
            <!-- 로그인 위에 이미지가 들어가는 자리 -->
            <td class="logo" colspan="2"><img src="하자.png" width="180px"></td>
        </tr>
        <tr>
            <th colspan="2">
                 내 정보
            </th>
        </tr>

        <tr>
            <td id="title" class="info">닉네임(ID)</td>
            <td class="form">${loginUser.id }</td>
        </tr>

    <tr>
        <td id="title" class="info">비밀번호</td>
        <td class="form">${loginUser.pw }</td>
    </tr>
    <tr>
        <td id="title" class="info">이름</td>
        <td class="form">${loginUser.name }</td>
    </tr>
    
 
        
    <tr>
        <td id="title" class="info">연락처</td>
        <td class="form">${loginUser.phone }</td>
    </tr>
    
    <tr>
        <td id="title" class="info">소속</td>
        <td class="form">${loginUser.team }</td>
    </tr>
    <tr>
        <td id="title" class="info">생년월일</td>
        <td class="form">${loginUser.birth }</td>
    </tr>   


<!--         <tr>
            <td colspan="2"><input class="logbtn" type="button" value="메인으로" onclick="changeForm(1)"></td>
        </tr>
        <tr>    
            <td><input class="logbtn" type="button" value="회원정보 변경" onclick="changeForm(2)"></td>
         </tr> -->
        <tr>
           <td colspan="2">
               <!--  <input class="logbtn" type="button" value="회원정보 변경"> -->
                <input class="logbtn" type="button" value="회원정보 변경" onclick="changeForm(2)">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="logbtn" type="button" value="메인으로" onclick="changeForm(1)">
            </td>
        </tr>

        <tr>
            <td><br></td>
        </tr>                       


        </table>
    

        </div>
    </div>  
</div>  
</form>


</body>
</html>