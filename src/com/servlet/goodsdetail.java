package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao2;
import com.bean.goodscomment;
import com.bean.goodsinfo;

public class goodsdetail extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String goodsname =null;
		if(request.getParameter("goodsname")==null){
			goodsname	= request.getParameter("goodsname2");
		}else{
			goodsname=new String(request.getParameter("goodsname").getBytes("iso-8859-1"),"utf-8");
		}
		goodsinfo goodsdetail = new dao2().goodsdetail(goodsname);
		ArrayList<goodscomment> gcomment = new dao2().GetComment(goodsname);
		float pro = new dao2().CalculateProbility(goodsname);
		request.setAttribute("goodsdetail", goodsdetail);
		request.setAttribute("gcomment", gcomment);
		request.setAttribute("pro", pro*100);
		request.getRequestDispatcher("goodsdetail.jsp").forward(request, response);
	}

}
