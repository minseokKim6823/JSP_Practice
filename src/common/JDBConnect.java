package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
    public Connection con;          // DB 연결용
    public Statement stmt;          // 쿼리 날리는 용
    public PreparedStatement psmt;  // 쿼리 날리는 용2
    public ResultSet rs;            // 쿼리 결과셋 받는 용

    // 기본 생성자: 하드코딩된 값 사용
    public JDBConnect() {
        this("jdbc:mariadb://localhost:3306/JSP", "root", "1234");
    }

    // 오버로딩된 생성자: 매개변수 사용
    public JDBConnect(String url, String dbId, String dbPwd) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(url, dbId, dbPwd);
            System.out.println("DB 연결 성공(오버로딩된 생성자)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 리소스를 안전하게 닫기 위한 메서드
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
            System.out.println("JDBC 자원 해제");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
