<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>선지자: 학생들이 만들어가는 수강정보 사이트</title>
	<%@ include file="./include/include_file.inc" %>
	<!--입력 창-->
	<link rel="stylesheet" type="text/css" href="./TextInputEffects/css/set1.css" />
</head>

<body>
<div class="content-wrap">

	<!--헤더-->
	<header>
		<%@ include file="./include/menu.inc" %>
	</header>
	<h1>수강 정보 입력</h1>
	
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
				<section class="content bgcolor-1">
	<%
	class InfoCreate{
		public String label;
		public String name;
		public String id;

		public InfoCreate(String label, String name, String id){
			//이 순서대로 값을 할당
			this.label = label;
			this.name = name;
			this.id = id;
		}	
	}
	InfoCreate[] TextInfo = {
		new InfoCreate("과목명","subject","subject2"),
		new InfoCreate("학수번호", "ID","ID2"),
		new InfoCreate("교수님 성함", "name", "name2")
	};
	
	InfoCreate[] FivePointScale = {
		new InfoCreate("과제량","homework","homework2"),
		new InfoCreate("재미", "fun","fun2"),
		new InfoCreate("유익함", "benefit", "benefit2"),
		new InfoCreate("수업난이도", "level_of_difficulty", "level_of_difficulty2"),
		new InfoCreate("전체 호감도", "all_favor", "all_favor2")
	};
	
	%>
			<%
			for (int i=0; i<=2; i++){	
			%>
					<!--과목명, 학수번호, 교수님 성함-->
					<span class="input input--textbox">
						<input class="input__field input__field--textbox" type="text" id="<%=TextInfo[i].id%>" name="<%=TextInfo[i].name%>" required="required"/>
						<label class="input__label input__label--textbox" for="<%=TextInfo[i].id%>">
							<span class="input__label-content input__label-content--textbox"><%=TextInfo[i].label%></span>
						</label>
					</span>
			<%
			}
			%>		
					<!-- 5점 척도 -->	
			<%
			for (int i=0; i<=4; i++){	
			%>
					<div class="range">
					<label for="<%=FivePointScale[i].id%>"><%=FivePointScale[i].label%></label>	
					<input type="range" name="<%=FivePointScale[i].name%>" id="<%=FivePointScale[i].id%>" min="1" max="5" steps="1" value="5" 
					list="list<%=i%>" oninput="outputUpdate<%=i%>(value)">
					<output for="<%=FivePointScale[i].id%>" id="volume<%=i%>">5</output>
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

<div>
</body>
	<!--텍스트 인풋-->
	<script src="./TextInputEffects/js/classie.js"></script>
			<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}

			[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
				// in case the input is already filled..
				if( inputEl.value.trim() !== '' ) {
					classie.add( inputEl.parentNode, 'input--filled' );
				}

				// events:
				inputEl.addEventListener( 'focus', onInputFocus );
				inputEl.addEventListener( 'blur', onInputBlur );
			} );

			function onInputFocus( ev ) {
				classie.add( ev.target.parentNode, 'input--filled' );
			}

			function onInputBlur( ev ) {
				if( ev.target.value.trim() === '' ) {
					classie.remove( ev.target.parentNode, 'input--filled' );
				}
			}
		})();
	</script>
		<%@ include file="./include/include_file2.inc" %>	
</html>