<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Clock</title>
        <style>
            body{
                margin : 0px;
                padding : 0px;
                background-color : none;
            }
        </style>
    </head>
    <body>
        <canvas id="myCanvas" width ="126" height ="128"></canvas>
        <script>
            var canvas = document.getElementById("myCanvas");
            var context = canvas.getContext("2d");
            var hl, ml;
            var centerX = 63, centerY = 63;
            hl = 45;
            ml = 50;
            function drawClock(){

                context.beginPath();
                context.rect(0,0,200,200);
                context.fillStyle="rgb(164,164,164)";
                context.fill();
                context.beginPath();
                context.arc(centerX,centerY, 60, 0, 2.0 * Math.PI, false);
                context.closePath();
                context.strokeStyle="black";
                context.stroke();
                drawClocktick();
            }
            function drawClocktick(){
                
                var now = new Date();
                var hour = now.getHours() % 12;
                var min = now.getMinutes();
                var sec = now.getSeconds();
                sec = sec / 30 * Math.PI;
                min = min / 30  * Math.PI;
                hour = hour / 6 * Math.PI;

                context.beginPath();
                context.moveTo(centerX,centerY);
                context.lineTo(centerX + hl*Math.sin(Math.PI - hour), centerY+ hl*Math.cos(Math.PI - hour));
                context.strokeStyle="black";
                context.stroke();

                context.beginPath();
                context.moveTo(centerX,centerY);
                context.lineTo(centerX + ml*Math.sin(Math.PI - min), centerY+ ml*Math.cos(Math.PI - min));
                context.strokeStyle="black";
                context.stroke();

                context.beginPath();
                context.moveTo(centerX,centerY);
                context.lineTo(centerX + ml*Math.sin(Math.PI - sec), centerY+ ml*Math.cos(Math.PI - sec));
                context.strokeStyle="red";
                context.stroke();
            }
            id = setInterval(drawClock,1000);
        </script>
    </body>
</html>