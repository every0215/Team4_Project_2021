package com.web.store.report.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class ReportCalculate {

	private Map<Integer, Report> calculate = new LinkedHashMap< >();
	
	public ReportCalculate() {
	}
	
	//計算年度各區業績的合計金額(每項商品的單價*數量的總和)
	public double getAreaTotal(){
		double AreaTotal = 0 ;
		Set<Integer> areaset = calculate.keySet();
		for(int n : areaset){
			Report oib = calculate.get(n);
			double price    = oib.getProductdiscountprice();
			double amount = oib.getSalesamount();
			AreaTotal +=  price * amount;
		}
		return AreaTotal;
	}

}
