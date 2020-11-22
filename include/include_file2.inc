	<!--메뉴-->
	<script src="./OffCanvasMenuEffects/js/classie.js"></script>
	<script src="./OffCanvasMenuEffects/js/main.js"></script>

	<!--버튼-->
	<script>
	(function() {
		var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);
		if(isSafari) {
			document.getElementById('support-note').style.display = 'block';
		}
	})();
	</script>
	
	<!--read.jsp search_read.jsp-->
	<!--검색-->
	<script src="./ExpandingSearchBar/js/classie.js"></script>
	<script src="./ExpandingSearchBar/js/uisearch.js"></script>
	<script>new UISearch( document.getElementById( 'sb-search' ) );</script>
