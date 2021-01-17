<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>企業登入</title>
<style>
        fieldset{
            border:2px solid rgb(51, 182, 51);
            border-radius: 15px;
            width:500px;
        }
        .d1{
            border-bottom:1px solid gray;
            padding: 10px;
            margin:15px;
        }
        label{
            font-weight: bolder;
        }
      
    
        .sp3{
            color:gray;
            font-size:50%;
        }
    </style>
</head>
<body>
<form action="CompanyLogin" method="post" enctype="multipart/form-data">
<fieldset>
            <legend>企業登入</legend>

            <div class="d1">
            <label for="">帳號:</label>
            <input type="text" name="account" placeholder="請輸入帳號" id="checkn" autocomplete="off">
            <span id="namecheck"></span>
            <br>
<!--             <span class="sp3">(1.不可空白，2.至少兩個字以上，3.必須全部為中文字)</span> -->
            </div>
        
            <div class="d1">
            <label for="">密碼:</label>
            <input type="text" name="password" placeholder="請輸入密碼" id="checkp" autocomplete="off">
            <span id="pwdcheck"></span>
            <br>
<!--             <span class="sp3">(1.不可空白，2.至少6個字且必須包含英文字母、數字、特殊字元[!@#$%^&*])</span> -->
            </div>
            
           
            <div style="text-align: center;">
                <input type="submit" name="enter" value="送出">
                <input type="reset" name="clear" value="清除">
               
            </div>
        </fieldset>
</form>
<script>
//         document.getElementById("checkn").onblur=checkName;
//         document.getElementById("checkp").onblur=checkpwd;
//         document.getElementById("checkd").onblur=checkdate;


        function checkName(){
            let n1 =document.getElementById("checkn");
            let n1Val = n1.value;
            let id =document.getElementById("namecheck");
            let nstr = n1Val.toUpperCase();
            console.log(n1Val.charAt(2))
            for (let i=0;i<n1Val.length;i++){
                if(n1Val==""||n1Val==null){
                    id.innerHTML="<img src='../img/X.png'>不得為空白";
                }else if(n1Val.length<2){
                    id.innerHTML="<img src='../img/X.png'>姓名少於兩個字";
                }else if(nstr.charAt(i)>="A" && nstr.charAt(i)<="Z"){
                    id.innerHTML="<img src='../img/X.png'>請輸入中文";
                    break;
                    
                }else if(n1Val.charAt(i)>=0 && n1Val.charAt(i)<=9){
                    id.innerHTML="<img src='../img/X.png'>請輸入中文";
                    break;
                    
                }else if(n1Val.charAt(i)>="\u4E00" && n1Val.charAt(i)<="\u9FFF"){
                    id.innerHTML="<img src='../img/V.png'>正確"; 
                    break
                }

            }
        }
        function checkpwd(){
            let p1 =document.getElementById("checkp");
            let p1Val = p1.value;
            let id =document.getElementById("pwdcheck");
            let pstr = p1Val.toUpperCase();

            let flag1=false,flag2=false,flag3=false;
            
                if(p1Val==""||p1Val==null){
                    id.innerHTML="<img src='../img/X.png'>不得為空白";
                }else if(p1Val.length<6){
                    id.innerHTML="<img src='../img/X.png'>密碼至少6個字";
                }
                
                for (let i=0;i<=p1Val.length;i++){
                    if(pstr.charAt(i)>="A"&& pstr.charAt(i)<="Z"){
                        flag1=true;
                    }else if(pstr.charAt(i)>="\u0021"&& pstr.charAt(i)<="\u002A"){
                        flag2=true;
                    }else if(pstr.charAt(i)>=0&& pstr.charAt(i)<=9){
                        flag3=true;   
                    }
                }
                if(flag1,flag2,flag3){
                    id.innerHTML="<img src='../img/V.png'>正確"; 
                }

                
                
        }
    </script>
</body>
</html>