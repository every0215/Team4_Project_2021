$(function() {

	$.ajax({
		url: "/proj/campaign/getIndexCamp",
		success: function(response) {
			var campContainer = $("#campContainer");
			var dotContainer = $("#dotContainer");
			console.log(campContainer);
			campContainer.html("");
			dotContainer.html("");
			for (var i = 0; i < response.length; i++) {
//				$("ul.slides").css("width",response.length*100+"%");
//				$("ul.slides li").css("width","calc(100%/"+response.length+")");
				var pathUrl = response[i].picturePath;
				var campUrl = "";
				var campTepl = `<li><a href='${campUrl}'><img src='${pathUrl}' alt=''></a></li>`;
				var dotTepl = `<li id=${i + 1}></li>`;
				console.log(pathUrl);
				campContainer.append(campTepl);
				dotContainer.append(dotTepl);
			}
			
			
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

				mouseenter: () => { clearInterval(intervalID) },
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