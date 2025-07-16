<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISHYIGA - Debug Version</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body { 
            background: #f6f7fb; 
            font-family: 'Segoe UI', Arial, sans-serif;
            padding: 20px;
        }
        .debug-panel {
            background: #fff;
            border: 2px solid #007bff;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
        }
        .test-button {
            margin: 10px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="debug-panel">
            <h1 class="text-primary">🔍 ISHYIGA Debug Page</h1>
            <p><strong>Status:</strong> <span class="text-success">Page Loading Successfully! ✅</span></p>
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <h3>External Resources Test</h3>
                    <div id="resource-status">
                        <p>Bootstrap: <span id="bootstrap-status">Testing...</span></p>
                        <p>FontAwesome: <span id="fontawesome-status">Testing...</span></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3>JavaScript Test</h3>
                    <button class="btn btn-primary test-button" onclick="testJS()">
                        <i class="fas fa-play"></i> Test JavaScript
                    </button>
                    <div id="js-result"></div>
                </div>
            </div>

            <div class="mt-4">
                <h3>Cart API Test</h3>
                <button class="btn btn-warning test-button" onclick="testCartAPI()">
                    <i class="fas fa-shopping-cart"></i> Test Cart API
                </button>
                <div id="api-result"></div>
            </div>

            <div class="mt-4">
                <h3>Sample Cart Interface</h3>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Shopping Cart</h5>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody id="sample-cart">
                                <tr>
                                    <td>Sample Product</td>
                                    <td>1,000 Rwf</td>
                                    <td>2</td>
                                    <td>2,000 Rwf</td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-success" onclick="testCheckout()">
                            <i class="fas fa-credit-card"></i> Test Checkout Modal
                        </button>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <h3>Navigation Links</h3>
                <a href="cart_with_checkout.jsp" class="btn btn-primary">
                    <i class="fas fa-arrow-right"></i> Go to Full Cart Page
                </a>
                <a href="../index.jsp" class="btn btn-secondary">
                    <i class="fas fa-home"></i> Go to Home
                </a>
            </div>
        </div>
    </div>

    <!-- Test Modal -->
    <div class="modal fade" id="testModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">🎉 Checkout Test</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Modal is working correctly!</p>
                    <div class="text-center">
                        <div style="background: #ffcc02; padding: 20px; border-radius: 10px;">
                            <h4>MTN Mobile Money</h4>
                            <p>Payment system ready!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Test functions
        function testJS() {
            document.getElementById('js-result').innerHTML = 
                '<div class="alert alert-success mt-2">JavaScript is working! ✅</div>';
        }

        function testCartAPI() {
            document.getElementById('api-result').innerHTML = 
                '<div class="alert alert-info mt-2">Testing cart API...</div>';
            
            // Test the actual cart API
            fetch('/Trading_KaosV1/cart?userId=BUYER123')
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('API not available');
                    }
                })
                .then(data => {
                    document.getElementById('api-result').innerHTML = 
                        '<div class="alert alert-success mt-2">Cart API working! Data: ' + JSON.stringify(data) + '</div>';
                })
                .catch(error => {
                    document.getElementById('api-result').innerHTML = 
                        '<div class="alert alert-warning mt-2">Cart API not available: ' + error.message + ' (This is normal for testing)</div>';
                });
        }

        function testCheckout() {
            var modal = new bootstrap.Modal(document.getElementById('testModal'));
            modal.show();
        }

        // Check if resources loaded
        window.addEventListener('load', function() {
            // Check Bootstrap
            if (typeof bootstrap !== 'undefined') {
                document.getElementById('bootstrap-status').innerHTML = 
                    '<span class="text-success">✅ Loaded</span>';
            } else {
                document.getElementById('bootstrap-status').innerHTML = 
                    '<span class="text-danger">❌ Failed</span>';
            }

            // Check FontAwesome by looking for icon elements
            const icons = document.querySelectorAll('.fas');
            if (icons.length > 0) {
                document.getElementById('fontawesome-status').innerHTML = 
                    '<span class="text-success">✅ Loaded</span>';
            } else {
                document.getElementById('fontawesome-status').innerHTML = 
                    '<span class="text-danger">❌ Failed</span>';
            }
        });

        // Error handling
        window.addEventListener('error', function(e) {
            console.error('JavaScript Error:', e.error);
            alert('JavaScript Error detected! Check console for details.');
        });
    </script>
</body>
</html>