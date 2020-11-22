<!--링크 색 변환 / 클릭할 때 커서 변하기-->
<style type="text/css">
 .codrops-header:hover { color: red; text-decoration: none;}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
    -webkit-appearance: button;
    cursor: pointer;
}
</style>
<div class="content-wrap">	
	<div class="menu-wrap">
		<nav class="menu">
			<div class="icon-list">
				<a class="change" href="main.jsp"><i class="fa fa-home"></i><span>홈으로</span></a>
				<a class="change" href="info.jsp"><i class="fa fa-question"></i><span>웹 사이트 소개</span></a>
				<a class="change" href="read.jsp"><i class="fa fa-fw fa-newspaper-o"></i><span>수강 정보</span></a>
			</div>
		</nav>
		<button class="close-button" id="close-button">Close Menu</button>
	</div>
		<button class="menu-button" id="open-button">Open Menu</button>			
</div><!-- /content-wrap -->