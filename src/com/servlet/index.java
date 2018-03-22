package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao1;
import com.bean.goodsinfo;

public class index extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<goodsinfo> newgoodsinfo = new dao1().GetNewGoodsInfo();
		ArrayList<goodsinfo> cheapgoodsinfo = new dao1().GetCheapGoodsInfo();
		request.setAttribute("newgoodsinfo", newgoodsinfo);
		request.setAttribute("cheapgoodsinfo", cheapgoodsinfo);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
