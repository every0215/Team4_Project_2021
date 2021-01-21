

                    function checkDateTime(x,y){
                        let theDateObj=document.getElementById(x);
                        let theDateObjVal=theDateObj.value;
                        
                        let span1=document.getElementById(y);
                        
                        let isDateFormateLegal = moment(theDateObjVal, 'YYYY-MM-DD HH:mm:ss', true).isValid()
                        if (isDateFormateLegal) {
                            span1.className="correctsp";
                            span1.innerHTML="日期時間格式輸入正確";
                            return
                        }
                        span1.className="checksp";
                        span1.innerHTML="日期時間格式輸入錯誤";

                    }


                   function checkDate(x,y){
                       let theDateObj=document.getElementById(x);
                       let theDateObjVal=theDateObj.value;
                       
                       let span1=document.getElementById(y);
                  
                        let isDateFormateLegal = moment(theDateObjVal, 'YYYY-MM-DD', true).isValid()
                        if (isDateFormateLegal) {
                            span1.className="correctsp";
                            span1.innerHTML="日期時間格式輸入正確";
                            return
                        }
                        span1.className="checksp";
                        span1.innerHTML="日期時間格式輸入錯誤";

                   }



