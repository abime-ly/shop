package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.dao1;
import com.Dao.dao2;

public class addtocar extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		int carid = new dao1().GetShopCarId(username);
		String goodsname = request.getParameter("goodsname");
		int num = Integer.parseInt(request.getParameter("num"));
		String sql;
		if(username==null){
			request.getSession().setAttribute("mark", goodsname);
			response.sendRedirect("login.jsp");
		}else{
			//判断购物车中是否已存在该商品
			boolean flag = new dao2().checkexist(goodsname, username);
			if(flag){
				sql = "update shoppingcardetail set gnum=gnum+"+num+" where carid="+carid+" and gname='"+goodsname+"'";
			}
			else{
				sql = "insert into shoppingcardetail(carid,gname,gnum) values("+carid+",'"+goodsname+"',"+num+")";
			}
			System.out.println(sql);
			new dao1().RenewData(sql);
			request.getRequestDispatcher("shopcar").forward(request, response);
		}
	}

}
