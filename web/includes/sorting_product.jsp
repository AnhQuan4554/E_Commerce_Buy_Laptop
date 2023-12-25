<%-- 
    Document   : sorting_product
    Created on : Dec 10, 2023, 10:50:42 AM
    Author     : welcome
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Filtering and Sorting</title>
        <style>
            .sorting-controls {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #f2f2f2;
                padding: 10px;
                border-radius: 5px;
            }

            .sorting-option {
                position: relative;
            }

            .sorting-option > span {
                margin-right: 10px;
            }

            .sorting-dropdown {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 5px;
                z-index: 1;
            }

            .sorting-option:hover .sorting-dropdown {
                display: block;
            }

            .sorting-dropdown a {
                display: block;
                padding: 5px;
                color: #333;
                text-decoration: none;
            }

            .sorting-dropdown a:hover {
                background-color: #f2f2f2;
            }

        </style>
    </head>
    <body>
        <div class="sorting-controls">
            <div class="sorting-option">
                <span>Giá:</span>
                <div class="sorting-dropdown">
                    <a href="/products?sort=lowToHigh">Thap den cao</a>
                    <a href="/products?sort=highToLow">Cao den thap</a>
                </div>
            </div>
            <div class="sorting-option">
                <span>Theo hãng:</span>
                <div class="sorting-dropdown">
                    <a href="/products?category=acer" >Acer</a>
                    <a href="/products?category=dell" >Dell</a>
                    <a href="/products?category=asus" >Asus</a>
                </div>
            </div>
            <div class="sorting-option">
                <span>Top san pham ban chay:</span>
                <div class="sorting-dropdown">
                    <a href="/products?top=selling-by-week">Top ban chay theo tuan</a>
                    <a href="/products?top=selling-by-month">Top ban chay theo thang</a>

                </div>
            </div>
            <!-- Add more sorting/filtering options as needed -->
        </div>

    </body>
</html>
