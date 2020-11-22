<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>선지자: 학생들이 만들어가는 수강정보 사이트</title>
		<%@ include file="./include/include_file.inc" %>	
		<!--슬로건-->
		<link rel="stylesheet" type="text/css" href="./OpeningSequence/css/component.css" />
		<script src="./OpeningSequence/js/modernizr.custom.js"></script>
</head>

<body>
<div class="content-wrap">

	<!--헤더-->
	<header>
		<%@ include file="./include/menu.inc" %>	
	</header><p>
	
	<!--본문-->	
		<div class="chapter">
			<section data-role="page">		
				<div class="os-phrases" id="os-phrases">
					<h2 id=top>선지자</h2><p>
					<h2 id=bottom>학생들이만들어가는<h2>
					<h2 id=bottom2>수강정보사이트</h2>
				</div>
			</section>
		</div>

</div>
</body>
	<!--애니메이션-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="./OpeningSequence/js/jquery.lettering.js"></script>
	<script>
		$(document).ready(function() {
			$("#os-phrases > h2").lettering('words').children("span").lettering().children("span").lettering(); 
		})
	</script>
		<%@ include file="./include/include_file2.inc" %>	
</html>