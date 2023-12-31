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
                padding: 10px 380px;
                border-radius: 5px;
            }

            .sorting-option {
                position: relative;
                width: 220px;
                height:100%;
                
                display: flex;
                justify-content: center;
            }

            .sorting-option > span {
                margin-right: 10px;
            }
            .sorting-option span {
                text-align: center;
                font-size: 16px;
                font-weight: 600;
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
                cursor: pointer;
            }

            .sorting-dropdown a {
                display: block;
                padding: 5px;
                color: #333;
                text-decoration: none;
                width: 200px;
                text-align: center;
            }

            .sorting-dropdown a:hover {
                background-color: #f2f2f2;
                cursor: pointer;
            }
            .sorting-option span:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="sorting-controls">
            <div class="sorting-option">
                <span>Sort Laptops By:</span>
            </div>
            <div class="sorting-option">
                <span>Price</span>
                <div class="sorting-dropdown">
                    <a href="/products?sort=lowToHigh">Low to High</a>
                    <a href="/products?sort=highToLow">High to Low</a>
                </div>
            </div>
            <div class="sorting-option">
                <span>Company</span>
                <div class="sorting-dropdown">
                    <a href="/products?category=acer" >Acer</a>
                    <a href="/products?category=dell" >Dell</a>
                    <a href="/products?category=asus" >Asus</a>
                </div>
            </div>
            <div class="sorting-option">
                <span>Top Best Selling Laptops</span>
                <div class="sorting-dropdown">
                    <a href="/products?top=selling-by-week">Top sellers by week</a>
                    <a href="/products?top=selling-by-month">Top sellers by month</a>

                </div>
            </div>
            <!-- Add more sorting/filtering options as needed -->
        </div>

    </body>
</html>
