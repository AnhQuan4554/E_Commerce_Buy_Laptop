<%-- Document : sorting_product Created on : Dec 10, 2023, 10:50:42 AM Author :
welcome --%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
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
      .filter {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin-top: 20px;
        padding: 0 50px;
        /* gap: 20px; */
      }
      .sorting-option {
        position: relative;
        width: 100px;
        padding: 20px;
        height: 100%;
        display: flex;
        justify-content: center;
      }

      .filterIcon:hover ~ .sorting-option {
        display: flex; /* Show on hover or focus */
      }
      .sorting-option > span {
        margin-right: 10px;
      }
      .sorting-option span {
        text-align: center;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
      }
      .sorting-dropdown {
        display: none;
        position: absolute;
        top: 100%;
        left: -70%;
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
      .sorting-option span:hover {
        cursor: pointer;
      }
      .sortingCategory {
        width: 100%;
        padding: 0 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: antiquewhite;
        margin-top: 20px;
      }
      .sortingCategory a {
        display: block;
        padding: 5px;
        color: #333;
        text-decoration: none;
        width: 200px;
        text-align: center;
        font-size: 20px;
        font-weight: 600;
        transition: background-color 0.5s ease;
      }
      .sortingCategory a:hover {
        background-color: rgb(187, 235, 235);
        /* transition: background-color 0.5s ease; */
      }
    </style>
  </head>
  <body>
    <div class="filter">
      <div class="filterIcon">
        <span>Sort Laptops By:</span>
        <i style="font-size: 20px" class="bi bi-funnel-fill"></i>
      </div>
      <div class="sorting-option">
        <span>Price</span>
        <div class="sorting-dropdown">
          <a href="/products?sort=lowToHigh">Low to High</a>
          <a href="/products?sort=highToLow">High to Low</a>
        </div>
      </div>
      <div class="sorting-option">
        <span>Brand</span>
        <div class="sorting-dropdown">
          <a href="/products?category=acer">Acer</a>
          <a href="/products?category=dell">Dell</a>
          <a href="/products?category=asus">Asus</a>
        </div>
      </div>
    </div>

    <div class="wrapSortingProduct">
      <div class="sortingCategory">
        <a href="/products?category=">All</a>
        <a href="/products?category=acer">Acer</a>
        <a href="/products?category=dell">Dell</a>
        <a href="/products?category=asus">Asus</a>
        <a href="/products?category=asus"> Laptop gaming </a>
        <a href="/products?category=asus"> Macbook Apple </a>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
      integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
      integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
