package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.goodscomment;
import com.bean.goodsinfo;
import com.bean.reviewinfo;
import com.bean.shopcarbean;
import com.utils.ConnectionUtils;

public class dao2 {
	//���ݹؼ������ӵ���Ʒ
	public ArrayList<goodsinfo> ConnectByKey(String key){
		ArrayList<goodsinfo> keygoods = new ArrayList<goodsinfo>();
		Connection conn;
		String sql = "select * from goodsinfo where keyword like '%"+key+"%'";
		try {
			System.out.println(sql);
			conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			//psta.setString(1, key);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				goodsinfo gi = new goodsinfo();
				gi.setAcount(rs.getFloat("acount"));
				gi.setGname(rs.getString("gname"));
				gi.setPrice(rs.getFloat("price"));
				gi.setImg(rs.getString("img"));
				keygoods.add(gi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return keygoods;
	}
	
	//��ѯ��Ʒ����ϸ��Ϣ
	public goodsinfo goodsdetail(String goodsname){
		goodsinfo goodsdetail = new goodsinfo();
		Connection conn = null;
		String sql = "select * from goodsinfo where gname=?";
		try {
			conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setString(1, goodsname);
			ResultSet rs = psta.executeQuery();
			if(rs.next()){
				goodsdetail.setGname(rs.getString("gname"));
				goodsdetail.setImg(rs.getString("img"));
				goodsdetail.setMartprice(rs.getFloat("martprice"));
				goodsdetail.setPrice(rs.getFloat("price")*rs.getFloat("acount"));
				goodsdetail.setStock(rs.getInt("stock"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodsdetail;
	}
	
	//��ȡ���ﳵ��Ϣ
	public ArrayList<shopcarbean> GetShopCarInfo(String username){
		ArrayList<shopcarbean> shopcarinfo = new ArrayList<shopcarbean>();
		Connection conn;
		int carid = new dao1().GetShopCarId(username);
		String sql = "select * from shoppingcardetail where carid=?";
		try {
			conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setInt(1, carid);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				shopcarbean scb = new shopcarbean();
				scb.setGname(rs.getString("gname"));
				scb.setGnum(rs.getInt("gnum"));
				scb.setImg(new dao2().goodsdetail(rs.getString("gname")).getImg());
				scb.setPrice(new dao2().goodsdetail(rs.getString("gname")).getPrice());
				shopcarinfo.add(scb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shopcarinfo;
	}
	
	//��ȡ������Ϣ
	public ArrayList<goodscomment> GetComment(String goodsname){
		ArrayList<goodscomment> gcomment = new ArrayList<goodscomment>();
		String sql = "select * from reviewinfo where gname=?";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setString(1, goodsname);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				goodscomment gc = new goodscomment();
				gc.setGname(rs.getString("gname"));
				gc.setUsername(rs.getString("username"));
				gc.setInfo(rs.getString("info"));
				gc.setRtime(rs.getString("rtime"));
				gcomment.add(gc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return gcomment;
	}
	//���������
	public float CalculateProbility(String goodsname){
		float pro;
		int total=0;
		int goodcomment=0;
		String sql = "select count(*) from reviewinfo where gname=?";
		String sql1 = "select count(*) from reviewinfo where gname=? and rresult='����'";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			psta.setString(1, goodsname);
			ResultSet rs = psta.executeQuery();
			if(rs.next()){
				total = rs.getInt(1);
			}
			psta.close();
			PreparedStatement psta1 = conn.prepareStatement(sql1);
			psta1.setString(1, goodsname);
			ResultSet rs1 = psta1.executeQuery();
			if(rs1.next()){
				goodcomment = rs1.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(total==0){
			pro = -1;
		}
		else{
			pro = goodcomment/total;
		}
		return pro; 
	}
	//�жϹ��ﳵ���Ƿ��Ѵ��ڸ���Ʒ
	public boolean checkexist(String goodsname,String username){
		boolean flag = false;
		int carid = new dao1().GetShopCarId(username);
		String sql = "select count(*) from shoppingcardetail where carid="+carid+" and gname='"+goodsname+"'";
		try {
			Connection  conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			if(rs.next()){
				if(rs.getInt(1)!=0){
					flag=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	//ģ����ѯ
	public ArrayList<goodsinfo> SelectInfo(String info){
		ArrayList<goodsinfo> getinfo = new ArrayList<goodsinfo>();
		String sql = "select * from goodsinfo where keyword like '%"+info+"%'";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				goodsinfo gi = new goodsinfo();
				gi.setAcount(rs.getFloat("acount"));
				gi.setGname(rs.getString("gname"));
				gi.setImg(rs.getString("img"));
				gi.setMartprice(rs.getFloat("martprice"));
				gi.setPrice(rs.getFloat("price")*rs.getFloat("acount"));
				getinfo.add(gi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getinfo;
	}
	
	//��ȡ������Ϣ
	public ArrayList<reviewinfo> GetReviewInfo(){
		ArrayList<reviewinfo> reviewinfo = new ArrayList<reviewinfo>();
		String sql = "select * from reviewinfo where rresult=null";
		try {
			Connection conn = ConnectionUtils.buildConnection();
			PreparedStatement psta = conn.prepareStatement(sql);
			ResultSet rs = psta.executeQuery();
			while(rs.next()){
				reviewinfo ri = new reviewinfo();
				ri.setGname(rs.getString("gname"));
				ri.setUsername(rs.getString("username"));
				ri.setInfo(rs.getString("info"));
				reviewinfo.add(ri);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviewinfo;
	}
	public static void main(String[] args) {
		//System.out.println(new dao2().goodsdetail("�����").getImg());
		//System.out.println(new dao2().ConnectByKey("�����"));
	//	System.out.println(new dao2().GetShopCarInfo("����").get(2).getImg());
	//	System.out.println(new dao2().SelectInfo("����").get(0).getGname());
		System.out.println(new dao2().GetReviewInfo());
	}
}
