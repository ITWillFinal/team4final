<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	.chatbot{
		position: fixed;
	    bottom: 50px;
	    right: 50px;
	    width: 70px;
	    height: 70px;
	    border-radius: 100%;
	    background: #fb246a;
	    background-image:url("<c:url value='/resources/images/chatbot.png'/>");
		background-repeat:no-repeat;
		background-size:75% 80%;
		background-position: center center; 
		z-index: 1
	}
	
	.chatbot-main{
		display:none;
		position: fixed;
		width: 270px;
   		height: 500px;
		bottom: 50px;
   		right: 50px;
   		padding: 10px;
   		background: #8e7a80;
   		 border-radius: 20px;
   		 z-index: 2;
	}
	
	.chatbot-top{
		height: 40px;
	}
	
	.chatbot-screen{
		width: 250px;
		height: 390px;
	    background: #d1f6ff;
  	  	border-radius: 5px;
  	  	margin-bottom: 10px;
  	  	padding: 5px;
  	  	overflow-y: scroll;
  		-ms-overflow-style: none;
    	scrollbar-width: none
	}
	
	.chatbot-screen::-webkit-scrollbar {
	    display: none; 
	}
	
	.chatbot-bt{
		height: 40px;
		
		/* padding: 7px 0; */
	}
	
	.chatbot-bt input[type=text]{
		width: 80%;
		border: 0;
		font: inherit;
    	margin: 0;
    	height: 90%;
	}

	.chatbot-bt input[type=button]{
		width: 20%;
		height: 90%;
		background: #b5a5aa;
	    color: #ffffff;
	    font-weight: bold;
	    border: 0;
	   	font: inherit;
 	   	margin: 0;
 	   	float:right;
 	   	cursor:pointer;
	}
	
	.chatbot-title{
		text-align:center;
		width: 250px;
		display: inline-block;
		height: 30px;
		float: right;
	}
	
	.chatbot-title p{
		font-family: "Muli", sans-serif;
	    color: #ffffff;
	    font-size: larger;
	    margin-bottom: 0;
	    font-weight: bold;
	}
	.exit{
		display: inline-block;
	    background-image: url(/team4final/resources/images/chatexit.png);
	    background-repeat: no-repeat;
	    background-size: 100% 100%;
	    background-position: center center;
	    width: 30px;
	    height: 30px;
	    float: right;
	}
	
	.balloon1 {
		position: relative;
	    margin-left: 20px;
	    width: 220px;
	    height: auto;
	    background: #ffffff;
	    border-radius: 10px;
	    margin-bottom: 15px;
	    padding: 3px;
	}
	.balloon1:after {
		 border-top:15px solid #ffffff;
		 border-left: 15px solid transparent;
		 border-right: 0px solid transparent;
		 border-bottom: 0px solid transparent;
		 content:"";
		 position:absolute;
		 top:5px;
		 left:-15px;
	}

	.balloon2 {
		 position: relative;
	    margin-left: 20px;
	    width: 220px;
	    height: auto;
	    background: #f1e344;
	    border-radius: 10px;
	    margin-bottom: 5px;
	    padding: 3px;
	}
	.balloon2:after {
		 border-top:15px solid #f1e344;
		 border-left: 0px solid transparent;
		 border-right: 15px solid transparent;
		 border-bottom: 0px solid transparent;
		 content:"";
		 position:absolute;
		 top:5px;
		 right:-15px;
	}
	
	.autoBr{
		word-wrap: break-word;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$('.chatbot').click(function(){
			$('.chatbot-main').show('nomal');
			$('.chatbot-screen').scrollTop($('.chatbot-screen').height()+$('.chatbot-screen div').length*500);
		});
		
		$('.exit').click(function(){
			$('.chatbot-main').hide('nomal');
		});
		
		$('.messageSend').click(function(){
			if($('.message').val()==""){
				return false;
			}
			var sendMsg = "<div class='balloon2'><span class='autoBr'>";
			sendMsg+=$('.message').val()+"</span></div>";			
			$('.chatbot-screen').append(sendMsg);
			
			var receiveMsg = "<div class='balloon1'><span class='autoBr'>";
			receiveMsg+="기능 미구현...</span></div>";
			$('.chatbot-screen').append(receiveMsg);
			
			$('.message').val("");
			$('.chatbot-screen').scrollTop($('.chatbot-screen').height()+$('.chatbot-screen div').length*500);
			console.log();
			
			/* $.ajax({
				url:"<c:url value='/chatbot/messageSend.do'/>",
				type:"get",
				data:"message="+$('.message').val(),
				success:function(res){
					
				},
				error:function(xhr, status, error){
					alert(status+","+error );
				}
			}) */
		});
		
		$('.message').keypress(function(event){
		    if ( event.which == 13 ) {
		        $('.messageSend').click();
		        return false;
		    }
		});
	})

	
</script>
<div class="chatbot">
</div>
<div class="chatbot-main">
	<div class="chatbot-top">
		<div class="exit">
		<div class="chatbot-title"><p>THE JOB</p></div>
		</div>
	</div>
	<div class="chatbot-screen">
		<div class='balloon1'>
		안녕하세요!<br>
		THE JOB 챗봇 잡잡이 입니다!
		무엇을 도와드릴까요?
		<span class='autoBr'></span></div>
	</div>
	<div class="chatbot-bt">
		<input type="text" class="message"/>
		<input type="button" value="▲" class="messageSend"/>
	</div>
</div>
