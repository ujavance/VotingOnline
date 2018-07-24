package cn.ujavance.votingonline.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 数据库操作的辅助类，把相同的代码集中
 * 
 * @author Administrator
 *
 */
public class JDBCUtil {

	/**
	 * 连接创建并向外提供连接对象,方法做成静态，便于调用
	 * 
	 * @return 返回连接对象
	 */
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
	public static Connection getConnection() {
		// 创建连接对象,参数1：URL，参数2：用户名，参数3：密码
		Connection connection = null;
		try {
			// 从连接池中取连接
			// 上下文对象 (运行时环境)
			Context context = new InitialContext();
			// 通过上下文对象根据连接池的名称来创建数据源对象
			DataSource ds = (DataSource) context.lookup("java:comp/env/votingonline");
			//根据数据源取出连接对象
			connection = ds.getConnection();
			
		} catch (Exception e) {
			System.out.println("连接池出现错误：" + e.getMessage());
		}

		return connection;
	}

	/**
	 * 资源的释放
	 * 
	 * @param connection
	 *            连接对象
	 * @param st
	 *            命令对象
	 * @param rs
	 *            结果集
	 */
	public static void closeAll(Connection connection, Statement st, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (connection != null)
				connection.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 增删改操作的方法
	 * ...叫动态参数，会自动把调用此方法时的实参封装成一个Object类型的数组。 此参数必须是方法的最后一个形参
	 * @param sql
	 * @return 返回受影响的行数
	 */
	public static int executeUpdate(String sql,Object ... obj) {
		// 调用方法取连接对象
		Connection connection = getConnection();
		PreparedStatement st = null;
		try {
			// 命令对象的创建
			st = connection.prepareStatement(sql);
			//把传入的参数给占符赋值
			for(int i=0;i<obj.length;i++){
				st.setObject(i+1, obj[i]);  //索引要从1开始
			}
			
			// 执行命令对象并返回数据库中受影响的行数
			return st.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			closeAll(connection, st, null); // 关闭资源
		}
		return 0;
	}
}
