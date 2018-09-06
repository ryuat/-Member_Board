package my.shop.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	
	public MemberManager() {
		try {
			Context context = new InitialContext();
			// DB CP(Connection Pooling)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("DBCP Lookup err: " + e);
		}
	}
	
	public ArrayList<ZipcodeBean> getZip(String area3){
		ArrayList<ZipcodeBean> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from ziptab where area3 like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, area3 +"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				System.out.println(rs.getString(4));
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				bean.setArea4(rs.getString(5));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getZip() err: " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getZip() finally err: " + e2);
			}
		}
		return list;
	}
	
	public boolean checkId(String id) {
		boolean result = false;
		try {
			String sql = "select id from member where id = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = true;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getZip() finally err: " + e2);
			}
		}
		
		return result;
	}
	
	public boolean memInsert(MemberBean bean) {
		boolean result = false;
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());
			pstmt.setString(8, bean.getJob());
			
			result = pstmt.executeUpdate() > 0 ? true:false; 
		} catch (Exception e) {
			System.out.println("memInsert() err: " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("memInsert() finally err: " + e2);
			}
		}
		return result;
	}
}
