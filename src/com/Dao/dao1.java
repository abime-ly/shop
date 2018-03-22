package com.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.goodsinfo;
import com.bean.orderinfo;
import com.utils.*;
public class dao1 {
	//用户登录判断
	public boolean LoginCheck(String username,String password){
		String sql = "select count(*) from userinfo where username=? and password =?";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setString(1, username);
			psta.setString(2, password);
			ResultSet rs = psta.executeQuery();
			rs.next();
			if(rs.getInt(1)==0){
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	//管理员登录判断
	public boolean LoginCheck1(String username,String password){
		String sql = "select count(*) from admininfo where name=? and pwd =?";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setString(1, username);
			psta.setString(2, password);
			ResultSet rs = psta.executeQuery();
			rs.next();
			if(rs.getInt(1)==0){
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	
	//更新数据
	public void RenewData(String sql){
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//注册用户名判断
	public boolean UnameCheck(String uname){
		String sql = "select count(*) from userinfo where username='"+uname+"'";
		boolean flag = false;
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			rs.next();
			System.out.println(rs.getInt(1));
			if(rs.getInt(1)==0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//获取购物车编号
	public int GetShopCarId(String uname){
		int shopcarid = 0;
		String sql = "select carid from shoppingcarinfo where username=?";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setString(1, uname);
			ResultSet rs = psta.executeQuery();
			if(rs.next()){
				shopcarid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shopcarid;
	}
	
	
	
	//获取订单信息
	public ArrayList GetOrderInfo(){
		ArrayList<orderinfo> orderinfo = new ArrayList<orderinfo>();
		String sql = "select o.username,o.address,o.phone,o.totalmoney,od.gname,od.gnum from orderlist o inner join orderdetail od on o.orderid=od.orderid";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				orderinfo oi = new orderinfo();
				oi.setUsername(rs.getString(1));
				oi.setAddress(rs.getString(2));
				oi.setPhone(rs.getString("phone"));
				oi.setTotalmoney(rs.getString("totalmoney"));
				oi.setGname(rs.getString("gname"));
				oi.setGnum(rs.getInt("gnum"));
				orderinfo.add(oi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderinfo;
	}
	
	
	//获取上市新品的信息
	public ArrayList GetNewGoodsInfo(){
		ArrayList<goodsinfo> newgoodsinfo = new ArrayList<goodsinfo>() ;
		String sql = "select top 9 gname,martprice,price,stock,img from goodsinfo order by addtime desc";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				goodsinfo gi = new goodsinfo();
				gi.setGname(rs.getString(1));
				gi.setMartprice(rs.getFloat(2));
				gi.setPrice(rs.getFloat(3));
				gi.setStock(rs.getInt(4));
				gi.setImg(rs.getString(5));
				newgoodsinfo.add(gi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newgoodsinfo;
	}
	//获取促销商品信息
	public ArrayList GetCheapGoodsInfo(){
		ArrayList<goodsinfo> cheapgoodsinfo = new ArrayList<goodsinfo>() ;
		String sql = "select top 9 gname,martprice,price,stock,img,acount from goodsinfo where acount<1  order by acount";
		Connection conn = null ;
		try {
			conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				goodsinfo gi = new goodsinfo();
				gi.setGname(rs.getString(1));
				gi.setMartprice(rs.getFloat(2));
				gi.setPrice(rs.getFloat(3));
				gi.setStock(rs.getInt(4));
				gi.setImg(rs.getString(5));
				gi.setAcount(rs.getFloat("acount"));
				cheapgoodsinfo.add(gi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionUtils.closeConnection(conn);
		}
		return cheapgoodsinfo;
	}
	
	public static void main(String[] args) {
		//System.out.println(new dao1().LoginCheck("罗义", "123456"));
		//System.out.println(new dao1().LoginCheck1("admin", "123456"));
		//System.out.println(new dao1().UnameCheck("刘行"));
		System.out.println(new dao1().GetOrderInfo().get(0));
		//System.out.println(new dao1().GetShopCarInfo(new dao1().GetShopCarId("罗义")));
		//System.out.println(new dao1().GetNewGoodsInfo());
		//System.out.println(new dao1().GetCheapGoodsInfo());
	}
}
