$(function(){	
		console.log("hi");
	//範本
// 		$("#ReporyQueryAllData").click(function(){
// 			console.log("123123");
// 			$.ajax({
// 			    url: "/proj/ReporyQueryAllData",
// 			    type: 'GET',
// 				dataType: "json",
// 			    success: function(datas){
// // 			    	setBarChartData('產品價格表1',datas);
// // 			    	setDataTableHeader(['產品名稱','產僅價格','分店']);
// // 			    	setDataTableData(datas);
// 					setDataTable(datas);
// 					console.log(datas);
// 		   	    }
// 		    });
// 		});

// Tab1-年度各區業績
		$("#queryAreaSales").ready(function(){
	console.log("queryAreaSales");
	$.ajax({
	    url: "/proj/queryAreaSales",
	    type: 'GET',
		dataType: "json",
	    success: function(rep1){
			setDataTable1(rep1);
   	    }
    });
});	

		$("#queryAreaSales").click(function(){
	console.log("queryAreaSales");
	$.ajax({
	    url: "/proj/queryAreaSales",
	    type: 'GET',
		dataType: "json",
	    success: function(rep1){
			setDataTable1(rep1);
	    	console.log(rep1);
   	    }
    });
});	
	
// Tab2-年度品類銷售
				$("#queryProdustClass").click(function(){
			console.log("queryProdustClass");
			$.ajax({
			    url: "/proj/queryProdustClass",
			    type: 'GET',
				dataType: "json",
			    success: function(rep2){
					setDataTable2(rep2);
			    	console.log(rep2);
		   	    }
		    });
		});
		
// Tab3-年度活動銷售
			$("#queryActiveSales").click(function(){
			console.log("queryActiveSales");
			$.ajax({
			    url: "/proj/queryActiveSales",
			    type: 'GET',
				dataType: "json",
			    success: function(rep3){
					setDataTable3(rep3);
			    	console.log(rep3);
		   	    }
		    });
		});
		
// Tab4-各店年度業績/折扣/會員數
			$("#queryAllStoreSales").click(function(){
			console.log("queryAllStoreSales");
			$.ajax({
			    url: "/proj/queryAllStoreSales",
			    type: 'GET',
				dataType: "json",
			    success: function(rep4){
					setDataTable4(rep4);
			    	console.log(rep4);
		   	    }
		    });
		});		
		
			// Tab5-各店活動業績
			$("#queryAllActiveSales").click(function(){
			console.log("queryAllActiveSales");
			$.ajax({
			    url: "/proj/queryAllActiveSales",
			    type: 'GET',
				dataType: "json",
			    success: function(rep5){
					setDataTable5(rep5);
			    	console.log(rep5);
		   	    }
		    });
		});	

			// Tab6-各店付款方式
			$("#queryAllStorePayment").click(function(){
			console.log("queryAllStorePayment");
			$.ajax({
			    url: "/proj/queryAllStorePayment",
			    type: 'GET',
				dataType: "json",
			    success: function(rep6){
					setDataTable6(rep6);
			    	console.log(rep6);
		   	    }
		    });
		});	
			
			// Tab7-各店無庫存項數
			$("#queryAllStoreStock").click(function(){
			console.log("queryAllStoreStock");
			$.ajax({
			    url: "/proj/queryAllStoreStock",
			    type: 'GET',
				dataType: "json",
			    success: function(rep7){
					setDataTable7(rep7);
			    	console.log(rep7);
		   	    }
		    });
		});
			
	});
	
	//顏色表1(10種)
	let coloarArr1 = [
	'rgba(229,181,28, 0.8)',
	'rgba(18,76,154, 0.8)',
	'rgba(15,176,255, 0.8)',
	'rgba(0,244,188,0.8)',
	'rgba(51,176,204,0.8)',	
	'rgba(157,200,200,0.8)',	
	'rgba(88,201,185,0.8)',	
	'rgba(81,157,158,0.8)',	
	'rgba(209,182,225,0.8)',	
	'rgba(144,85,162,0.8)',	
	]
	let coloarArr2 = [
	'rgba(249,65,68,0.8)',
	'rgba(243,114,44,0.8)',
	'rgba(248,150,30,0.8)',
	'rgba(249,132,74,0.8)',
	'rgba(249,199,79,0.8)',	
	'rgba(144,190,109,0.8)',	
	'rgba(67,170,139,0.8)',	
	'rgba(77,144,142,0.8)',	
	'rgba(87,117,144,0.8)',	
	'rgba(39,125,161,0.8)',	
		]
	let coloarArr3 = []
 	//顏色表隨機
	function rand(){
		return Math.floor(Math.random()*200)+50;
	}
 	
	//範本
 	function setDataTable(ting123){
 		
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>title1</th>
				<th>title2</th>
				<th>title2</th>
				<th>title2</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		for(const data of ting123){
			str+="<tr>"+
				"<td>"+data.activeitem+"</td>"+
				"<td>"+data.companyid+"</td>"+
				"<td>"+data.payment+"</td>"+
				"<td>"+data.storearea+"</td>"+
			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
 	}
 	
	//Tab1-年度各區業績(明細)
 	function setDataTable1(datas){
 		
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>地區</th>
				<th>地區總業績</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		for(const data of datas){
			console.log(data);
			str+="<tr>"+
				"<td>"+data[0]+"</td>"+
				"<td>"+data[1]+"</td>"+

			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
		
	 	//Tab1-年度各區業績(圖)	
			$("#rep_tab_2").html('<canvas id="myChart_2" width="200px" height="50%"></canvas>');
	 	console.log(datas,$("#rep_tab_2").html());
	 	
	new Chart(document.getElementById('myChart_2'), {
		type : 'doughnut',
		data : {
			labels : datas.map(function(d){
					return d[0]
			}),
			datasets : [ {
				
				backgroundColor : coloarArr1,
				borderWidth : 1,
				label : '地區總業績',
				data : datas.map(function(d){
					return d[1]
				}),
			}]
		}
	});
 	}
 	
 	//Tab2-年度品類銷售(明細)
 	function setDataTable2(datas){
 		
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>品類</th>
				<th>品類銷售數量</th>
				<th>品類總業績</th>
				<th>品類總折扣金額</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		for(const data of datas){
			console.log(data);
			str+="<tr>"+
				"<td>"+data[0]+"</td>"+
				"<td>"+data[1]+"</td>"+
				"<td>"+data[2]+"</td>"+
				"<td>"+data[3]+"</td>"+
			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
		
	 	//Tab2-年度品類銷售(圖)	
			$("#rep_tab_2").html('<canvas id="myChart_2" width="200px" height="50%"></canvas>');
	 	console.log(datas,$("#rep_tab_2").html());
	 	
	new Chart(document.getElementById('myChart_2'), {
		type : 'bar',
		data : {
			labels : datas.map(function(d){
					return d[0]
			}),
			datasets : [ {
				
				backgroundColor : coloarArr1,
				borderWidth : 1,
				label : '品類總業績',
				data : datas.map(function(d){
					return d[2]
				}),
			},{
						
				backgroundColor : coloarArr3,
				borderWidth : 1,
				label : '品類總折扣金額',
				data : datas.map(function(d){
					return d[3]
				}),
			}]
		},
		options: {
	        scales: {
	            xAxes: [{
	                stacked: true
	            }],
	            yAxes: [{
	                stacked: true
	            }]
	        }
	    }
	});
 	}
 	
 // Tab3-年度活動銷售(明細)
 	function setDataTable3(datas){
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>活動名稱</th>
				<th>活動銷售數量</th>
				<th>活動總業績</th>
				<th>活動總折扣金額</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		for(const data of datas){
			console.log(data);
			str+="<tr>"+
				"<td>"+data[0]+"</td>"+
				"<td>"+data[1]+"</td>"+
				"<td>"+data[2]+"</td>"+
				"<td>"+data[3]+"</td>"+
			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
		
		// Tab3-年度活動銷售(圖)	
			$("#rep_tab_2").html('<canvas id="myChart_3" width="200px" height="50%"></canvas>');
	 	console.log(datas,$("#rep_tab_2").html());
	 	
	new Chart(document.getElementById('myChart_3'), {
		type : 'bar',
		data : {
			labels : datas.map(function(d){
					return d[0]
			}),
			datasets : [ {
				
				backgroundColor : coloarArr1,
				borderWidth : 1,
				label : '活動總業績',
				data : datas.map(function(d){
					return d[2]
				}),
			},{
						
				backgroundColor : coloarArr2,
				borderWidth : 1,
				label : '活動總折扣金額',
				data : datas.map(function(d){
					return d[3]
				}),
			}]
		},
	options: {
        scales: {
            xAxes: [{
                stacked: true
            }],
            yAxes: [{
                stacked: true
            }]
        }
    }	
	});
 	}

 	 // Tab4-各店年度業績/折扣(明細)
 	function setDataTable4(datas){
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>門市地區</th>
				<th>門市名稱</th>
				<th>總業績</th>
				<th>總折扣金額</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		for(const data of datas){
			console.log(data);
			str+="<tr>"+
				"<td>"+data[0]+"</td>"+
				"<td>"+data[1]+"</td>"+
				"<td>"+data[2]+"</td>"+
				"<td>"+data[3]+"</td>"+
			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
		
		// Tab4-各店年度業績/折扣(圖)	
			$("#rep_tab_2").html('<canvas id="myChart_4" width="200px" height="50%"></canvas>');
	 	console.log(datas,$("#rep_tab_2").html());
	 	
	new Chart(document.getElementById('myChart_4'), {
		type : 'bar',
		data : {
			labels : datas.map(function(d){
					return d[1]
			}),
			datasets : [ {
				
				backgroundColor : coloarArr1,
				borderWidth : 1,
				label : '總業績',
				data : datas.map(function(d){
					return d[2]
				}),
			},{
						
				backgroundColor :coloarArr3,
				borderWidth : 1,
				label : '總折扣金額',
				data : datas.map(function(d){
					return d[3]
				}),
			}]
		},
	options: {
        scales: {
            xAxes: [{
                stacked: true
            }],
            yAxes: [{
                stacked: true
            }]
        }
    }	
	});
 	}		 
 	
 	 // Tab5-各店活動業績(明細)
 	function setDataTable5(datas){
		
		// Tab5-各店活動業績(圖)	
		let campaignDict = {}
		let campaignList = [];
		for(const data of datas){
			campaignDict[data[1]] = 1;
			campaignList.push(data[1]);
		}
		campaignNameHtml = Object.keys(campaignDict).map(function(campaignName, i){
			return '<input type="checkbox" id="checkbox_'+i+'" name="checkboxCampaignName" value="'+campaignName+'" checked>'
					+'<label for="checkboxname_'+i+'">'+campaignName+'</label><br>';
		}).join('');
		
		$("#rep_tab_2").html(campaignNameHtml+'<br><div id="myChart_5"></div>');
	 	
	 	
		function drawChart5(){
			console.log('所有的資料是這樣',datas);
			console.log('選了的活動是這樣',Object.keys(campaignDict));
			
			let filteredDatas = datas.filter(function(data){
				if(campaignList.indexOf(data[1]) != -1){
					return true;
				}else{
					return false;
				}
			});
			console.log('被過濾後的資料',filteredDatas);
			let str = `<thead class='rep_table_font'>
					<tr>
					<th>門市名稱</th>
					<th>活動名稱</th>
					<th>活動銷售數量</th>
					<th>活動總業績</th>
					<th>活動總折扣金額</th>
				</tr>
				</thead>
				<tbody class="rep_table_font">
			`;
			for(const data of filteredDatas){
				str+="<tr>"+
					"<td>"+data[0]+"</td>"+
					"<td>"+data[1]+"</td>"+
					"<td>"+data[2]+"</td>"+
					"<td>"+data[3]+"</td>"+
					"<td>"+data[4]+"</td>"+
				"</tr>";
			}
			str += "</tbody>";
			$("#rep_table").html(str);
			
			$("#myChart_5").html('<canvas width="200px" height="50%"></canvas>')
			new Chart($('#myChart_5 > canvas'), {
				type : 'bar',
				data : {
					
					labels : filteredDatas.map(function(d){
							return d[0]+d[1]
					}),
					datasets : [ {
						backgroundColor :filteredDatas.map(function(d){
							return 'rgba('+rand()+','+rand()+','+rand()+',0.8)';
						}),
						borderWidth : 1,
						label : '總業績',
						data : filteredDatas.map(function(d){
							return d[3]
						}),
					},{
						backgroundColor :coloarArr3,
						borderWidth : 1,
						label : '總折扣金額',
						data : filteredDatas.map(function(d){
							return d[4]
						}),
					}]
				},
				options: {
			        scales: {
			            xAxes: [{
			                stacked: true
			            }],
			            yAxes: [{
			                stacked: true
			            }]
			        }
			    }	
			});
		}
		
		$("input[name='checkboxCampaignName']").click(function(){
	 		campaignList = [];
			$("input[name='checkboxCampaignName']:checked").each(function(i,element){
				campaignList.push($(element).val());
			});
			drawChart5();
		});
		drawChart5();
	 }
	
 // Tab6-各店付款方式(明細)
 	function setDataTable6(datas){
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>門市名稱</th>
				<th>付款方式</th>
				<th>銷售數量</th>
				<th>總業績</th>
				<th>總折扣金額</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		for(const data of datas){
			console.log(data);
			str+="<tr>"+
				"<td>"+data[0]+"</td>"+
				"<td>"+data[1]+"</td>"+
				"<td>"+data[2]+"</td>"+
				"<td>"+data[3]+"</td>"+
				"<td>"+data[4]+"</td>"+
			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
		
		// Tab6-各店付款方式(圖)	
			$("#rep_tab_2").html('<canvas id="myChart_6" width="200px" height="50%"></canvas>');
	 	console.log(datas,$("#rep_tab_2").html());
	 	
		new Chart(document.getElementById('myChart_6'), {
			type : 'bar',
			data : {
				labels : datas.map(function(d){
						return d[0]+d[1]
				}),
				datasets : [ {
					
					backgroundColor :datas.map(function(d){
						return 'rgba('+rand()+','+rand()+','+rand()+',0.8)';
					}),
 						
					borderWidth : 1,
					label : '總業績',
					data : datas.map(function(d){
						return d[3]
					}),
				},{
							
					backgroundColor :coloarArr3,
					borderWidth : 1,
					label : '總折扣金額',
					data : datas.map(function(d){
						return d[4]
					}),
				}]
			},
		options: {
	        scales: {
	            xAxes: [{
	                stacked: true
	            }],
	            yAxes: [{
	                stacked: true
	            }]
	        }
	    }	
		});
	 	}	
 	
 // Tab7-各店無庫存項數(明細)
 	function setDataTable7(datas){
 		let str = `<thead class='rep_table_font'>
				<tr>
				<th>門市名稱</th>
				<th>庫存數</th>
			</tr>
			</thead>
			<tbody class="rep_table_font">
		`;
		
		for(const data of datas){
			str+="<tr>"+
				"<td>"+data[0]+"</td>"+
				"<td>"+data[1]+"</td>"+
			"</tr>";	
		}
		str += "</tbody>";
		$("#rep_table").html(str);
		
		// Tab7-各店無庫存項數(圖)	
			$("#rep_tab_2").html('<canvas id="myChart_7" width="200px" height="50%"></canvas>');
	 	console.log(datas,$("#rep_tab_2").html());
	 	
		new Chart(document.getElementById('myChart_7'), {
			type : 'bar',
			data : {
				labels : datas.map(function(d){
						return d[0]
				}),
				datasets :  [{
					backgroundColor :coloarArr1,
					borderWidth : 1,
					label : '總業績',
					data : datas.map(function(d){
						return d[1]
					}),
				}]
			},
    		options: {
      			scales: {
            	yAxes: [{
	            ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }	
		});
	 	}	
	 	
	 	
	 	//範本
	 	/*function rand(){
//  			return arr[Math.floor(Math.random()*arr.length)];
//  			//return Math.floor(Math.random()*200)+50;
//  		}*/
// //  		function setPieChartData(datas){
// //  			// OOXX
// //  		}
// // 		function setBarChartData(title,datas){
// //  			coloarArr.sort(function(){ return Math.random() - 0.5;});
// // 			datas = datas.filter(function(d,idx){
// 				return idx < 5;
// // 				return d.productprice > 1500;
// 			});				
// 			$("#chart_container").html('<canvas id="myChart" width="200px" height="50%"></canvas>');
// 			new Chart(document.getElementById('myChart'), {
// 				type : 'bar',
// 				data : {
// 					labels : datas.map(function(d){
// 						return d.productname;
// 						console.log(d.productname)
// 					}),
// 					datasets : [ {
// 						backgroundColor : coloarArr,
// 							/*datas.map(function(d){
// 							console.log(rand());
// 							return rand();
// 							//let rand1 = rand();
// 							//let rand2 = 255-rand1;
// 							//return 'rgba('+rand1+','+rand2+','+rand()+',1)';
// 						})*/
// // 						borderColor : [ 'rgba(255,99,132,1)',
// // 								'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
// // 								'rgba(75, 192, 192, 1)' ],
// 						borderWidth : 1,
// 						label : title,//'銷售業績(百萬)',
// 						data : datas.map(function(d){
// 							return d.productprice
// 						}),
// 					} ]
// 				}
// 			})
// 		} 