<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Shopping App</title>
    <link rel="stylesheet" href="../css/home.css"> <!-- Link to your CSS file -->
</head>
<body>

<header>
    <nav>
        <div class="logo"><a href="#">ShopEasy</a></div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Cart</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
</header>

<div class="hero">
    <h1>Welcome to ShopEasy</h1>
    <p>Your one-stop shop for everything!</p>
    <a href="#" class="cta-btn">Shop Now</a>
</div>

<main class="featured-products">
    <h2>Featured Products</h2>
    <div class="product-grid">
        <%-- Example dynamic product listing --%>
        <%
            // Sample products for demonstration
            String[][] products = {
                {"Product 1", "product1.jpg", "$29.99"},
                {"Product 2", "product2.jpg", "$19.99"},
                {"Product 3", "product3.jpg", "$39.99"},
                {"Product 4", "product4.jpg", "$24.99"}
            };
            
            for (String[] product : products) {
        %>
            <div class="product">
                <img src="<%= product[1] %>" alt="<%= product[0] %>">
                <h3><%= product[0] %></h3>
                <p><%= product[2] %></p>
                <button>Add to Cart</button>
            </div>
        <%
            }
        %>
    </div>
</main>

<footer>
    <p>&copy; 2024 ShopEasy. All rights reserved.</p>
</footer>

</body>
</html>
