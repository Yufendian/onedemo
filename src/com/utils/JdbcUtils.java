package com.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JdbcUtils {
    private static Properties props = new Properties();

    static {
        InputStream in = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
        try {
            props.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static final ThreadLocal<Connection> MY_THREAD_LOCAL = new ThreadLocal<>();

    public static Connection getConnection() {
        Connection conn = MY_THREAD_LOCAL.get();
        if (conn == null) {
            conn = createConnection();
            MY_THREAD_LOCAL.set(conn);
        }
        return conn;
    }

    public static void startTransaction() {
        try {
            getConnection().setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void endTransaction() {
        try {
            getConnection().commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void rollback() {
        try {
            getConnection().rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close() {
        Connection conn = MY_THREAD_LOCAL.get();
        if (conn != null) {
            MY_THREAD_LOCAL.set(null);
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs, Statement st) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (st != null) {
                st.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static Connection createConnection() {
        String driverClassName = props.getProperty("jdbc.driverClassName");
        String url = props.getProperty("jdbc.url");
        String username = props.getProperty("jdbc.user");
        String password = props.getProperty("jdbc.password");
        //
        try {
            Class.forName(driverClassName);
            Connection conn = DriverManager.getConnection(url, username, password);

            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
