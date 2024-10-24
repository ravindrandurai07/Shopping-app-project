<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Home page</title>
    <link rel="stylesheet" href="../css/home.css">
</head>
<body>

    <header>
        <nav>
            <div class="logo">
                <a href="home.jsp">ShopEasy</a>
            </div>
            <ul class="nav-links">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="user-logout">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="hero">
            <h1>Welcome to ShopEasy!</h1>
            <p>Find the best products at unbeatable prices.</p>
            <a href="products.jsp" class="cta-btn">Start Shopping</a>
        </section>

        <section class="featured-products">
            <h2>Featured Products</h2>
            <div class="product-grid">
                <jsp:include page="products.jsp" flush="true" />
            </div>
        </section>
    </main>

    <footer>
        <p> 2024 ShopEasy. All rights reserved.</p>
    </footer>

</body>
</html>
