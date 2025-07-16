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
        .category-bar { background: #fff; border-bottom: 1px solid #eee; padding: 10px 0; }
        .category-bar .btn, .category-bar .form-check-label { font-size: 0.95rem; margin-right: 10px; }
        .category-bar .btn-outline-secondary { border: 1px solid #eee; background: #f6f7fb; color: #222; }
        .category-bar .form-check-input { margin-right: 5px; }
        .category-bar .contact { margin-left: auto; color: #222; font-size: 1rem; }
        .breadcrumb-bar { background: #f6f7fb; padding: 16px 0 0 0; }
        .breadcrumb { background: none; font-size: 0.97rem; }
        .cart-container { background: none; margin: 32px auto; max-width: 1100px; }
        .cart-card { background: #fff; border-radius: 12px; box-shadow: 0 1px 4px #0001; padding: 24px 24px 16px 24px; }
        .cart-title { font-size: 1.2rem; font-weight: 600; color: #222; margin-bottom: 18px; }
        .cart-table th, .cart-table td { vertical-align: middle; }
        .cart-table th { color: #888; font-weight: 600; background: #f6f7fb; border: none; }
        .cart-table td { color: #222; border-top: 1px solid #f0f0f0; background: #fff; }
        .cart-table .product-img { width: 48px; height: 48px; object-fit: cover; border-radius: 8px; margin-right: 12px; }
        .cart-table .product-name { font-weight: 500; color: #222; font-size: 1rem; }
        .cart-table .old-price { color: #bbb; text-decoration: line-through; font-size: 0.97rem; margin-right: 6px; }
        .cart-table .new-price { color: #222; font-weight: 600; font-size: 1rem; }
        .cart-table .qty-box { display: flex; align-items: center; border: 1px solid #eee; border-radius: 6px; }
        .cart-table .qty-btn { background: none; border: none; color: #888; font-size: 1.2rem; width: 32px; height: 32px; }
        .cart-table .qty-input { width: 36px; text-align: center; border: none; background: none; font-size: 1rem; }
        .cart-table .remove-btn { background: none; border: none; color: #bbb; font-size: 1.2rem; margin-right: 8px; }
        .cart-table .remove-btn:hover { color: #ff3b3b; }
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
        .coupon-card { background: #fff; border-radius: 12px; box-shadow: 0 1px 4px #0001; padding: 24px; }
        .coupon-title { font-size: 1.1rem; font-weight: 600; color: #222; margin-bottom: 12px; }
        .coupon-input { border-radius: 6px; border: 1px solid #eee; padding: 8px; width: 100%; margin-bottom: 10px; }
        .apply-coupon-btn { background: #eaf6f0; color: #1ecb81; border: none; border-radius: 6px; font-weight: 500; width: 100%; }
        footer { background: #f6f7fb; padding: 32px 0 16px 0; margin-top: 32px; border-top: 1px solid #eee; }
        .footer-title { font-weight: 600; color: #222; margin-bottom: 10px; font-size: 1rem; }
        .footer-link { color: #888; font-size: 0.95rem; margin-bottom: 8px; text-decoration: none; display: block; }
        .app-badges img { height: 36px; margin-right: 8px; }
        .footer-bottom { color: #aaa; font-size: 0.9rem; margin-top: 16px; }
        .footer-social i { color: #888; font-size: 1.2rem; margin-right: 12px; }
        .quantity-controls {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .quantity-controls button {
            padding: 0.25rem 0.5rem;
            margin: 0 0.25rem;
        }
        .quantity-controls span {
            min-width: 2rem;
            text-align: center;
        }
        .seller-qr-code {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 5px;
            background-color: white;
        }
        .seller-cart-container {
            border: 1px solid #e9ecef;
            border-radius: 12px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        .seller-cart-header {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 15px 20px;
            border-bottom: 1px solid #dee2e6;
        }
        .seller-cart-body {
            padding: 20px;
        }
        .seller-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .seller-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #1ecb81;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }
        .seller-details h5 {
            margin: 0;
            color: #333;
            font-weight: 600;
        }
        .seller-details p {
            margin: 0;
            color: #666;
            font-size: 0.9rem;
        }
        .seller-subtotal {
            text-align: right;
        }
        .seller-subtotal .amount {
            font-size: 1.2rem;
            font-weight: 700;
            color: #1ecb81;
        }
        .seller-subtotal .label {
            color: #666;
            font-size: 0.9rem;
        }
        .seller-header {
            border-left: 4px solid #1ecb81 !important;
        }
        .seller-header td {
            background-color: #f8f9fa !important;
            border-top: 2px solid #dee2e6 !important;
            border-bottom: 2px solid #dee2e6 !important;
        }
        .seller-separator {
            background-color: #e9ecef;
            height: 20px;
        }
        
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
            justify-content: between;
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
    </style>
    <script>
        // Fetch cart items from backend
        async function fetchCartItems() {
            try {
                const response = await fetch('/Trading_KaosV1/cart?userId=BUYER123');
                const data = await response.json();
                return data.items || [];
            } catch (error) {
                console.error('Error fetching cart items:', error);
                return [];
            }
        }

        // Render cart items in the table
        function renderCartItems(items) {
            const tbody = document.getElementById('cartTableBody');
            if (!tbody) return;
            if (!Array.isArray(items) || items.length === 0) {
                tbody.innerHTML = '<tr><td colspan="5" class="text-center">Your cart is empty</td></tr>';
                updateCartTotals([]);
                return;
            }
            
            // Group items by seller
            const sellerGroups = {};
            items.forEach(item => {
                const sellerAccount = item.SELLER_ISHYIGA_ACCOUNT || 'Unknown Seller';
                const sellerPhone = item.sellerPhone || 'N/A';
                const sellerKey = sellerAccount + '|' + sellerPhone;
                
                if (!sellerGroups[sellerKey]) {
                    sellerGroups[sellerKey] = {
                        sellerAccount: sellerAccount,
                        sellerPhone: sellerPhone,
                        items: [],
                        subtotal: 0
                    };
                }
                sellerGroups[sellerKey].items.push(item);
                sellerGroups[sellerKey].subtotal += (item.price * item.quantity);
            });
            
            // Generate HTML for each seller group
            let html = '';
            Object.keys(sellerGroups).forEach((sellerKey, groupIndex) => {
                const sellerGroup = sellerGroups[sellerKey];
                
                // Add seller header row
                html += '<tr class="seller-header">' +
                    '<td colspan="5" style="padding: 15px 10px;">' +
                    '<div class="d-flex justify-content-between align-items-center">' +
                    '<div>' +
                    '<i class="fas fa-store me-2"></i>' +
                    'Seller: ' + sellerGroup.sellerAccount +
                    (sellerGroup.sellerPhone !== 'N/A' ? ' (' + sellerGroup.sellerPhone + ')' : '') +
                    '</div>' +
                    '<div class="text-end">' +
                    '<strong>Subtotal: ' + sellerGroup.subtotal.toLocaleString() + ' Rwf</strong>' +
                    (sellerGroup.sellerPhone !== 'N/A' ? 
                        '<br><div class="seller-qr-code d-inline-block mt-2"><img src="' + generateQRCodeForSeller(sellerGroup.sellerPhone, sellerGroup.subtotal) + '" alt="Pay ' + Math.round(sellerGroup.subtotal) + ' Rwf" style="width:150px;height:150px;"></div>' : 
                        '') +
                    '</div>' +
                    '</div>' +
                    '</td>' +
                    '</tr>';
                
                // Add items for this seller
                sellerGroup.items.forEach(item => {
                    const itemTotal = item.price * item.quantity;
                    
                    html += '<tr>' +
                    '<td>' + item.item_name + '</td>' +
                    '<td>' + item.price + '</td>' +
                    '<td>' + 
                        '<div class="quantity-controls">' +
                            '<button class="btn btn-sm btn-secondary" onclick="updateQuantity(' + item.id + ', ' + (item.quantity - 1) + ')">-</button>' +
                            '<span class="mx-2">' + item.quantity + '</span>' +
                            '<button class="btn btn-sm btn-secondary" onclick="updateQuantity(' + item.id + ', ' + (item.quantity + 1) + ')">+</button>' +
                        '</div>' +
                    '</td>' +
                        '<td>' + itemTotal + '</td>' +
                    '<td>' +
                        '<button class="btn btn-sm btn-danger" onclick="deleteCartItem(' + item.id + ')">' +
                            '<i class="fas fa-trash"></i>' +
                        '</button>' +
                    '</td>' +
                    '</tr>';
                });
                
                // Add separator row between seller groups (except for the last one)
                if (groupIndex < Object.keys(sellerGroups).length - 1) {
                    html += '<tr class="seller-separator"><td colspan="5"></td></tr>';
                }
            });
            
            console.log('Generated HTML:', html);
            tbody.innerHTML = html;
            updateCartTotals(items);
        }

        // Update cart totals
        function updateCartTotals(items) {
            const subtotal = items.reduce((sum, item) => {
                return sum + (item.price * item.quantity);
            }, 0);
            // Sum all item discounts (if present, otherwise 0)
            const discount = items.reduce((sum, item) => {
                return sum + ((item.discount || 0) * item.quantity);
            }, 0);
            const total = subtotal - discount;
            console.log('Cart Totals:', {subtotal, discount, total, items});
            // Update the totals display in the right panel
            const sideSubtotal = document.getElementById('side-subtotal');
            const sideDiscount = document.getElementById('side-discount');
            const sideTotal = document.getElementById('side-total');
            if (sideSubtotal && sideDiscount && sideTotal) {
                sideSubtotal.textContent = subtotal.toLocaleString() + ' Rwf';
                sideDiscount.textContent = discount.toLocaleString() + ' Rwf';
                sideTotal.textContent = total.toLocaleString() + ' Rwf';
            }
            // Debug and defensive update for cart summary section
            const summaryDiv = document.getElementById('cart-summary');
            const subtotalSpan = document.getElementById('cart-summary-subtotal');
            const discountSpan = document.getElementById('cart-summary-discount');
            const totalSpan = document.getElementById('cart-summary-total');
            console.log('summaryDiv:', summaryDiv, 'subtotalSpan:', subtotalSpan, 'discountSpan:', discountSpan, 'totalSpan:', totalSpan);
            if (summaryDiv && subtotalSpan && discountSpan && totalSpan) {
                subtotalSpan.textContent = subtotal.toLocaleString();
                discountSpan.textContent = discount.toLocaleString();
                totalSpan.textContent = total.toLocaleString();
                summaryDiv.style.display = 'block';
            }
            
            // Generate QR codes for each seller
            generateSellerQRCodes(items, total);
        }

        // Remove cart item
        async function removeCartItem(itemId) {
            if (!confirm('Are you sure you want to remove this item?')) return;
            
            try {
                const response = await fetch('/Trading_KaosV1/cart', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        action: 'remove',
                        id: itemId
                    })
                });
                const result = await response.json();
                if (result.success) {
                    // Reload cart items
                    const items = await fetchCartItems();
                    renderCartItems(items);
                } else {
                    alert('Failed to remove item: ' + (result.error || 'Unknown error'));
                }
            } catch (error) {
                console.error('Error removing item:', error);
                alert('Failed to remove item');
            }
        }

        // Update cart item quantity
        async function updateCartQty(itemId, newQty) {
            if (newQty < 1) {
                removeCartItem(itemId);
                return;
            }
            
            try {
                const response = await fetch('/Trading_KaosV1/cart', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        action: 'update',
                        id: itemId,
                        quantity: newQty
                    })
                });
                const result = await response.json();
                if (result.success) {
                    // Reload cart items
                    const items = await fetchCartItems();
                    renderCartItems(items);
                } else {
                    alert('Failed to update quantity: ' + (result.error || 'Unknown error'));
                }
            } catch (error) {
                console.error('Error updating quantity:', error);
                alert('Failed to update quantity');
            }
        }

        // Global function to load and render cart items
        async function loadCartItems() {
            const items = await fetchCartItems();
            renderCartItems(items);
        }

        // Load cart on page load
        document.addEventListener('DOMContentLoaded', loadCartItems);

        // Add this function after the loadCartItems function
        function updateQuantity(cartItemId, newQuantity) {
            if (newQuantity < 1) {
                alert('Quantity cannot be less than 1');
                return;
            }
            
            fetch('/Trading_KaosV1/cart', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    cartItemId: cartItemId,
                    quantity: newQuantity
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    loadCartItems(); // Reload the cart to show updated quantities
                } else {
                    alert('Failed to update quantity: ' + (data.error || 'Unknown error'));
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to update quantity. Please try again.');
            });
        }

        // Function to delete cart item
        async function deleteCartItem(cartItemId) {
            if (!confirm('Are you sure you want to remove this item from your cart?')) {
                return;
            }
            
            try {
                const response = await fetch('/Trading_KaosV1/cart?cartItemId=' + cartItemId, {
                    method: 'DELETE'
                });
                const data = await response.json();
                
                if (data.success) {
                    loadCartItems(); // Reload the cart after successful deletion
                } else {
                    alert('Failed to delete item: ' + (data.error || 'Unknown error'));
                }
            } catch (error) {
                console.error('Error:', error);
                alert('Failed to delete item. Please try again.');
            }
        }

        function generateSellerQRCodes(items, total) {
            // Group items by seller
            const sellerGroups = {};
            items.forEach(item => {
                const sellerPhone = item.sellerPhone || 'N/A';
                if (!sellerGroups[sellerPhone]) {
                    sellerGroups[sellerPhone] = {
                        phone: sellerPhone,
                        items: [],
                        subtotal: 0
                    };
                }
                sellerGroups[sellerPhone].items.push(item);
                sellerGroups[sellerPhone].subtotal += (item.price * item.quantity);
            });
            
            // Update the QR code container
            const qrContainer = document.getElementById('cart-qrcode');
            const qrDescription = document.getElementById('qr-description');
            
            if (qrContainer && qrDescription) {
                if (Object.keys(sellerGroups).length === 0) {
                    qrContainer.style.display = 'none';
                    qrDescription.textContent = 'No items in cart';
                    return;
                }
                
                // If there's only one seller, show their QR code
                if (Object.keys(sellerGroups).length === 1) {
                    const sellerPhone = Object.keys(sellerGroups)[0];
                    const sellerData = sellerGroups[sellerPhone];
                    if (sellerPhone !== 'N/A') {
                        const totalInt = Math.round(sellerData.subtotal);
                        const ussd = '*182*1*1*' + sellerPhone.replace(/\D/g, '') + '*' + totalInt + '#';
                        const telUri = 'tel:' + ussd.replace(/#/g, '#');
                        const qrApi = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' + encodeURIComponent(telUri);
                        qrContainer.src = qrApi;
                        qrContainer.style.display = 'block';
                        qrContainer.alt = 'Pay ' + totalInt + ' Rwf to ' + sellerPhone;
                        qrDescription.textContent = 'Pay ' + totalInt.toLocaleString() + ' Rwf to ' + sellerPhone;
                    } else {
                        qrContainer.style.display = 'none';
                        qrDescription.textContent = 'No seller phone available';
                    }
                } else {
                    // Multiple sellers - show a summary
                    qrContainer.style.display = 'none';
                    qrDescription.innerHTML = '<strong>Multiple Sellers</strong><br>' +
                        Object.keys(sellerGroups).map(sellerPhone => {
                            const sellerData = sellerGroups[sellerPhone];
                            if (sellerPhone !== 'N/A') {
                                return sellerPhone + ': ' + sellerData.subtotal.toLocaleString() + ' Rwf';
                            }
                            return 'Unknown: ' + sellerData.subtotal.toLocaleString() + ' Rwf';
                        }).join('<br>');
                }
            }
        }

        // Function to generate QR code for a specific seller
        function generateQRCodeForSeller(phone, amount) {
            if (!phone || phone === 'N/A') return null;
            
            const totalInt = Math.round(amount);
            const ussd = '*182*1*1*' + phone.replace(/\D/g, '') + '*' + totalInt + '#';
            const telUri = 'tel:' + ussd.replace(/#/g, '#');
            const qrApi = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' + encodeURIComponent(telUri);
            return qrApi;
        }

        // Checkout Modal Functions
        async function openCheckoutModal() {
            const checkoutModal = new bootstrap.Modal(document.getElementById('checkoutModal'));
            await loadCheckoutData();
            checkoutModal.show();
        }

        async function loadCheckoutData() {
            try {
                const items = await fetchCartItems();
                renderCheckoutSummary(items);
                calculateCheckoutTotals(items);
            } catch (error) {
                console.error('Error loading checkout data:', error);
            }
        }

        function renderCheckoutSummary(items) {
            const container = document.getElementById('checkoutOrderSummary');
            if (!container) return;

            let html = '';
            let grandTotal = 0;

            items.forEach(item => {
                const itemTotal = item.price * item.quantity;
                grandTotal += itemTotal;
                html += `
                    <div class="order-item">
                        <div class="flex-grow-1">
                            <strong>${item.item_name}</strong><br>
                            <small class="text-muted">Qty: ${item.quantity} × ${item.price.toLocaleString()} Rwf</small>
                        </div>
                        <div class="text-end">
                            <strong>${itemTotal.toLocaleString()} Rwf</strong>
                        </div>
                    </div>
                `;
            });

            html += `
                <div class="order-item">
                    <div class="flex-grow-1">
                        <strong>TOTAL AMOUNT</strong>
                    </div>
                    <div class="text-end">
                        <strong>${grandTotal.toLocaleString()} Rwf</strong>
                    </div>
                </div>
            `;

            container.innerHTML = html;
            
            // Update the amount display in payment section
            const amountDisplay = document.getElementById('paymentAmount');
            if (amountDisplay) {
                amountDisplay.textContent = grandTotal.toLocaleString() + ' Rwf';
            }
        }

        function calculateCheckoutTotals(items) {
            const total = items.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            window.checkoutTotal = total;
        }

        function validateCheckoutForm() {
            const name = document.getElementById('customerName').value.trim();
            const email = document.getElementById('customerEmail').value.trim();
            const phone = document.getElementById('customerPhone').value.trim();

            if (!name || !email || !phone) {
                alert('Please fill in all customer information fields.');
                return false;
            }

            if (!validateEmail(email)) {
                alert('Please enter a valid email address.');
                return false;
            }

            if (!validatePhone(phone)) {
                alert('Please enter a valid phone number (10 digits).');
                return false;
            }

            return true;
        }

        function validateEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }

        function validatePhone(phone) {
            const re = /^[0-9]{10}$/;
            return re.test(phone.replace(/\D/g, ''));
        }

        function proceedToPayment() {
            if (!validateCheckoutForm()) {
                return;
            }

            // Show payment section
            const customerSection = document.getElementById('customerInfoSection');
            const paymentSection = document.getElementById('paymentSection');
            
            customerSection.classList.remove('active');
            paymentSection.classList.add('active');

            // Auto-fill payment phone with customer phone
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
            
            if (!paymentPhone || !validatePhone(paymentPhone)) {
                alert('Please enter a valid MTN Mobile Money number (10 digits).');
                return;
            }

            const amount = window.checkoutTotal;
            
            // Show loading state
            showPaymentStatus('pending', 'Initiating payment...');
            
            // Simulate payment request
            setTimeout(() => {
                const ussd = `*182*1*1*${paymentPhone}*${Math.round(amount)}#`;
                
                // Try to trigger USSD (this might not work in all browsers/devices)
                try {
                    window.location.href = `tel:${ussd}`;
                } catch (e) {
                    console.log('Could not trigger USSD automatically');
                }
                
                showPaymentStatus('pending', `Please dial ${ussd} on your phone to complete the payment of ${amount.toLocaleString()} Rwf`);
                
                // Simulate waiting for payment confirmation
                setTimeout(() => {
                    if (confirm('Have you completed the payment? Click OK if yes, Cancel to retry.')) {
                        completeOrder();
                    } else {
                        showPaymentStatus('pending', 'Payment pending... Please complete the mobile money transaction.');
                    }
                }, 3000);
                
            }, 2000);
        }

        function showPaymentStatus(status, message) {
            const statusDiv = document.getElementById('paymentStatus');
            if (!statusDiv) return;

            statusDiv.className = `payment-status ${status}`;
            
            if (status === 'pending') {
                statusDiv.innerHTML = `
                    <div class="loading-spinner"></div>
                    <p class="mt-3"><strong>${message}</strong></p>
                `;
            } else if (status === 'success') {
                statusDiv.innerHTML = `
                    <i class="fas fa-check-circle fa-3x text-success mb-3"></i>
                    <h4>${message}</h4>
                `;
            } else if (status === 'error') {
                statusDiv.innerHTML = `
                    <i class="fas fa-times-circle fa-3x text-danger mb-3"></i>
                    <h4>${message}</h4>
                `;
            }
            
            statusDiv.style.display = 'block';
        }

        async function completeOrder() {
            try {
                // Here you would typically send the order data to your backend
                const orderData = {
                    customerName: document.getElementById('customerName').value,
                    customerEmail: document.getElementById('customerEmail').value,
                    customerPhone: document.getElementById('customerPhone').value,
                    paymentPhone: document.getElementById('paymentPhone').value,
                    totalAmount: window.checkoutTotal,
                    items: await fetchCartItems()
                };

                // Simulate order submission
                console.log('Order data:', orderData);
                
                showPaymentStatus('success', 'Payment successful! Your order has been placed.');
                
                // Clear cart after successful order
                setTimeout(() => {
                    clearCart();
                    window.location.reload();
                }, 3000);
                
            } catch (error) {
                console.error('Error completing order:', error);
                showPaymentStatus('error', 'Error processing order. Please try again.');
            }
        }

        async function clearCart() {
            try {
                const response = await fetch('/Trading_KaosV1/cart', {
                    method: 'DELETE',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ action: 'clear', userId: 'BUYER123' })
                });
                
                if (response.ok) {
                    console.log('Cart cleared successfully');
                }
            } catch (error) {
                console.error('Error clearing cart:', error);
            }
        }
    </script>
</head>
<body>
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
                            </tbody>
                        </table>
                    </div>
                    <div class="cart-actions mt-3">
                        <a href="/Trading_KaosV1/ishyiga_products.jsp" class="btn btn-outline-secondary"><i class="fas fa-arrow-left"></i> RETURN TO SHOP</a>
                        <button class="btn btn-success ms-auto">UPDATE CART</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="cart-totals-card mb-3">
                    <div class="cart-totals-title">Card Totals</div>
                    <table id="cartTotalsTable" class="w-100 mb-2">
                        <tr>
                            <td class="label">Sub-total</td>
                            <td class="text-end" id="side-subtotal">Rwf</td>
                        </tr>
                        <tr>
                            <td class="label">Discount</td>
                            <td class="text-end" id="side-discount">Rwf</td>
                        </tr>
                        <tr>
                            <td class="label total">Total</td>
                            <td class="text-end total" id="side-total">Rwf</td>
                        </tr>
                    </table>
                   <div class="coupon-card d-flex flex-row align-items-center justify-content-center gap-3" style="min-height:200px;">
                    <img  src="../img/visa_logo.png" alt="QR Code" style="width:80px;height:80px;" />
                    <img  src="../img/mastercard_logo.png" alt="QR Code" style="width:80px;height:80px;" />
                    <img  src="../img/spenn_logo.jpg" alt="QR Code" style="width:80px;height:80px;" />
                </div>
                    
                    <button class="checkout-btn" onclick="openCheckoutModal()">PROCEED TO CHECKOUT <i class="fas fa-arrow-right"></i></button>
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
                            <!-- Order items will be populated here -->
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
                                <div class="amount" id="paymentAmount">0 Rwf</div>
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

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="footer-title">Company</div>
                    <a href="#" class="footer-link">About Us</a>
                    <a href="#" class="footer-link">Investors</a>
                    <a href="#" class="footer-link">Careers</a>
                    <a href="#" class="footer-link">Blogs and news</a>
                </div>
                <div class="col-md-2">
                    <div class="footer-title">Buyers</div>
                    <a href="#" class="footer-link">Find store</a>
                    <a href="#" class="footer-link">Registration</a>
                    <a href="#" class="footer-link">Partnerships</a>
                    <a href="#" class="footer-link">Gift vouchers</a>
                </div>
                <div class="col-md-2">
                    <div class="footer-title">Help</div>
                    <a href="#" class="footer-link">Contact us</a>
                    <a href="#" class="footer-link">Live chat</a>
                    <a href="#" class="footer-link">Refund</a>
                    <a href="#" class="footer-link">Track order</a>
                </div>
                <div class="col-md-2">
                    <div class="footer-title">Service</div>
                    <a href="#" class="footer-link">Trade Resources</a>
                    <a href="#" class="footer-link">Logistics service</a>
                    <a href="#" class="footer-link">Refund</a>
                    <a href="#" class="footer-link">Safe purchase</a>
                </div>
                <div class="col-md-2">
                    <div class="footer-title">Language</div>
                    <a href="#" class="footer-link">Español</a>
                    <a href="#" class="footer-link">Português</a>
                    <a href="#" class="footer-link">Deutsch</a>
                    <a href="#" class="footer-link">日本語</a>
                </div>
                <div class="col-md-2 app-badges">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/5/5f/Available_on_the_App_Store_%28black%29.png" alt="App Store">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Google Play" style="height:32px;">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12 d-flex align-items-center justify-content-between">
                    <div class="footer-bottom">Copyright © 2025 Company Inc. All Rights Reserved</div>
                    <div class="footer-social">
                        <i class="fab fa-facebook"></i>
                        <i class="fab fa-youtube"></i>
                        <i class="fab fa-linkedin"></i>
                        <i class="fab fa-telegram"></i>
                    </div>
                    <div class="footer-bottom">
                        <a href="#" class="footer-link d-inline">Terms of service</a> |
                        <a href="#" class="footer-link d-inline">Privacy policy</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>