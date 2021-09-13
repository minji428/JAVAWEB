package _04_rentcar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class RentcarDao {
	private RentcarDao() {}
	private static RentcarDao instance = new RentcarDao();
	public static RentcarDao getInstance() {return instance;}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/rentcardb04?serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "alswl3092!";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 아이디랑 패스워드를 입력해서 회원수(?) 반환하기
	public int getMember(String id, String pw) {
		int result = 0;
		
		conn = getConnection();
		
		try {
			String sql = "SELECT COUNT(*) FROM member WHERE id=? and pw1=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result= rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException e) {}
			}
			if(pstmt!=null) {
				try {pstmt.close();}catch(SQLException e) {}
			}
			if(rs!=null) {
				try {rs.close();}catch(SQLException e) {}
			}
		}
		return result;
	}
	
	public Vector<RentcarBean> getSelectCar(){
		Vector<RentcarBean> v = new Vector<RentcarBean>();
		
		try {
			conn = getConnection();
			
			// 내림차순으로 정렬
			String sql = "SELECT * FROM rentcar ORDER BY no DESC";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				RentcarBean bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));;
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
				count++;
				if(count >2)
					break;
			}
		}catch(Exception e) {
			
		}finally {
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
		}
		return v;
	}
	
	// 렌트카 넘버를 넣어서 가져오기
	public RentcarBean getOneCar(int no) {
		RentcarBean bean = new RentcarBean();
		conn = getConnection();
		
		try {
			String sql = "SELECT * FROM rentcar WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));;
				bean.setCompany(rs.getString(6));;
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}			
		}
		return bean;
	}
	
	// 차 예약하기
	public void setReserveCar(CarReserveBean bean) {
		conn = getConnection();
		int num = 0;
		try {
			String numSql = "SELECT MAX(reserve_seq) FROM car_reserve";
			pstmt = conn.prepareStatement(numSql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}
			
			String sql = "INSERT INTO car_reserve (reserve_seq, no, id, qty, d_day, r_day,"
					+ "use_in, use_wifi, use_navi, use_seat)"+" VALUES(?, ?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, bean.getNo());
			pstmt.setString(3, bean.getId());
			pstmt.setInt(4, bean.getQty());
			pstmt.setInt(5, bean.getDday());
			pstmt.setString(6, bean.getRday());
			pstmt.setInt(7, bean.getUsein());
			pstmt.setInt(8, bean.getUsewifi());
			pstmt.setInt(9, bean.getUsenavi());
			pstmt.setInt(10, bean.getUseseat());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}						
		}
	}
	
	// 모든 차량 불러오기
	public Vector<RentcarBean> getAllCar(){
		Vector<RentcarBean> v = new Vector<>();
		
		RentcarBean bean = null;
		
		conn = getConnection();
		try {
			String sql = "SELECT * FROM rentcar";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}						
		}
		return v;
	}
	
	// 차 카테고리 별로 불러오기
	public Vector<RentcarBean> getCategoryCar(int cate) {

		Vector<RentcarBean> v = new Vector<>();
		
		RentcarBean bean = null;

		conn = getConnection();
		try {
			String sql = "SELECT * FROM rentcar WHERE category=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}									
		}
		return v;
	}
	
	public Vector<CarViewBean> getAllReserve(String id) {

		Vector<CarViewBean> v = new Vector<>();
		CarViewBean bean = null;

		conn = getConnection();

		try {
			// 두가지 테이블에서 같은거를 가져올 때 아래와 같은 sql 사용
			// rentcar a2, car_reserve a1에서 a2와 a1은 이름이 너무 길어 임의로 변수를 지정
			// 그냥 rentcar, car_reserve라고만 사용해도 가능
			/*
			 * SELECT * FROM rentcar, car_reserve
			 * WHERE car_reserve.id=? AND CURDATE() < r_day
			 * AND car_reserve.no = rentcar.no;
			 */
			String sql = "select * from rentcar a2  ,car_reserve a1  "
					+ "where a1.id = ? and curdate() < date_format(a1.r_day , '%y-%m-%d')"
					+ " and a1.no = a2.no;";
			System.out.println(id);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new CarViewBean();
				bean.setReserve_seq(rs.getInt(9));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(12));
				bean.setDday(rs.getInt(13));
				bean.setRday(rs.getString(14));
				bean.setUsein(rs.getInt(15));
				bean.setUsewifi(rs.getInt(16));
				bean.setUsenavi(rs.getInt(17));
				bean.setUseseat(rs.getInt(18));		
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}

		return v;
	}

	
	// 자동차 예약 삭제
	public void carRemoveReserve(String id, int reserve_seq) {
		conn = getConnection();
		
		try {
			String sql = "DELETE FROM car_reserve WHERE id=? AND reserve_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, reserve_seq);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}												
		}
	}

}
