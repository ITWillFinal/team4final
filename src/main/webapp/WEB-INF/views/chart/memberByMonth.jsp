<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
 <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
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
          title: '월별 일반회원 가입 현황',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>