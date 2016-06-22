package com.salojava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by PunoLee on 16/6/2.
 */
public class ConnectDB {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // 加载驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 数据库连接url
            String url = "jdbc:mysql://crayygy.cn:3306/salotto?characterEncoding=UTF-8";
            // 获取数据库连接
            conn = DriverManager.getConnection(url, "cyx", "cyx1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    /**
     * 关闭数据库连接
     *
     * @param conn Connection对象
     */
    public static void closeConnection(Connection conn) {
        // 判断conn是否为空
        if (conn != null) {
            try {
                conn.close();   // 关闭数据库连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

