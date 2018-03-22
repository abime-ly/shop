package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.dao1;

public class login extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("name");
		String password = request.getParameter("psw");
		String logintype = request.getParameter("logintype");
		if(logintype.equals("客户登录")){
			boolean flag = new dao1().LoginCheck(username, password);
			if(flag){	
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				if(session.getAttribute("mark")!=null){
					System.out.println("goodsdetail?goodsname="+session.getAttribute("mark"));
				//	response.sendRedirect("goodsdetail?goodsname="+session.getAttribute("mark"));
					request.getRequestDispatcher("goodsdetail?goodsname2="+session.getAttribute("mark")).forward(request, response);
				}else{
					response.sendRedirect("index");
				}
			}else{
				request.setAttribute("error", "用户名与密码不匹配");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		else{
			boolean flag = new dao1().LoginCheck1(username, password);
			if(flag){	
				HttpSession session = request.getSession();
				session.setAttribute("managername", username);
				request.getRequestDispatcher("manager").forward(request, response);
			}else{
				request.setAttribute("error", "用户名与密码不匹配");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}

}
