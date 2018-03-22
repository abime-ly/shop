package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao2;
import com.bean.goodsinfo;

public class connection extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String key = new String(request.getParameter("key").getBytes("iso-8859-1"),"utf-8");
		ArrayList<goodsinfo> keygoods = new dao2().ConnectByKey(key);
		request.setAttribute("selectinfo", keygoods);
		request.getRequestDispatcher("GoodsListByKey.jsp").forward(request, response);
	}
}
