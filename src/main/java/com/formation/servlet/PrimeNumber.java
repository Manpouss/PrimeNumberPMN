package com.formation.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formation.tags.PrimeNumberTag;

/**
 * Servlet implementation class PrimeNumber
 */
@WebServlet("/PrimeNumber")
public class PrimeNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrimeNumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrimeNumberTag pnt = new PrimeNumberTag();

		ArrayList<Integer> primeList = pnt.primeList(2, 30);
		ArrayList<Integer> primeList1 = new ArrayList<Integer>();
		ArrayList<Integer> primeList2 = new ArrayList<Integer>();
		String testedNumber = request.getParameter("testedNumber");
		boolean isPrime = false, message_error = false, message_errort = false;
		String firstNumber = request.getParameter("firstNumber");
		String secondNumber = request.getParameter("secondNumber");
		
		
		if(request.getParameter("bsubmitT")!=null ) {
			if(pnt.isStringInteger(testedNumber, 10) == true) {
				primeList1 = pnt.primeList(Integer.parseInt(testedNumber), Integer.parseInt(testedNumber));
				if(primeList1.size() != 0) {
					isPrime = true;
				}
			}else {
				message_errort = true;
			}
		}
		else if(request.getParameter("bsubmitL")!=null ) {
			if(firstNumber!=null && secondNumber!= null && 
			   pnt.isStringInteger(firstNumber, 10) == true && pnt.isStringInteger(secondNumber, 10) == true &&
				Integer.parseInt(firstNumber) <= Integer.parseInt(secondNumber)) {
				primeList2 = pnt.primeList(Integer.parseInt(firstNumber), Integer.parseInt(secondNumber));
			}else {
				message_error = true;
			}
		}
		
		request.setAttribute("firstNumber", firstNumber);
		request.setAttribute("secondNumber", secondNumber);
		request.setAttribute("testedNumber", testedNumber);
		request.setAttribute("primeList", primeList);
		request.setAttribute("primeList2", primeList2);
		request.setAttribute("isPrime", isPrime);
		request.setAttribute("message_error", message_error);
		request.setAttribute("message_errort", message_errort);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/primeNumber.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
