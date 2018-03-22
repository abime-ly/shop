package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.dao2;
import com.bean.reviewinfo;

public class managereview extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	ArrayList<reviewinfo> reviewinfo = new dao2().GetReviewInfo();
	request.setAttribute("reviewinfo", reviewinfo);
	request.getRequestDispatcher("managereviewinfo.jsp").forward(request, response);
	}

}
