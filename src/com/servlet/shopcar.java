package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.dao2;
import com.bean.shopcarbean;

public class shopcar extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		ArrayList<shopcarbean> shopcarinfo = new dao2().GetShopCarInfo(username);
		request.setAttribute("shopcarinfo", shopcarinfo);
		request.getRequestDispatcher("shopcar.jsp").forward(request, response);
	}
}
