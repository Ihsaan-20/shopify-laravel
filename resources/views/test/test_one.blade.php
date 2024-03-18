<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <header>
        <!-- place navbar here -->
    </header>
    <main>
        <div class="container">
           <div class="row">
            <div class="col-lg-6 mx-auto">
               
                <div class="card mt-3">
                    <div class="card-header">
                        Discount Calculator
                    </div>
                    <div class="card-body">
                       
                    <div class="mb-3 itemPrice">
                        <input type="text" name="item_price" class="form-control" placeholder="Enter item price..">
                    </div>

                    <div class="mb-3 discount">
                        <input type="text" name="discount"  class="form-control" placeholder="Enter discount">
                    </div>

                    <div class="form-group mb-3">
                        <label for="">Select discount type</label>
                        <select class="custom-select form-control" name="discount_type" id="discount_type">
                            <option selected disabled>Select one</option>
                            <option value="flat">Flat</option>
                            <option value="percentage">Percentage</option>
                        </select>
                    </div>
                    
                    <h3 class="text-center"></h3>

                    <div class="mb-3 text-center">
                        <button type="button" onclick=" window.location.reload();" class="btn btn-primary px-5  mt-3">Reload</button>
                    </div>

                    </div>
                </div>

            </div>
           </div>

        

        

    </main>
    <script>
        const output = document.querySelector('h3');

        const discountInput = document.querySelector('.discount input');
        const itemPriceInput = document.querySelector('.itemPrice input');

        const discountTypeSelect = document.querySelector('select');

        discountTypeSelect.addEventListener('change', () => {

            const discountAmount = parseInt(discountInput.value);
            const itemPriceAmount = parseInt(itemPriceInput.value);
            const discountType = discountTypeSelect.value;

           

            if (isNaN(discountAmount) && isNaN(itemPriceAmount)) {
                output.innerHTML = "Invalid input";
            } else {
                const result = calculateDiscount(itemPriceAmount, discountAmount, discountType);
                output.innerHTML = "Total with discount = " + result;
            }
        });

        // Calculation function
        function calculateDiscount(itemPrice, discountAmount, discountType) {
            if (typeof itemPrice !== 'number' || itemPrice <= 0) {
                return 'Invalid item price';
            }
            if (typeof discountAmount !== 'number' || discountAmount <= 0) {
                return 'Invalid discount amount';
            }

            switch (discountType) {
                case 'percentage':
                    if (discountAmount > 100) {
                        return 'Discount percentage cannot exceed 100%';
                    }
                    return itemPrice - ((discountAmount / 100) * itemPrice) + " /Rs";
                case 'flat':
                    return itemPrice - discountAmount + " /Rs";
                default:
                    return 'Unknown discount type';
            }
        }

    </script>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js">
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js">
    </script>
</body>

</html>