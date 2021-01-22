<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>活動修改</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .title {
            text-align: center;
            border-bottom:solid black;
            padding: 10px 0px;
        }

        textarea {
            resize: none;
        }

        #queryBtn {
            margin-left: 20px;
        }

        .controlBar {
            width: 400px;
            margin: auto;
            text-align: center;
        }

        .controlBar button {
            width: 100px;
        }

        #warning {
            text-align: center;
            font-weight: 600;
        }


        #container{
            width:700px;
            border:solid black 1px;
            border-radius:10px
        }

    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"></script>


</head>

<body>


    <div id="container" class="container">
        <h2 class="title">活動修改</h2>


        <form id="campForm" action="${pageContext.request.contextPath}/campaign/update/${camp.id}" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">活動名稱:</label>
                <input type="text" class="form-control need" id="name" name="name" value="${camp.name}" >
            </div>

            <div class="form-group">
                <label >活動類型:</label>
                <select name="type" class="form-select need" aria-label="Default select example ">
                    <option value="0">請選擇</option>
                    <c:if test="${camp.discountParams.type==1}">
                    	<option value="1" selected>折扣</option>
                    	<option value="2">滿額折</option>
                    </c:if>
                    <c:if test="${camp.discountParams.type==2}">
                    	<option value="1">折扣</option>
                    	<option value="2" selected>滿額折</option>
                    </c:if>              
                </select>
            </div>

            <div id="paramField">
				<c:if test="${camp.discountParams.type==1}">
					<div class="offField form-group noShow">
						<label for="comment">折數:</label> 
						<input name="OffParam"
							class="form-control" type="text" placeholder="幾折" value="${camp.discountParams.offParam}"></input>
					</div>
				</c:if>

				<c:if test="${camp.discountParams.type==2}">
					<div class="upToAmmountFiled form-group noShow">
						<label for="comment">滿額:</label> <input name="AmountUpTo"
							class="form-control" type="text" placeholder="滿多少元"></input>
					</div>
					<div class="upToAmmountFiled form-group noShow">
						<label for="comment">折多少:</label> <input name="AmountOffParam"
							class="form-control" type="text" placeholder="折多少元"></input>
					</div>
				</c:if>
            </div>
            
            <div class="form-group">
                <label for="strdate">開始時間:</label>
                <input type="date" name="startDate" id="strDate" class="form-control" value="${camp.startDate}"> 
                <input type="time" name="startTime" class="form-control need" value="${camp.startTime}">

            </div>

            <div class="form-group">
                <label for="usr">結束時間:</label>
                <input type="date"  id="endDate" name="endDate" class="form-control" value="${camp.endDate}"> 
                <input type="time" name="endTime" class="form-control need" value="${camp.endTime}">

            </div>

            <div class="form-check-inline">
                <label class="form-check-label"> 上架狀態:<br>
                
					<c:if test="${camp.launchStatus}">
						<input type="radio" class="form-check-input " name="launchStatus" value="true" checked>上架 
                    	<input type="radio" class="form-check-input" name="launchStatus" value="false" >下架
					</c:if>
					
                    <c:if test="${!camp.launchStatus}">
						<input type="radio" class="form-check-input " name="launchStatus" value="true" >上架 
                    	<input type="radio" class="form-check-input" name="launchStatus" value="false" checked>下架
					</c:if>
                </label>
            </div>

            <div class="form-group">
                <label for="comment">活動描述:</label>
                <input name="description" class="form-control need" type="text" value="${camp.description}"></input>
            </div>

            <div class="form-group">
                <label for="comment">活動內容:</label>
                <textarea name="content" class="form-control need" rows="8">${camp.content}</textarea>
            </div>

            <div class="form-group">
            	<img style="width:300px;height:150px" src="${camp.picturePath}"/><br>
                <label for="fileUpload">活動圖檔:</label>
                <input class="form-control" id="fileUpload" name="picture" type="file">

            </div>

            <div class="controlBar">
                <button id="addCamp" type="submit" class="btn btn-primary">修改</button>
                <button type="reset" class="btn btn-primary">清除</button>
            </div>

            <div id="warning" style="color: red; font-size: 20px"></div>
        </form>

    </div>



    <script>
        $(function () {

   

            $("#addCamp").click(function (event) {
               
               
               
                var isOk = true;//flag

                // 資料驗證區塊------------------------------------------------------------------------------------
                
                //如果資料欄位為空
                $(".need").each(function () {
                    console.log($(this).val())
                    if ($(this).val() == "" || $.trim($(this).val()) == "") {
                        isOk = false;
                    }

                    //如果沒有選擇類型
                    if($("select[name='type'] option").filter(':selected').val()==0){
                        isOk = false;
                    }
                }) 
                // -----------------------------------------------------------------------------------------------
                if (!isOk) {
                    //如果資料驗證不ok
                    event.preventDefault();
                    swal({
                        title:"資料不完整",
                        text:"請您填寫完整的資料",
                        type:"error"
                    })
                } else {
                    swal({
                        title: '確認修改',
                        text: '請您確認活動內容後按確定',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: "取消",
                        confirmButtonText: '确定',
                    }).then(function () {
                        swal(
                            '修改成功!',
                            '請至確認頁面確認',
                            'success'
                        );
                        
                        setTimeout(()=>{$("#campForm").submit()},1000) 
                        
                    })

                    event.preventDefault();

                }
                
            })


            //根據類型的不同顯示不同的欄位
            $("select[name='type']").change(() => {
                var choiceVal = $("select[name='type'] option").filter(':selected').val()

                var paramTemplate = ""; //html模板

                if (choiceVal == 1) {
                    paramTemplate = "<div class='offField form-group '><label for='comment'>折數:</label><input name='offParam' class='form-control need' type='text' placeholder='幾折'></input></div>";
                    $("#paramField").html(paramTemplate);
                } else if (choiceVal == 2) {
                    paramTemplate = '<div class="upToAmmountFiled form-group "><label for="comment">滿額:</label><input name="amountUpTo" class="form-control need" type="text" placeholder="滿多少元"></input></div><div class="upToAmmountFiled form-group"><label for="comment">折多少:</label><input name="amountOffParam" class="form-control need" type="text" placeholder="折多少元"></input></div>';
                    $("#paramField").html(paramTemplate);
                } else {
                    $("#paramField").html("");
                }


            })

            //一鍵新增
            $("#quickBtn").click(()=>{
                var titleField = $("input[name='name']");
                var descriptionField = $("input[name='description']");
                var contentField =  $("textarea[name='content']");

                var titleStr = "咖啡全品項八折優惠";
                var descriptionStr = "即日起咖啡全品項只要八折優惠";
                var contentStr = "2021年來了，大家期盼快走不送的2020年總算走入歷史，2021年或多或少還是會受到武漢肺炎疫情影響，你我的日常生活可能還是得與口罩作伴，但這並無法澆熄你我的咖啡癮。早已悄悄盤據你我生活的 咖啡 ，一整年光是外帶咖啡就有6億杯的基本盤，這數字都可以繞地球1.35圈了，更別說是一整年的咖啡數量了。如果你也是咖啡消耗總量的貢獻者之一，你有沒有算過你單獨在咖啡這個區塊的消費是多少金額呢？當咖啡幾乎是每人每日不可或缺的飲料之一，聰明使用各種優惠，不單省錢，還能多喝幾杯咖啡。2021年，你可以這樣一邊喝咖啡一邊省錢～"
                var type = 1; //1 折扣  2 滿額

                titleField.val(titleStr);
                descriptionField.val(descriptionStr)
                contentField.val(contentStr);
      
                $("select[name='type'] option").eq(type).attr("selected","selected");
                $("select[name='type']").trigger("change");

                if(type==1){
                    $("input[name='offParam']").val(9);
                }
                
            });


            //獲取當前日期
            function setDate () {
                var strDate = document.querySelector("#strDate");
                var endDate = document.querySelector("#endDate");                 
                var today = new Date();
                console.log(today.toISOString());
                today.setDate(today.getDate()+1);
                strDate.value = today.toISOString().substr(0, 10);
                today.setDate(today.getDate()+1);
                endDate.value = today.toISOString().substr(0, 10);
            }

            
        })



    </script>

</body>

</html>