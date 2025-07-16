<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISHYIGA - Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: #f6f7fb; font-family: 'Segoe UI', Arial, sans-serif; }
        .topbar { background: #fff; border-bottom: 1px solid #eee; }
        .logo { font-weight: bold; font-size: 1.5rem; letter-spacing: 1px; color: #222; }
        .search-bar { max-width: 400px; }
        .search-bar input { border-radius: 6px 0 0 6px; }
        .search-bar button { border-radius: 0 6px 6px 0; background: #fff; color: #222; border: 1px solid #eee; }
        .nav-icons i { font-size: 1.2rem; margin: 0 10px; color: #222; }
        .nav-icons .btn { background: #f6f7fb; border: none; }
        .nav-user { font-size: 1rem; color: #222; margin-left: 10px; }
        .breadcrumb-bar { background: #f6f7fb; padding: 16px 0 0 0; }
        .breadcrumb { background: none; font-size: 0.97rem; }
        .cart-container { background: none; margin: 32px auto; max-width: 1100px; }
        .cart-card { background: #fff; border-radius: 12px; box-shadow: 0 1px 4px #0001; padding: 24px 24px 16px 24px; }
        .cart-title { font-size: 1.2rem; font-weight: 600; color: #222; margin-bottom: 18px; }
        .cart-table th, .cart-table td { vertical-align: middle; }
        .cart-table th { color: #888; font-weight: 600; background: #f6f7fb; border: none; }
        .cart-table td { color: #222; border-top: 1px solid #f0f0f0; background: #fff; }
        .cart-actions { display: flex; align-items: center; gap: 12px; margin-top: 16px; }
        .cart-actions .btn { border-radius: 6px; font-weight: 500; }
        .cart-actions .btn-outline-secondary { color: #222; border: 1px solid #bbb; }
        .cart-actions .btn-success { background: #eaf6f0; color: #1ecb81; border: none; }
        .cart-totals-card { background: #fff; border-radius: 12px; box-shadow: 0 1px 4px #0001; padding: 24px; margin-bottom: 16px; }
        .cart-totals-title { font-size: 1.1rem; font-weight: 600; color: #222; margin-bottom: 16px; }
        .cart-totals-table td { padding: 4px 0; color: #222; }
        .cart-totals-table .label { color: #888; }
        .cart-totals-table .total { font-weight: 700; font-size: 1.1rem; color: #222; }
        .checkout-btn { background: #a6d6a8; color: #222; border: none; border-radius: 6px; font-weight: 600; width: 100%; padding: 10px 0; margin-top: 16px; }
        .checkout-btn i { margin-left: 8px; }
        .empty-cart { text-align: center; padding: 60px 20px; color: #888; }
        .empty-cart i { font-size: 4rem; margin-bottom: 20px; }
        
        /* Checkout Modal Styles */
        .checkout-modal .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .checkout-modal .modal-header {
            background: linear-gradient(135deg, #ffcc02 0%, #ffb800 100%);
            color: #000;
            border-radius: 15px 15px 0 0;
            border-bottom: none;
            padding: 20px 30px;
        }
        .checkout-modal .modal-title {
            font-weight: 700;
            font-size: 1.4rem;
        }
        .checkout-modal .modal-body {
            padding: 30px;
            background: #fff;
        }
        .checkout-step {
            margin-bottom: 25px;
            padding: 20px;
            border: 2px solid #f0f0f0;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .checkout-step.active {
            border-color: #ffcc02;
            background: #fffbf0;
        }
        .checkout-step h5 {
            color: #333;
            margin-bottom: 15px;
            font-weight: 600;
        }
        .mtn-payment-section {
            background: linear-gradient(135deg, #ffcc02 0%, #ffb800 100%);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            text-align: center;
        }
        .mtn-logo {
            width: 80px;
            height: 80px;
            margin: 10px auto;
            display: block;
        }
        .phone-input-group {
            background: white;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        .phone-input-group input {
            border: 2px solid #ffcc02;
            border-radius: 6px;
            padding: 12px;
            font-size: 1.1rem;
            text-align: center;
        }
        .amount-display {
            background: white;
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            border: 2px solid #ffcc02;
        }
        .amount-display .amount {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
        }
        .payment-confirm-btn {
            background: #ff6b00;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 15px 30px;
            font-size: 1.2rem;
            font-weight: 600;
            width: 100%;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        .payment-confirm-btn:hover {
            background: #e55a00;
            transform: translateY(-2px);
        }
        .order-summary {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        .order-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        .order-item:last-child {
            border-bottom: none;
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 10px;
            padding-top: 15px;
            border-top: 2px solid #ffcc02;
        }
        .payment-status {
            padding: 20px;
            text-align: center;
            margin: 20px 0;
        }
        .payment-status.success {
            background: #d4edda;
            color: #155724;
            border-radius: 8px;
        }
        .payment-status.pending {
            background: #fff3cd;
            color: #856404;
            border-radius: 8px;
        }
        .loading-spinner {
            border: 3px solid #f3f3f3;
            border-top: 3px solid #ffcc02;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .error-message {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            padding: 10px;
            margin: 10px 0;
        }
        .debug-info {
            background: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
            border-radius: 4px;
            padding: 10px;
            margin: 10px 0;
            font-family: monospace;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <!-- Loading indicator -->
    <div id="loading-indicator" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.9); z-index: 9999; display: flex; align-items: center; justify-content: center;">
        <div>
            <div class="loading-spinner"></div>
            <p class="mt-3">Loading cart...</p>
        </div>
    </div>

    <!-- TOP NAVBAR -->
    <div class="topbar py-2 px-4 d-flex align-items-center justify-content-between">
        <div class="d-flex align-items-center">
            <a href="/Trading_KaosV1/ishyiga_products.jsp">
            <span class="logo me-4">ISHYIGA</span></a>
            <form class="search-bar d-flex align-items-center">
                <input class="form-control" type="search" placeholder="Search for anything..." aria-label="Search">
                <button class="btn px-3" type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
        <div class="d-flex align-items-center nav-icons">
            <div class="dropdown me-2">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">All Category</button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Category 1</a></li>
                </ul>
            </div>
            <span class="nav-user ms-3">Need Help</span>
            <span class="nav-user ms-3"><i class="fas fa-phone"></i> +2507-855-010-420</span>
            <span class="nav-user ms-3">Orders</span>
            <span class="nav-user ms-3">Track Order</span>
            <span class="nav-user ms-3">My cart</span>
        </div>
    </div>

    <!-- BREADCRUMB -->
    <div class="breadcrumb-bar px-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="/Trading_KaosV1/ishyiga_products.jsp">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
        </nav>
    </div>

    <!-- CART CONTENT -->
    <div class="cart-container">
        <div class="row g-4">
            <div class="col-lg-8">
                <div class="cart-card mb-3">
                    <div class="cart-title mb-3">Shopping Cart</div>
                    
                    <!-- Error display -->
                    <div id="error-display" style="display: none;"></div>
                    
                    <!-- Debug info -->
                    <div id="debug-info" class="debug-info" style="display: none;"></div>
                    
                    <div class="table-responsive">
                        <table class="table cart-table align-middle mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">PRODUCTS</th>
                                    <th style="width: 20%">PRICE</th>
                                    <th style="width: 20%">QUANTITY</th>
                                    <th style="width: 15%">SUB-TOTAL</th>
                                    <th style="width: 5%">ACTION</th>
                                </tr>
                            </thead>
                            <tbody id="cartTableBody">
                                <!-- Cart items will be loaded here -->
                                <tr>
                                    <td colspan="5" class="text-center">
                                        <div class="loading-spinner"></div>
                                        <p class="mt-2">Loading cart items...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="cart-actions mt-3">
                        <a href="/Trading_KaosV1/ishyiga_products.jsp" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left"></i> RETURN TO SHOP
                        </a>
                        <button class="btn btn-success ms-auto" onclick="loadCartItems()">
                            <i class="fas fa-sync"></i> UPDATE CART
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="cart-totals-card mb-3">
                    <div class="cart-totals-title">Cart Totals</div>
                    <table id="cartTotalsTable" class="w-100 mb-2">
                        <tr>
                            <td class="label">Sub-total</td>
                            <td class="text-end" id="side-subtotal">0 Rwf</td>
                        </tr>
                        <tr>
                            <td class="label">Discount</td>
                            <td class="text-end" id="side-discount">0 Rwf</td>
                        </tr>
                        <tr>
                            <td class="label total">Total</td>
                            <td class="text-end total" id="side-total">0 Rwf</td>
                        </tr>
                    </table>
                    
                    <div class="d-flex flex-row align-items-center justify-content-center gap-3" style="min-height:200px; background: #f8f9fa; border-radius: 8px;">
                        <img src="https://via.placeholder.com/80x80/007bff/ffffff?text=VISA" alt="VISA" style="width:80px;height:80px;" />
                        <img src="https://via.placeholder.com/80x80/eb001b/ffffff?text=MC" alt="Mastercard" style="width:80px;height:80px;" />
                        <img src="https://via.placeholder.com/80x80/ff6b00/ffffff?text=MTN" alt="MTN" style="width:80px;height:80px;" />
                    </div>
                    
                    <button class="checkout-btn" onclick="openCheckoutModal()">
                        PROCEED TO CHECKOUT <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Checkout Modal -->
    <div class="modal fade checkout-modal" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="checkoutModalLabel">
                        <i class="fas fa-credit-card me-2"></i>
                        Secure Checkout
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Order Summary -->
                    <div class="order-summary">
                        <h5><i class="fas fa-shopping-cart me-2"></i>Order Summary</h5>
                        <div id="checkoutOrderSummary">
                            <div class="order-item">
                                <div class="flex-grow-1">
                                    <strong>Sample Product</strong><br>
                                    <small class="text-muted">Qty: 1 × 1,000 Rwf</small>
                                </div>
                                <div class="text-end">
                                    <strong>1,000 Rwf</strong>
                                </div>
                            </div>
                            <div class="order-item">
                                <div class="flex-grow-1">
                                    <strong>TOTAL AMOUNT</strong>
                                </div>
                                <div class="text-end">
                                    <strong id="modalTotal">1,000 Rwf</strong>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Customer Information Section -->
                    <div class="checkout-step active" id="customerInfoSection">
                        <h5><i class="fas fa-user me-2"></i>Customer Information</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="customerName" class="form-label">Full Name *</label>
                                <input type="text" class="form-control" id="customerName" required>
                            </div>
                            <div class="col-md-6">
                                <label for="customerEmail" class="form-label">Email Address *</label>
                                <input type="email" class="form-control" id="customerEmail" required>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="customerPhone" class="form-label">Phone Number *</label>
                                <input type="tel" class="form-control" id="customerPhone" placeholder="0781234567" required>
                            </div>
                            <div class="col-md-6">
                                <label for="customerAddress" class="form-label">Delivery Address</label>
                                <input type="text" class="form-control" id="customerAddress" placeholder="Street, City, Province">
                            </div>
                        </div>
                        <div class="text-end mt-3">
                            <button type="button" class="btn btn-warning btn-lg" onclick="proceedToPayment()">
                                Continue to Payment <i class="fas fa-arrow-right ms-2"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Payment Section -->
                    <div class="checkout-step" id="paymentSection">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5><i class="fas fa-mobile-alt me-2"></i>Mobile Money Payment</h5>
                            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="backToCustomerInfo()">
                                <i class="fas fa-arrow-left me-1"></i> Back
                            </button>
                        </div>
                        
                        <div class="mtn-payment-section">
                            <!-- MTN Logo SVG -->
                            <svg class="mtn-logo" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="50" cy="50" r="45" fill="#FFCC02" stroke="#FFB800" stroke-width="2"/>
                                <text x="50" y="35" text-anchor="middle" font-family="Arial, sans-serif" font-size="16" font-weight="bold" fill="#000">MTN</text>
                                <text x="50" y="55" text-anchor="middle" font-family="Arial, sans-serif" font-size="10" fill="#000">Mobile</text>
                                <text x="50" y="70" text-anchor="middle" font-family="Arial, sans-serif" font-size="10" fill="#000">Money</text>
                            </svg>
                            
                            <h4 style="color: #000; margin: 15px 0;">MTN Mobile Money</h4>
                            
                            <div class="amount-display">
                                <div class="text-muted">Amount to Pay</div>
                                <div class="amount" id="paymentAmount">1,000 Rwf</div>
                            </div>
                            
                            <div class="phone-input-group">
                                <label for="paymentPhone" class="form-label text-muted">Enter MTN Mobile Money Number</label>
                                <input type="tel" class="form-control form-control-lg" id="paymentPhone" 
                                       placeholder="078XXXXXXX" maxlength="10">
                                <small class="text-muted">Enter your 10-digit MTN number (e.g., 0781234567)</small>
                            </div>
                            
                            <button type="button" class="payment-confirm-btn" onclick="initiatePayment()">
                                <i class="fas fa-mobile-alt me-2"></i>
                                Pay with MTN Mobile Money
                            </button>
                        </div>

                        <!-- Payment Status -->
                        <div id="paymentStatus" class="payment-status" style="display: none;">
                            <!-- Payment status will be shown here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Global variables
        let cartItems = [];
        let checkoutTotal = 0;

        // Debug function
        function showDebugInfo(message) {
            const debugDiv = document.getElementById('debug-info');
            if (debugDiv) {
                debugDiv.innerHTML = 'DEBUG: ' + message;
                debugDiv.style.display = 'block';
            }
            console.log('DEBUG:', message);
        }

        // Error handling function
        function showError(message) {
            const errorDiv = document.getElementById('error-display');
            if (errorDiv) {
                errorDiv.innerHTML = '<div class="error-message"><strong>Error:</strong> ' + message + '</div>';
                errorDiv.style.display = 'block';
            }
            console.error('ERROR:', message);
        }

        // Hide loading indicator
        function hideLoadingIndicator() {
            const loadingDiv = document.getElementById('loading-indicator');
            if (loadingDiv) {
                loadingDiv.style.display = 'none';
            }
        }

        // Fetch cart items from backend
        async function fetchCartItems() {
            try {
                showDebugInfo('Attempting to fetch cart items...');
                const response = await fetch('/Trading_KaosV1/cart?userId=BUYER123');
                
                if (response.ok) {
                    const data = await response.json();
                    showDebugInfo('Cart API response: ' + JSON.stringify(data));
                    return data.items || [];
                } else {
                    throw new Error('Cart API returned status: ' + response.status);
                }
            } catch (error) {
                showDebugInfo('Cart API not available: ' + error.message);
                // Return sample data for testing
                return [
                    {
                        id: 1,
                        item_name: 'Sample Product 1',
                        price: 1000,
                        quantity: 2,
                        SELLER_ISHYIGA_ACCOUNT: 'Sample Seller',
                        sellerPhone: '0781234567'
                    },
                    {
                        id: 2,
                        item_name: 'Sample Product 2',
                        price: 1500,
                        quantity: 1,
                        SELLER_ISHYIGA_ACCOUNT: 'Another Seller',
                        sellerPhone: '0787654321'
                    }
                ];
            }
        }

        // Render cart items in the table
        function renderCartItems(items) {
            const tbody = document.getElementById('cartTableBody');
            if (!tbody) return;

            if (!Array.isArray(items) || items.length === 0) {
                tbody.innerHTML = `
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="empty-cart">
                                <i class="fas fa-shopping-cart"></i>
                                <h3>Your cart is empty</h3>
                                <p>Start shopping to add items to your cart</p>
                                <a href="/Trading_KaosV1/ishyiga_products.jsp" class="btn btn-primary">
                                    <i class="fas fa-shopping-bag"></i> Start Shopping
                                </a>
                            </div>
                        </td>
                    </tr>
                `;
                updateCartTotals([]);
                return;
            }

            let html = '';
            items.forEach(item => {
                const itemTotal = (item.price || 0) * (item.quantity || 0);
                html += `
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <div>
                                    <div class="fw-bold">${item.item_name || 'Unknown Product'}</div>
                                    <small class="text-muted">Seller: ${item.SELLER_ISHYIGA_ACCOUNT || 'Unknown'}</small>
                                </div>
                            </div>
                        </td>
                        <td>${(item.price || 0).toLocaleString()} Rwf</td>
                        <td>
                            <div class="d-flex align-items-center gap-2">
                                <button class="btn btn-sm btn-outline-secondary" onclick="updateQuantity(${item.id}, ${(item.quantity || 1) - 1})">-</button>
                                <span class="mx-2">${item.quantity || 0}</span>
                                <button class="btn btn-sm btn-outline-secondary" onclick="updateQuantity(${item.id}, ${(item.quantity || 1) + 1})">+</button>
                            </div>
                        </td>
                        <td>${itemTotal.toLocaleString()} Rwf</td>
                        <td>
                            <button class="btn btn-sm btn-outline-danger" onclick="deleteCartItem(${item.id})">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                `;
            });

            tbody.innerHTML = html;
            updateCartTotals(items);
        }

        // Update cart totals
        function updateCartTotals(items) {
            const subtotal = items.reduce((sum, item) => {
                return sum + ((item.price || 0) * (item.quantity || 0));
            }, 0);
            
            const discount = 0; // For now
            const total = subtotal - discount;

            // Update the totals display
            const sideSubtotal = document.getElementById('side-subtotal');
            const sideDiscount = document.getElementById('side-discount');
            const sideTotal = document.getElementById('side-total');
            
            if (sideSubtotal) sideSubtotal.textContent = subtotal.toLocaleString() + ' Rwf';
            if (sideDiscount) sideDiscount.textContent = discount.toLocaleString() + ' Rwf';
            if (sideTotal) sideTotal.textContent = total.toLocaleString() + ' Rwf';
            
            checkoutTotal = total;
        }

        // Update quantity (placeholder function)
        function updateQuantity(itemId, newQuantity) {
            if (newQuantity < 1) {
                alert('Quantity cannot be less than 1');
                return;
            }
            
            showDebugInfo(`Updating item ${itemId} to quantity ${newQuantity}`);
            // In a real app, this would make an API call
            // For now, just reload with sample data
            setTimeout(() => {
                loadCartItems();
            }, 500);
        }

        // Delete cart item (placeholder function)
        function deleteCartItem(itemId) {
            if (!confirm('Are you sure you want to remove this item from your cart?')) {
                return;
            }
            
            showDebugInfo(`Deleting item ${itemId}`);
            // In a real app, this would make an API call
            setTimeout(() => {
                loadCartItems();
            }, 500);
        }

        // Load cart items
        async function loadCartItems() {
            try {
                const items = await fetchCartItems();
                cartItems = items;
                renderCartItems(items);
                hideLoadingIndicator();
            } catch (error) {
                showError('Failed to load cart items: ' + error.message);
                hideLoadingIndicator();
            }
        }

        // Checkout Modal Functions
        function openCheckoutModal() {
            const checkoutModal = new bootstrap.Modal(document.getElementById('checkoutModal'));
            checkoutModal.show();
        }

        function proceedToPayment() {
            const customerSection = document.getElementById('customerInfoSection');
            const paymentSection = document.getElementById('paymentSection');
            
            customerSection.classList.remove('active');
            paymentSection.classList.add('active');

            const customerPhone = document.getElementById('customerPhone').value;
            const paymentPhone = document.getElementById('paymentPhone');
            if (paymentPhone && customerPhone) {
                paymentPhone.value = customerPhone;
            }
        }

        function backToCustomerInfo() {
            const customerSection = document.getElementById('customerInfoSection');
            const paymentSection = document.getElementById('paymentSection');
            
            paymentSection.classList.remove('active');
            customerSection.classList.add('active');
        }

        function initiatePayment() {
            const paymentPhone = document.getElementById('paymentPhone').value.trim();
            
            if (!paymentPhone) {
                alert('Please enter your MTN Mobile Money number');
                return;
            }

            const amount = checkoutTotal || 1000;
            const ussd = `*182*1*1*${paymentPhone}*${Math.round(amount)}#`;
            
            // Show payment instructions
            const statusDiv = document.getElementById('paymentStatus');
            if (statusDiv) {
                statusDiv.innerHTML = `
                    <div class="payment-status pending">
                        <h4>Payment Instructions</h4>
                        <p><strong>Dial this USSD code on your phone:</strong></p>
                        <h3 style="background: #fff; padding: 10px; border-radius: 5px; color: #000;">${ussd}</h3>
                        <p>Or use the MTN Mobile Money app to send <strong>${amount.toLocaleString()} Rwf</strong></p>
                        <button class="btn btn-success mt-3" onclick="confirmPayment()">
                            I have completed the payment
                        </button>
                    </div>
                `;
                statusDiv.style.display = 'block';
            }

            // Try to trigger USSD automatically (may not work in all browsers)
            try {
                window.location.href = `tel:${ussd}`;
            } catch (e) {
                console.log('Could not trigger USSD automatically');
            }
        }

        function confirmPayment() {
            const statusDiv = document.getElementById('paymentStatus');
            if (statusDiv) {
                statusDiv.innerHTML = `
                    <div class="payment-status success">
                        <i class="fas fa-check-circle fa-3x text-success mb-3"></i>
                        <h4>Payment Successful!</h4>
                        <p>Your order has been placed successfully.</p>
                        <p>You will receive a confirmation SMS shortly.</p>
                    </div>
                `;
            }
            
            setTimeout(() => {
                window.location.reload();
            }, 3000);
        }

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            showDebugInfo('Page loaded, initializing cart...');
            loadCartItems();
        });

        // Error handling for the whole page
        window.addEventListener('error', function(e) {
            showError('JavaScript error: ' + e.message);
            hideLoadingIndicator();
        });
    </script>
</body>
</html>