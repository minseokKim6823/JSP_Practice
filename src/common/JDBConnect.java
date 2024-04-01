package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
    public Connection con;          // DB 연결용
    public Statement stmt;           //  쿼리 날리는 용
    public PreparedStatement psmt;   // 쿼리 날리는 용2
    public ResultSet rs;             // 쿼리 결과셋 받는 용

    // 1. 기본생성자로 연결 : 값이 박혀있기 때문에 값이 달라질경우 다 수정 필요
    public JDBConnect() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/maria";
            String dbId = "root";
            String dbPwd = "1234";
            con = DriverManager.getConnection(url, dbId,dbPwd);    //   DriverManager는 db뿐만 아니라 모든 파일에 대해 연결 가능
            System.out.println("DB 연결 성공 : 기본 생성자");
        } catch(Exception e) {
            e.printStackTrace();
        }

    }

    // 2. 사용자 생성자 이용 1 : 메서드를 호출할 때 값을 다 이용해서 연결하는 방식
    public JDBConnect(String driver, String url, String dbId, String dbPwd) {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, dbId,dbPwd);
            System.out.println("DB 연결 성공 : 사용자 정의 생성자1");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 3. 사용자 생성자 이용 2 : 서블릿 컨텍스트 이용 방법 (web.xml 정보 이용) 필드에서 가장 많이 씀
    // 다만, 여러 DB를 사용하는 경우 DBtype 등의 인자를 하나 더 받아서 구분해서 동적으로 사용할 수 있도록 하기도 함.
    public JDBConnect(ServletContext application) {
        try {
            String driver = application.getInitParameter("Driver");
            Class.forName(driver);
            String url = application.getInitParameter("URL");
            String dbId = application.getInitParameter("dbId");
            String dbPwd = application.getInitParameter("dbPwd");
            con = DriverManager.getConnection(url, dbId, dbPwd);
            System.out.println("DB 연결 성공 : 사용자 정의 생성자2");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    // 연결 다한 후 종료하는 메서드
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
            System.out.println("JDBC 연결 자원 해지 성공");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}