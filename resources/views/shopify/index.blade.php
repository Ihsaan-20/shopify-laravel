<!DOCTYPE html>
<html>
<head>
    <title>Shopify App</title>
</head>
<body>
    <h1>Welcome to Shopify App</h1>
    <h2>Shop Details:</h2>
    <ul>
        <li>Shop Name: {{ $shopData['shop']['name'] }}</li>
        <li>Shop Domain: {{ $shopData['shop']['domain'] }}</li>
        <!-- Add more shop details as needed -->
    </ul>
</body>
</html>