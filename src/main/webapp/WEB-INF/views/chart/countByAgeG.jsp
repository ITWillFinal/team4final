<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

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
            title: '연령별 일반회원 현황',
            /* subtitle: '2020', */
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>