<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Test</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background: #f0f0f0; }
        .test-box { background: white; padding: 20px; border-radius: 8px; margin: 10px 0; }
        .success { border-left: 4px solid #28a745; }
        .info { border-left: 4px solid #007bff; }
    </style>
</head>
<body>
    <div class="test-box success">
        <h1>✅ JSP is Working!</h1>
        <p><strong>Server Time:</strong> <%= new java.util.Date() %></p>
        <p><strong>Page Encoding:</strong> UTF-8</p>
    </div>
    
    <div class="test-box info">
        <h2>🔗 Navigation Links</h2>
        <p><a href="cart_with_checkout_debug.jsp">→ Debug Version</a></p>
        <p><a href="cart_with_checkout_fixed.jsp">→ Fixed Version</a></p>
        <p><a href="cart_with_checkout.jsp">→ Original Version</a></p>
        <p><a href="../index.jsp">→ Home Page</a></p>
    </div>
    
    <div class="test-box info">
        <h2>🛍️ Test Checkout Modal</h2>
        <button onclick="alert('JavaScript is working!')" style="padding: 10px 20px; background: #007bff; color: white; border: none; border-radius: 4px;">
            Test JavaScript
        </button>
    </div>
</body>
</html>