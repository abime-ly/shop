package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao1;

public class delete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = (String) request.getSession().getAttribute("username");
		String goodsname = new String(request.getParameter("goodsname").getBytes("iso-8859-1"),"utf-8");
		int carid = new dao1().GetShopCarId(username);
		String sql = "delete from shoppingcardetail where carid="+carid+" and gname='"+goodsname+"'";
		System.out.println(sql);
		new dao1().RenewData(sql);
		request.getRequestDispatcher("shopcar").forward(request, response);
	}
}
