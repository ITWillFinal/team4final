<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>

<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart1);

      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['연령별', '남성', '여성', '전체'],
          ['10대', ${M10}, ${F10}, ${one}],
          ['20대', ${M20}, ${F20}, ${two}],
          ['30대', ${M30}, ${F30}, ${three}],
          ['40대', ${M40}, ${F40}, ${four}]
        ]);

        var options = {
          chart: {
          /*   title: '연령별 일반회원 현황', */
            /* subtitle: '2020', */
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart2);
      
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['성별', '회원수(비율)'],
          ['남성',     ${m}],
          ['여성',     ${f}]
        ]);

        var options = {
         /*  title: '일반회원 성별별 비율', */
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
      
      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
        var data = google.visualization.arrayToDataTable([
          ['월', '일반회원 가입자 수', '기업회원 가입자 수'],
          ['1월',  ${snum1}, ${snum1c}],
          ['2월',  ${snum2}, ${snum2c}],
          ['3월',  ${snum3}, ${snum3c}],
          ['4월',  ${snum4}, ${snum4c}],
          ['5월',  ${snum5}, ${snum5c}],
          ['6월',  ${snum6}, ${snum6c}],
          ['7월',  ${snum7}, ${snum7c}],
          ['8월',  ${snum8}, ${snum8c}],
          ['9월',  ${snum9}, ${snum9c}],
          ['10월',  ${snum10}, ${snum10c}],
          ['11월',  ${snum11}, ${snum11c}],
          ['12월',  ${snum12}, ${snum12c}]
        ]);

        var options = {
         /*  title: '월별 일반회원 가입 현황', */
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart4);

      function drawChart4() {
        var data1 = google.visualization.arrayToDataTable([
          ['월', '매출'],
          ['1월',  ${s1}],
          ['2월',  ${s2}],
          ['3월',  ${s3}],
          ['4월',  ${s4}],
          ['5월',  ${s5}],
          ['6월',  ${s6}],
          ['7월',  ${s7}],
          ['8월',  ${s8}],
          ['9월',  ${s9}],
          ['10월',  ${s10}],
          ['11월',  ${s11}],
          ['12월',  ${s12}]
        ]);

        var options1 = {
          /* title: '월별 매출액', */
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart1 = new google.visualization.LineChart(document.getElementById('curve_chart2'));

        chart1.draw(data1, options1);
      }
      
      
    </script>
<style type="text/css">
div#a {
    width: 100%;
}
div#b {
    width: 100%;
}
div#c {
    width: 100%;
}
div#d {
    width: 100%;
    margin-bottom: 10%;
}
div#columnchart_material {
    margin-bottom: 3%;
}
h4 {
    font-size: 20px;
    margin-bottom: 0;
    margin-top: 5%;
    margin-left: 3%;
}
hr {
    border:1px solid #FB246A;
    width:90%;
 }
.idx {
    background-color: whitesmoke;
    padding: 15px;
    width: 55%;
    margin-left: 13%;
    margin-top: 3%;
}
h4.others {
    margin-top: 12%;
}
div#curve_chart {
    margin-left: 3%;
}
div#columnchart_material {
    padding-left: 6%;
}
div#donutchart {
    margin: 0 auto;
}
</style>
</head>
<body>
	<div id = "a" style="float: left; margin-left: 30px; font-size: 14px;">
		<div id = "b" style="margin: 5px; height: 95px;">
			<h2 style="padding-left: 50px; padding-top: 30px;">THE JOB+ 사용현황</h2>
		</div>
		<div id = "c" style="margin: 5px;">
			<div id="d" style="padding-left: 30px;">
				<h4>월별 매출액</h4>
				<hr>
				<div id="curve_chart2" style="width: 700px; height: 400px"></div>
				<div class = "idx">각 월별 매출현황입니다.<br>그래프 선에 마우스를 올리면 정확한 데이터를 알 수 있습니다.<br>월별 매출 현황은 매월 5일에 업데이트 됩니다.</div>
				
				<h4 class = "others">월별 일반회원 및 기업회원 가입 현황</h4>
				<hr>
				<div id="curve_chart" style="width: 680px; height: 300px"></div>
				<div class = "idx">각 월별 일반회원 및 기업회원 가입 현황입니다.<br>그래프 선에 마우스를 올리면 정확한 데이터를 알 수 있습니다.<br>월별 매출 현황은 매월 5일에 업데이트 됩니다.</div>
				
				<h4 class = "others">연령별 일반회원 현황</h4>
				<hr>
				<div id="columnchart_material" style="width: 500px; height: 300px; margin-left: 9%; margin-top: 4%"></div>
				<div class = "idx">연령별  일반회원 가입 현황입니다.<br>그래프 선에 마우스를 올리면 정확한 데이터를 알 수 있습니다.<br>월별 매출 현황은 매월 5일에 업데이트 됩니다.</div>
				
				<h4 class = "others">일반회원 성별별 비율</h4>
				<hr>
			    <div id="donutchart" style="width: 500px; height: 300px;"></div>
				<div class = "idx">성별별 일반회원 현황입니다.<br>그래프 선에 마우스를 올리면 정확한 데이터를 알 수 있습니다.<br>월별 매출 현황은 매월 5일에 업데이트 됩니다.</div>
			</div>		
		</div>
	</div>
</body>
</html>


<%@ include file="../inc/adminBottom.jsp"%>