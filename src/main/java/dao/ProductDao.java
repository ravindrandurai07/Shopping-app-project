package dao;

import java.awt.Taskbar.State;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ProductDao {
	
	public static boolean addProduct (String name, int qty, double price, 
										String category, String desc, String url) {
		
		System.out.println(name);
		System.out.println(qty);
		System.out.println(price);
		System.out.println(category);
		System.out.println(desc);
		System.out.println(url);
		
		Connection con = DbConnection.getDbConnection();
		
		String sql1 = "SELECT id FROM Categories WHERE category_name =?;";
		int catId = -1;
		try {
			PreparedStatement pst = con.prepareStatement(sql1);
			pst.setString(1, category);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				catId = rs.getInt(1);
			else
				return false;
			if (pst != null) pst.close();
			if (rs != null) rs.close();
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return false;
		}
		
		
		String sql = "INSERT INTO products (prod_name, prod_price, prod_qty, prod_img_url, prod_category_id, prod_desc) VALUES (?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setDouble(2, price);
			pst.setInt(3, qty);
			pst.setString(4, url);
			pst.setInt(5, catId);
			pst.setString(6, desc);
			pst.executeUpdate();
			if (pst != null) pst.close();
			
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
    			System.out.println(e.getMessage());

                e.printStackTrace();
            }
        }
		
		return true;
	}
}
