package cn.ujavance.votingonline.dao.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.ujavance.votingonline.dao.UserDao;
import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.utils.JDBCUtil;

public class UserDaoImpl implements UserDao {

	@Override
	public boolean createAccount(User user) {
		// TODO Auto-generated method stub
		String sql = "Insert into t_user(userid, username, `password`) VALUES(?,?,?)";
		Connection connection = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtil.getConnection();
			System.out.println(connection);
			st = connection.prepareStatement(sql);

			st.setString(1, user.getUserid());
			st.setString(2, user.getUsername());
			st.setString(3, user.getPassword());

			boolean state = !(st.execute());
			System.out.println("UserDaoImpl insert account : " + state);
			return state;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JDBCUtil.closeAll(connection, st, rs);
		}
		return false;
	}

	@Override
	public User hasThisAccount(User user) {
		// TODO Auto-generated method stub
		String sql = "select * from t_user where username = ?";
		Connection connection = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtil.getConnection();
			System.out.println(connection);
			st = connection.prepareStatement(sql);

			st.setString(1, user.getUsername());
			
			rs = st.executeQuery();
			if(rs.next()) {
				user.setUserid(rs.getString("userid"));
				System.out.println("check this account in database : " + rs.getString("userid") );
				return user;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JDBCUtil.closeAll(connection, st, rs);
		}
		return null;
	}

}
