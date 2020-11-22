<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>선지자: 학생들이 만들어가는 수강정보 사이트</title>
	<%@ include file="./include/include_file.inc" %>
</head>

<body>
<div class="content-wrap">

	<!--헤더-->
	<header>
		<%@ include file="./include/menu.inc" %>
	</header>
	<h1>수강 정보 입력</h1>
	
<%
	// 키를 읽어옴
	String ID 			= request.getParameter("ID");
	String subject  	= request.getParameter("SUBJECT");
	String name 		= request.getParameter("NAME");
%>
				
	<style>
	.content{
	border: 0.3em solid #bbb;
		color: black;
		text-align: center;
	}
	</style>
	<!-- 본문 -->
	<section data-role="content"> 
		<form method="post" action="create.jsp" data-ajax="false">		
			
				<section class="content">
					<h3>
					<!--과목명, 학수번호, 교수님 성함-->
					<input type=hidden name="subject" value="<%=subject%>"></input>
					과목명: <%=subject%>
					<p>
					<input type=hidden name="ID" value="<%=ID%>"></input>
					학수번호: <%=ID%>
					<p>
					<input type=hidden name="name" value="<%=name%>"></input>
					교수님 성함: <%=name%>
					<p>
					</h3>
	<%
	class FivePointScale{
		public String label;
		public String name;
		public String id;

		public FivePointScale(String label, String name, String id){
			//이 순서대로 값을 할당
			this.label = label;
			this.name = name;
			this.id = id;
		}	
	}
	
	FivePointScale[] evaluate = {
		new FivePointScale("과제량","homework","homework2"),
		new FivePointScale("재미", "fun","fun2"),
		new FivePointScale("유익함", "benefit", "benefit2"),
		new FivePointScale("수업난이도", "level_of_difficulty", "level_of_difficulty2"),
		new FivePointScale("전체 호감도", "all_favor", "all_favor2")
	};
	
	%>
			<!-- 5점 척도 -->	
			<%
			for (int i=0; i<=4; i++){	
			%>
					<div class="range">
					<label for="<%=evaluate[i].id%>"><%=evaluate[i].label%></label>	
					<input type="range" name="<%=evaluate[i].name%>" id="<%=evaluate[i].id%>" min="1" max="5" steps="1" value="5" 
					list="list<%=i%>" oninput="outputUpdate<%=i%>(value)">
					<output for="<%=evaluate[i].id%>" id="volume<%=i%>">5</output>
					<datalist id="list<%=i%>">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>
					<script>
					function outputUpdate<%=i%>(vol) {
						document.querySelector('#volume<%=i%>').value = vol;
					}
					</script>
			<%
			}
			%>
				</section>
				<p align="center">
				<button type=submit id="submit" data-role="button" data-inline="true" 
				class="button button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick" 
				data-text="등록">
				<span>등록</span>
				</button>
				</p>
		</form>
	</section>
</div>
</body>
		<%@ include file="./include/include_file2.inc" %>	
</html>