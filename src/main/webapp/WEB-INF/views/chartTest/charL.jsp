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
          ['월', '매출'],
          ['1월',  ${snum1}],
          ['2월',  ${snum2}],
          ['3월',  ${snum3}],
          ['4월',  ${snum4}],
          ['5월',  ${snum5}],
          ['6월',  ${snum6}],
          ['7월',  ${snum7}],
          ['8월',  ${snum8}],
          ['9월',  ${snum9}],
          ['10월',  ${snum10}],
          ['11월',  ${snum11}],
          ['12월',  ${snum12}]
        ]);

        var options = {
          title: 'Company Performance',
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