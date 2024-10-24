<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="../css/viewProducts.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Modal Styles */
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1000; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.5);
            padding-top: 100px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 300px; 
            text-align: center;
            border-radius: 8px;
        }

        .modal-header {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .modal-footer {
            display: flex;
            justify-content: space-between;
        }

        .modal-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal-confirm {
            background-color: #28a745; /* Green */
            color: white;
        }

        .modal-confirm:hover {
            background-color: #218838;
        }

        .modal-cancel {
            background-color: #dc3545; /* Red */
            color: white;
        }

        .modal-cancel:hover {
            background-color: #c82333;
        }

        /* Other styles for the product grid can remain the same */
    </style>
</head>
<body>
    <h1>Products</h1>

    <div class="category-menu">
        <a href="products?category=all">All Products</a> |
        <a href="products?category=Shirt">Shirts</a> |
        <a href="products?category=T-shirt">T-Shirts</a> |
        <a href="products?category=Cotton pants">Cotton pants</a> |
        <a href="products?category=Shorts">Shorts</a> |
        <a href="products?category=Over-sized T-Shirt">Over-sized T-Shirt</a> |
        <a href="products?category=Track pants">Track pants</a> |
        <a href="products?category=Sweat shirts">Sweat shirts</a>
    </div>

    <div class="product-grid">
        <%
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
                for (Product product : productList) {
        %>
                    <div class="product-item">
                        <div class="product-actions">
                            <a href="editProduct?id=<%= product.getId() %>" class="action-button-edit"><i class="fas fa-edit"></i></a>
                            <a href="#" onclick="openModal('<%= product.getId() %>'); return false;" class="action-button-remove"><i class="fas fa-trash-alt"></i></a>
                        </div>
                        <img src="<%= product.getUrl() %>" alt="<%= product.getName() %>" />
                        <h2><%= product.getName() %></h2>
                        <p><%= product.getDesc() %></p>
                        <p>Price: ₹<%= product.getPrice() %></p>
                    </div>
        <%
                }
            } else {
        %>
                <p>No products available in this category.</p>
        <%
            }
        %>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                Confirm Removal
            </div>
            <div class="modal-body">
                Are you sure you want to remove this product?
            </div>
            <div class="modal-footer">
                <button id="confirmButton" class="modal-button modal-confirm">Yes</button>
                <button onclick="closeModal();" class="modal-button modal-cancel">No</button>
            </div>
        </div>
    </div>

    <script>
        let productIdToRemove;

        function openModal(productId) {
            productIdToRemove = productId; // Store the product ID to remove
            document.getElementById("confirmationModal").style.display = "block"; // Show the modal
        }

        function closeModal() {
            document.getElementById("confirmationModal").style.display = "none"; // Hide the modal
        }

        document.getElementById("confirmButton").onclick = function() {
            // If confirmed, redirect to remove product URL
            window.location.href = "removeProduct?id=" + productIdToRemove;
        };

        // Close the modal when clicking outside of it
        window.onclick = function(event) {
            const modal = document.getElementById("confirmationModal");
            if (event.target === modal) {
                closeModal();
            }
        };
    </script>
</body>
</html>
