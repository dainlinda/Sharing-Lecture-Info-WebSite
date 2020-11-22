<!--dummy 리스트 감추기 위한 자바스크립트. display='none'을 display=''로 바꿔줌. 이 위치 아니면 작동 안함. visibility를 쓰면 오류-->

		
			var menu_button = document.getElementById('menu-icon-trigger');

			menu_button.addEventListener('click', function() {
				 show_hide();
			}, false);

			 function show_hide() {  // 플래시 또는 html에서 오브젝트id값에 의한 호출 
			 //console.log("=====show hide function start======");
			 var menu = document.getElementById("dummy");  // 호출된 id값을 menu 변수로 치환
				if ( menu.style.display != 'none' ) { // 만약 menu가 none이 아니면 즉, 보여지는 상태이면
					menu.style.display = 'none';   // menu를 숨기고
					//console.log("=====show hide none======");
				} else {
			   menu.style.display = ''; // menu이 숨김 상태이면 나타내라
			   //console.log("=====show hide visible======");
			  }
			}