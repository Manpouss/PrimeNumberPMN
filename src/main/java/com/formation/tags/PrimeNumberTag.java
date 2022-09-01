package com.formation.tags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PrimeNumberTag extends SimpleTagSupport {
	public void doTag() throws JspException, IOException{
		JspWriter out = getJspContext().getOut();
		ArrayList<Integer> primeList1 = primeList(2,30) ;
		//ArrayList<String> displayPrimeList1 = 
				displayPrimeList(primeList1);
		//boolean test = isStringInteger("s",10);
		
		
		
	}
	
	public void displayPrimeList(ArrayList<Integer> primeList){
		JspWriter out = getJspContext().getOut();
		
		/*ArrayList<String> result = new ArrayList<String>();
		for (Integer prime : primeList) {
			result.add(prime+" est un nombre premier<br>");
        }
		return result;*/
	}
	
	public ArrayList<Integer> primeList( int numberBegin, int numberEnd) {
		ArrayList<Integer> primeNumberList =new ArrayList<Integer>();
		for( int i = numberBegin; i<=numberEnd;){
	         int prime = 1;
	         for(int j = 2; j <=i; j++) {
	            if((i % j) == 0 && j!=i) {
	               prime = 0;
	            }
	         }
	         if (prime != 0){
	        	primeNumberList.add(i);
	            i++;
	         }
	         else
	         i ++;
	      }
		return primeNumberList;
	}
	
	public static boolean isStringInteger(String stringToCheck, int radix) {
        Scanner sc = new Scanner(stringToCheck.trim());
        if(!sc.hasNextInt(radix)) return false;
        sc.nextInt(radix);
        return !sc.hasNext();
    }
}
