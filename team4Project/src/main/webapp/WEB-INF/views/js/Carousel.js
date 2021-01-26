$(function() {
	console.log("1233333333333333333333");
	$.ajax({
		url: "/proj/campaign/getIndexCamp",
		success: function(response) {
			var campContainer = $("#campContainer");
			var dotContainer = $("#dotContainer");

			campContainer.html("");
			dotContainer.html("");
			for (var i = 0; i < response.length; i++) {
//				
//				
				var pathUrl = response[i].picturePath;
				var campUrl = "/proj/campaign/detail/"+response[i].id;
				var campTepl = `<li><a href='${campUrl}'><img src='${pathUrl}' alt=''></a></li>`;
				var dotTepl = `<li id=${i + 1}></li>`;
				console.log(pathUrl);
				campContainer.append(campTepl);
				dotContainer.append(dotTepl);
			}
			//根據後台回傳的圖片數量，動態改變圖片寬度和容器寬度
			$("ul.slides").css("width",response.length*100+"%");
			$("ul.slides li").css("width","calc(100%/"+response.length+")");
			
			let slideNum = 0;
			let slideCount = $(".slides li").length;
			let lastIndex = slideCount - 1;
			let intervalID;
			let widthPerPic = $("ul.slides li").width(); //一張圖片寬度
			let playInterval = 5000; //輪播間隔 毫秒
			show();
			autoPlay();

			$(window).resize(function() {
				widthPerPic = $("ul.slides li").width();
				show();
			});

			$(".dot li").eq(0).css("background-color", "#fff");
			$(".dot li").mouseenter(function() {
				slideNum = $(this).index();
				show();
			})

			$("#prevSlide").click(function() {

				slideNum--;
				if (slideNum < 0) slideNum = lastIndex;
				show();

			})

			$("#nextSlide").click(function() {

				slideNum++;
				if (slideNum > lastIndex) slideNum = 0;
				show();

			})

			$(".thumberNailBar li").click(function() {

				slideNum = $(this).index();
				show();

			});


			$(".wrapper li").on({

				mouseenter: () => 	{ clearInterval(intervalID) },
				mouseleave: autoPlay,

			})


			//滑動圖片
			function show() {

				$(".dot li").eq(slideNum).css("background-color", "white")
					.siblings().css("background-color", "transparent");

				let slidemove = 0 - widthPerPic * slideNum;
				$("ul.slides").css("left", slidemove);

			}



			//setInterval
			function autoPlay() {

				intervalID = setInterval(() => {
					slideNum++
					if (slideNum > lastIndex) slideNum = 0;
					show();
				}, playInterval)

			}
		}
	})



});