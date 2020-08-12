<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		
		$('.btWeek').click(function(){
			$.setDate(7, 'd'); //1주일전
		})
		$('.btMonth1').click(function(){
			$.setDate(1, 'm'); //1개월전
		})
		$('.btMonth3').click(function(){
			$.setDate(3, 'm'); //3개월전
		})
		
	});
	
	$.setDate = function(term, type){
		var arr = $('#endDay').val().split("-");  //2020-07-20
		var d = new Date(arr[0], arr[1]-1, arr[2]);
		
		if(type=='d'){
			d.setDate(d.getDate()-term); //7일전 날짜			
		}else if(type=='m'){
			d.setMonth(d.getMonth()-term); //1개월전이나 3개월전 날짜			
		}
		
		$('#startDay').val($.findDate(d));
	}
	
	$.findDate=function(date){
		return date.getFullYear() +"-" 
			+ $.formatDate(date.getMonth()+1) 
			+"-" + $.formatDate(date.getDate());
	}
	
	$.formatDate = function(d){
		if(d<10){
			return "0"+d;
		}else{
			return d;
		}
	}
	

</script>
<style>
input[type=button] {
    width: 60px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-left: 1%;
}
span#pp {
    font-size: 16pt;
    margin-left: 1%;
    margin-right: 1%;
}
input.bts {
    margin-bottom: 8%;
}
</style>
<input type="date" name="startDay" id="startDay" value="${dateSearchVO.startDay }">
<span id = "pp">~</span>
<input type="date" name="endDay" id="endDay"
	value="${dateSearchVO.endDay }">
<br>
<input type="button" value="1주일" class="btWeek" style="margin-top: -6%;">
<input type="button" value="1개월" class="btMonth1" style="margin-top: -6%;">
<input type="button" value="3개월" class="btMonth3" style="margin-top: -6%;">

