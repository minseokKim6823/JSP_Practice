package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectPool {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    // 기본생성자로 생성
    public ConnectPool() {
        try {
            // 커넥션 풀 열기 : JNDI에 lookup으로 찾는 부분
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            // "java:comp/env"은, 현재 애플리케이션이 사용할 수 있는 모든 자원이 위치한 곳
            DataSource ds = (DataSource) ctx.lookup("jdbc_maria");
            // "jdbc_maria"는 위 설정을 통해 만들어낸 커넥션풀 자원명

            // 찾은 커넥션 풀을 통해 커넥션 얻기
            conn = ds.getConnection();

            System.out.println("DB 커넥션 풀 연결 성공");
        } catch (Exception e) {
            System.out.println("DB 커넥션 풀 연결 실패");
            e.printStackTrace();
        }

    }

    // close()메서드
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (conn != null) conn.close();

            System.out.println("DB 커넥션 풀 자원 해지 성공");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}