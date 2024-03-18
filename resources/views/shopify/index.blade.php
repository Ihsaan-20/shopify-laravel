<h1>Welcome to Shopify App</h1>
<h2>Shop Details:</h2>
@if (isset($shopData))
    <div>
        <h3>{{ $shopData['name'] ?? 'Shop Name Not Available' }}</h3>
        <p>Email: {{ $shopData['email'] ?? 'Email Not Available' }}</p>
        <p>Domain: {{ $shopData['domain'] ?? 'Domain Not Available' }}</p>
        <!-- Add more shop details as needed -->
    </div>
@else
    <p>Shop details could not be loaded.</p>
@endif
