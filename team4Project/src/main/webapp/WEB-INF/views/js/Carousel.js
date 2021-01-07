$(function(){

    let slideNum=0;
    let slideCount=$(".slides li").length;
    let lastIndex=slideCount-1;
    let intervalID;
    let widthPerPic=1500; //一張圖片寬度
    let playInterval=5000; //輪播間隔 毫秒

    show();
    autoPlay();
      

     $(".dot li").eq(0).css("background-color","#fff");
     $(".dot li").mouseenter(function(){
         slideNum = $(this).index(); 
        show();
     })

     $("#prevSlide").click(function(){

        slideNum--;
        if(slideNum<0) slideNum=lastIndex;
        show();

     })

     $("#nextSlide").click(function(){

        slideNum++;
        if(slideNum>lastIndex) slideNum= 0;
        show();

     })

     $(".thumberNailBar li").click(function(){

        slideNum = $(this).index();
        show();

     });


    $(".wrapper li").on({

        mouseenter:()=>{clearInterval(intervalID)},
        mouseleave:autoPlay,

    })

    
    //滑動圖片
    function show(){

        $(".dot li").eq(slideNum).css("background-color","white")
        .siblings().css("background-color","transparent");

        let slidemove = 0-widthPerPic*slideNum;
        $("ul.slides").css("left",slidemove);

    }



    //setInterval
    function autoPlay(){

        intervalID  = setInterval(()=>{
        slideNum++
        if(slideNum>lastIndex) slideNum= 0;
        show();
        },playInterval)  

    }
                       
});