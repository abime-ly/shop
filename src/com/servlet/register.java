package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.nio.cs.HistoricallyNamedCharset;

import com.Dao.dao1;

public class register extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("uname");
		String password = request.getParameter("psw1");
		String pwdquestion = request.getParameter("pswquestion");
		String pwdanswer = request.getParameter("answer");
		String sex = request.getParameter("sex");
		String card = request.getParameter("cardcode");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String regtime = request.getParameter("regtime");
		boolean flag = new dao1().UnameCheck(username);
		if(flag){
			String sql = "insert into userinfo(username,password,pwdquestion,pwdanswer,sex,card,email,address,regtime)" +
					" values('"+username+"','"+password+"','"+pwdquestion+"','"+pwdanswer+"','"+sex+"','"+card+"','"+email+"','"+address+"','"+regtime+"')";
			String sql1 = "insert into shoppingcarinfo(username) values('"+username+"')";
			new dao1().RenewData(sql);
			new dao1().RenewData(sql1);
			request.setAttribute("success", "您好，恭喜您注册成功");
			request.getSession().setAttribute("username", username);
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}
		else{
			String error = "该用户名已存在";
			request.setAttribute("error", error);
			request.setAttribute("uname", username);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}	
}
