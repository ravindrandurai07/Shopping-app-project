<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="../css/viewProducts.css">
</head>
<body>
    <h1>Products</h1>
    <div class="product-grid">
        <%
            String url = "jdbc:mysql://localhost:3306/shop"; // Database URL
            String user = "root"; // Database username
            String password = "Tiger"; // Database password

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                String sql = "SELECT * FROM products";
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String description = rs.getString(7);
                    double price = rs.getDouble(3);
                    String imageUrl = rs.getString(5);
                    int categoryId = rs.getInt(6);
                    int qty = rs.getInt(4);
                    
        %>
                    <div class="product-item">
                        <img src="<%= imageUrl %>" alt="<%= name %>" />
                        <% System.out.println(imageUrl); %>
                        <h2><%= name %></h2>
                        <p><%= description %></p>
                        <p>Price: $<%= price %></p>
                    </div>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>
