package my.shop.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardManager { // 비즈니스 로직만 가지고 있다. 따라서, 서블릿으로 만들어도 된다.
	// DB 연동
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	// 페이지 처리
	private int totalRecCnt; // 전체 레코드 수
	private int recCntInPage=10; // 각 페이지 당 출력 레코드 수
	private int totalPage; // 전체 페이지 수


	public BoardManager() {
		try {
			Context context = new InitialContext();
			// DB CP(Connection Pooling)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("DBCP Lookup err: " + e);
		}
	}

	public void setTotalCnt() {
		int totalPageCnt=0;
		String sql = "select count(*) from shopboard";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs  = pstmt.executeQuery();
			if(rs.next()) {
				totalRecCnt = Integer.parseInt(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("currentGetMaxNum() err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getTotalPageCnt() err: " + e2);
			}
		}
	}
	
	public int getPageCnt() {
		int totalPage = totalRecCnt / recCntInPage;
		if(totalRecCnt % recCntInPage != 0) {
			totalPage++;
		}
		return totalPage;
	}
	
	public boolean checkIp(BoardBean bean) {
		boolean res = false;
		System.out.println(bean.getBip());
		if(bean.getBip().equals("0:0:0:0:0:0:0:1"))
			res = true;
		return res;
	}
	

	public BoardDto getData(String num){ // 해당 자료 상세 보기 
		String sql = "select * from shopboard where num = ?";
		BoardDto dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs  = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setMail(rs.getString("mail"));
				dto.setTitle(rs.getString("title"));
				dto.setCont(rs.getString("cont"));
				dto.setBip(rs.getString("bip"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
			}
		} catch (Exception e) {
			System.out.println("currentGetMaxNum() err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getTotalPageCnt() err: " + e2);
			}
		}
		return dto;
	}
	
	// 댓글용
	public BoardDto getReplyData(String num) {
		String sql = "select * from shopboard where num = ?";
		BoardDto dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs  = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				dto.setTitle(rs.getString("title"));
				dto.setGnum(rs.getInt("gnum"));
				dto.setOnum(rs.getInt("onum"));
				dto.setNested(rs.getInt("nested"));
			
			}
		} catch (Exception e) {
			System.out.println("currentGetMaxNum() err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getTotalPageCnt() err: " + e2);
			}
		}
		return dto;
	}
	public ArrayList<BoardDto> getDataAll(int page, String stype, String sword){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		String sql = "select * from shopboard";
		try {
			conn = ds.getConnection();
			if(sword == null) {
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
			}else {
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			rs  = pstmt.executeQuery();
			
			for(int i=0;i<(page-1) * recCntInPage; i++) {
				rs.next();
			}
			
			int k=0;
			
			while(rs.next() && k++ < recCntInPage) {
				
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
			
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("currentGetMaxNum() err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getTotalPageCnt() err: " + e2);
			}
		}
		
		return list;
	}
	
	public void updateReadCnt(String num) { // 조회수 증가 
		String sql = "update shopboard set readcnt = readcnt+1 where num=?";
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("saveData disconn DB err: " + e2);
			}
		}
	}
	
	public int currentGetMaxNum() {
		String sql = "select nvl(max(num),0) from shopboard";
		int cnt = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs  = pstmt.executeQuery();
			if(rs.next()) {
				cnt = Integer.parseInt(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("currentGetMaxNum() err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("saveData disconn DB err: " + e2);
			}
		}
		return cnt;
	}
		
	public void saveData(BoardBean bean) {
		String sql = "insert into shopboard values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0); // 초기 readcnt = 0
			pstmt.setInt(10, bean.getGnum()); // 
			pstmt.setInt(11, 0);  // onum 0
			pstmt.setInt(12, 0);  // nested 0
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("saveData(BoarderBean bean) err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("saveData disconn DB err: " + e2);
			}
		}
	}
	
	public void editData(BoardBean bean) {
		String sql = "update shopboard set name = ?, mail=?, title=?, cont=? where num = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("getname: "+ bean.getName());
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getMail());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getCont());
			pstmt.setInt(5, bean.getNum());
			
			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void updateOnum(int gnum, int onum) {
		// 같은 그룹의 레코드는 모두 작업에 참여
		// 같은 그룹의 onum값 변경
		String sql = "update shopboard set onum=onum+1 where gnum=? and onum >= ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, gnum);			
			pstmt.setInt(2, onum);		
			
			int re = pstmt.executeUpdate();
			System.out.println("gnum: " + gnum + "\n" + "onum: " + onum + "\n" + "update 결과:" +re);
		} catch (Exception e) {
			System.out.println("updateOnum err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("saveData disconn DB err: " + e2);
			}
		}
	}
	
	public void deleteData(String num) {
		String sql = "delete from shopboard where num = ?";
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
			} catch (Exception e2) {
				// TODO: handle exception
			}
		} 
	}
	public boolean checkPass(int num, String newPass) { // 수정할 경우 비밀번호 확인
		boolean result = false;
		String sql = "select pass from shopboard where num = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				System.out.println(newPass + " " + rs.getString(1));
				if(newPass.equals(rs.getString(1)));
					result = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
			} catch (Exception e2) {
				// TODO: handle exception
			}
		} 
		return result;
	}
	
	public void saveReplyData(BoardBean bean) {
		String sql = "insert into shopboard values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			// replysave.jsp에서 받은 bean의 값들
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0); // 새 글이므로 0
			pstmt.setInt(10, bean.getGnum()); // replysave.jsp에서 세팅된 부모.gnum
			pstmt.setInt(11, bean.getOnum());  // replysave.jsp에서 세팅된 부모.onum + 1
			pstmt.setInt(12, bean.getNested());  // replysave.jsp에서 세팅된 부모.nested + 1
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("saveData(BoarderBean bean) err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("saveData disconn DB err: " + e2);
			}
		}
	}
	
}
