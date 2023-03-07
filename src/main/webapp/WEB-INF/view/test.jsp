<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1, div.main{
  width:350px;
  margin: 0 auto;
}
div.main{
    position: relative;
    padding: 20px;
}
div.main input{
    width: 300px;
    height: 30px;
    background-color: black;
    border: 0;
    color: white;
    text-indent: 10px;
}
div.main i{
    position: absolute;
    left: 75%;
    top: 27px;
    color: orange;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
			    $('.main i').on('click',function(){
			        $('input').toggleClass('active');
			        if($('input').hasClass('active')){
			            $(this).attr('class',"fa fa-eye-slash fa-lg")
			            .prev('input').attr('type',"text");
			        }else{
			            $(this).attr('class',"fa fa-eye fa-lg")
			            .prev('input').attr('type','password');
			        }
			    });
			});
		</script>
</head>
<body>
	<h1>비밀번호 보기/숨기기</h1>
<div class="main">
  <input type="password" placeholder="비밀번호를 입력하세요">
  <i class="fa fa-eye fa-lg"></i>
</div>
</body>
</html>