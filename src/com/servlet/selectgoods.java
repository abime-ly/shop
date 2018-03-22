package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao2;
import com.bean.goodsinfo;

public class selectgoods extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String select = new String(request.getParameter("selectinfo").getBytes("iso-8859-1"),"utf-8");
		System.out.println(select);
		ArrayList<goodsinfo> selectinfo1 = new dao2().SelectInfo(select);
		request.setAttribute("select", select);
		request.setAttribute("selectinfo", selectinfo1);
		request.getRequestDispatcher("GoodsListByKey.jsp").forward(request, response);
	}
}
