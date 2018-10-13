<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>viewResults</title>
	<style>
		body, ul, h2, h3, p {
	margin: 0;
	padding: 0;
}

body {
    background-color: #241000;
}

li {
	list-style-type: none;
}

a {
	color: inherit;
	text-decoration: none;
}

@keyframes nose {
    0%{
        transform: scale(1);
        box-shadow: 30px 30px 30px red inset;
    }
    100% {
        background-color: #bf1d20;
        top: -5px;
        transform: scale(0.95);
        
        box-shadow: 15px 15px 15px red inset;
    }
}

@keyframes nose-light {
    0%{
        background-color: #fff;
    }
    100% {
        background-color: #ffa19a;
    }
}

@keyframes rudolph {
    0% {
        top: -15px;
    }
    100% {
        top: 0px;
    }
}

.rudolph {
    width: 400px;
    height: 400px;
    margin: 300px auto 0;
    position: relative;
    
    animation-name: rudolph;
    animation-duration: 1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

.ears {
    width: 50px;
    height: 60px;
    background-color: #d6ab66;
    position: absolute;
    z-index: -1;
    border-top-left-radius: 40%;
    border-top-right-radius: 40%;
    border-bottom-right-radius: 50%;
    border-bottom-left-radius: 50%;
    border: px solid #241000;
}

.ears.left {
    left: 75px;
    transform: rotate(-40deg);
}

.ears.right {
    right: 75px;
    transform: rotate(40deg);
}

.ears .inner {
    width: 35px;
    height: 45px;
    border-top-left-radius: 40%;
    border-top-right-radius: 40%;
    border-bottom-right-radius: 50%;
    border-bottom-left-radius: 50%;
    background-color: #b36d15;
}

.ears.left .inner {
    margin: 15px 0 0 5px;
}

.ears.right .inner {
    margin: 15px 0 0 10px;
}

.antlers {
    width: 25px;
    height: 200px;
    position:absolute;
    background-color: #b98845;
    border-radius: 20px;
}

.antlers.left:before {
    content:'';
    position: absolute;
    width: 25px;
    height:70px;
    background-color: #b98845;
    border-radius: 20px;
    transform: rotate(-45deg);
    left: -20px;
    top: 80px;
}

.antlers.left {
    top: -170px;
    left: 120px;
    transform: rotate(-15deg);
}

.antlers.left:after {
    content:'';
    position: absolute;
    width: 25px;
    height:100px;
    background-color: #b98845;
    border-radius: 20px;
    transform: rotate(35deg);
    left: 20px;
    top: 50px;
}

.antlers.right:before {
    content:'';
    position: absolute;
    width: 25px;
    height:100px;
    background-color: #b98845;
    border-radius: 20px;
    transform: rotate(-35deg);
    left: -25px;
    top: 50px;
}

.antlers.right {
    top: -170px;
    right: 120px;
    transform: rotate(15deg);
}

.antlers.right:after {
    content:'';
    position: absolute;
    width: 25px;
    height:70px;
    background-color: #b98845;
    border-radius: 20px;
    transform: rotate(45deg);
    left: 20px;
    top: 80px;
}

.face {
    width: 200px;
    height: 240px;
    margin: 0 auto;
    background-color: #edc27d;
    border-top-left-radius: 150px;
    border-top-right-radius: 150px;
    border-bottom-right-radius: 200px;
    border-bottom-left-radius: 200px;
    position: relative;
    z-index: -1;
}

.face .eyes {
    width: 30px;
    height: 60px;
    background-color: #222;
    border-radius: 70%;
    position: absolute;
}

.face .eyes.left {
    top: 80px;
    left: 45px;
}

.face .eyes.right {
    top: 80px;
    right: 45px;
}

.face .eyes .pupil {
    width: 5px;
    height: 25px;
    border-radius: 100%;
    background-color: #fff;
    float: right;
    margin: 10px 7px 0 0; 
    transform: rotate(-7deg);
    position: relative;
}

.face .eyes .pupil::after {
    position:absolute;
    bottom: -7px;
    content:'';
    width: 4px;
    height: 4px;
    background-color: #fff;
    border-radius: 100%;
}

.chin {
    width: 250px;
    height: 150px;
    margin: 0 auto;
    background-color: #fbf9ec;
    border-radius: 48%;
    margin-top: -90px;
}

.chin .nose {
    width: 75px;
    height: 75px;
    background-color: #fd040a;
    top: -15px;
    border-radius: 100%;
    border: 5px solid #aa1c1f;
    margin: 0 auto;
    position: relative;
    
    animation-name: nose;
    animation-duration: 1s;
    animation-direction: alternate;
    animation-iteration-count: infinite;
    
}

.chin .nose .inner {
    width: 45px;
    height: 25px;
    background-color: #ffa19a;
    border-radius: 100%;
    transform: rotate(20deg);
    position: absolute;
    right: 10px;
    top:5px;
    
    animation-name: nose-light;
    animation-duration: 1s;
    animation-direction: alternate;
    animation-iteration-count: infinite;
}

h1 {
    color: white;
    position: absolute;
    left: 0;
    right: 0;
    top: 160px;
    text-align: center;
    font-size: 3rem;
    line-height: 0.9;
    
    animation-name: letter;
    animation-duration: 0.1s;
    animation-iteration-count: infinite;
    animation-direction: alternate-reverse;
}
/*h1 {

    color: white;
    position: absolute;
    left: 0;
    right: 0;
    top: 160px;
    text-align: center;
    font-size: 3rem;
    line-height: 0.9;
    
    animation-name: letter;
    animation-duration: 0.1s;
    animation-iteration-count: infinite;
    animation-direction: alternate-reverse;
}*/
h1 strong {

    display: block;
    color: #E8E2AE;
    font-style: italic;
    padding-right: 0.4em;
    font-size: 0.9em;
}
/*h1 strong {

    display: block;
    color: black;
    font-style: italic;
    padding-right: 0.4em;
    font-size: 0.9em;
}*/


		
	</style>
</head>
<body>

	<div class="rudolph">
            <div class="antlers left"></div>
            <div class="antlers right"></div>
            <div class="ears left">
                <div class="inner"></div>    
            </div>
            <div class="ears right">
                <div class="inner"></div>    
            </div>
		    <div class="face">
		        <div class="eyes left">
		            <div class="pupil"></div>    
		        </div>
		        <div class="eyes right">
		            <div class="pupil"></div>    
		        </div>
		    </div>
		    <div class="chin">
		        <div class="nose">
		            <div class="inner"></div>
		        </div>
		    </div>
		</div>

		<h1 align="center"><strong>심의중입니다.</strong></h1>

<br>
<button type="button" onclick="location.href='main.jsp' ">메인으로</button>


</body>
</html>