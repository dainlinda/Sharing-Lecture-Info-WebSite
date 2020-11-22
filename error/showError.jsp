<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>선지자:학생들이 만들어가는 수강신청 사이트</title>
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>

<body>

<!-- 전역변수 선언 및 입력 매개변수값 추출 -->
<%
// 입력정보 한글 처리
request.setCharacterEncoding("utf-8");
// 입력 에러정보 추출 
String rst = request.getParameter("rst");
String msg = request.getParameter("msg");
%>

<section data-role="page">

	<!-- 1. 헤더 -->
	<header data-role="header" data-theme="b">
		<h1>오류가 발생하였습니다.</h1> 

	</header> 

	<!-- 2. 본문 -->
	<section data-role="content"> 

		<frameset>
			<legend>에러 내용</legend>  
			결과: <%= rst %><br>
			에러: <%= msg %>
		</frameset>
			
	</section>

	<!-- 3. 푸터 -->
	<footer data-role="footer" data-theme="a" data-position="fixed">
			<div data-role="footer" class="footer-docs" data-theme="a" data-position="fixed"> 
			<center>
			김다인(15)
			</center>
		</div>	

	</footer>

</section>
</body>
</html>