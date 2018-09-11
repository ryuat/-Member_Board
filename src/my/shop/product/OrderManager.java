package my.shop.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import my.shop.member.MemberBean;

public class OrderManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	
	public OrderManager() {
		try {
			Context context = new InitialContext();
			// DB CP(Connection Pooling)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("DBCP Lookup err: " + e);
		}
	}
	
	public void insertOrder(OrderBean order) {
		try {
	
			conn = ds.getConnection();
			String sql = "insert into shop_order(product_no, quantity, sdate, state, id) values(?,?,now(),?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getProduct_no());
			pstmt.setString(2, order.getQuantity());
			pstmt.setString(3, "1");
			pstmt.setString(4, order.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertOrder() err " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("insertOrder() finally err: " + e2);
			}
		}
	}
	public  ArrayList<OrderBean>  getOrder(String id) {
		ArrayList<OrderBean> list = new ArrayList<>();
		try {

			conn = ds.getConnection();
			String sql = "select * from shop_order where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderBean bean = new OrderBean();
				bean.setNo(rs.getString("no"));
				bean.setProduct_no(rs.getString("product_no"));
				bean.setQuantity(rs.getString("quantity"));
				bean.setSdate(rs.getString("sdate"));
				bean.setState(rs.getString("state"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getOrder() err " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getOrder() finally err: " + e2);
			}
		}
		return list;
	}
	
	public  ArrayList<OrderBean>  getOrderAll() {
		ArrayList<OrderBean> list = new ArrayList<>();
		try {

			conn = ds.getConnection();
			String sql = "select * from shop_order";
			
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderBean bean = new OrderBean();
				bean.setNo(rs.getString("no"));
				bean.setProduct_no(rs.getString("product_no"));
				bean.setQuantity(rs.getString("quantity"));
				bean.setSdate(rs.getString("sdate"));
				bean.setState(rs.getString("state"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getOrder() err " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getOrder() finally err: " + e2);
			}
		}
		return list;
	}
	

	public  OrderBean getOrderDetail(String no) {
		OrderBean bean = null;
		try {
			
			conn = ds.getConnection();
			String sql = "select * from shop_order where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new OrderBean();
				bean.setNo(rs.getString("no"));
				bean.setProduct_no(rs.getString("product_no"));
				bean.setQuantity(rs.getString("quantity"));
				bean.setSdate(rs.getString("sdate"));
				bean.setState(rs.getString("state"));
				bean.setId(rs.getString("id"));
			}
		} catch (Exception e) {
			System.out.println("getOrderDetail() err " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getOrderDetail() finally err: " + e2);
			}
		}
		return bean;
	}
	
	public boolean updateState(String no, String state) {
		boolean result = false;
		try {
			conn = ds.getConnection();
			String sql = "update shop_order set state=? where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, no);
			
			result = pstmt.executeUpdate() > 0 ? true:false;
		} catch (Exception e) {
			System.out.println("updateState() err " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("updateState() finally err: " + e2);
			}
		}
		return result;
	}

}
