package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao1;
import com.bean.orderinfo;

public class manager extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<orderinfo> orderinfo;
		orderinfo = new dao1().GetOrderInfo();
		request.setAttribute("orderinfo", orderinfo);
		response.sendRedirect("manager.jsp");
	}

}
