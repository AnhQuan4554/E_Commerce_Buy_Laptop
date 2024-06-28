<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>JSP Page</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <style>
      .wrapTopHome {
        margin-top: 20px;
        background-color: #f2f2f2;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <div class="wrapTopHome">
      <div style="max-width: unset !important" class="container">
        <div class="row" style="margin-top: 20px !important">
          <div class="col-3" style="padding: 6px !important">
            <div class="list-group">
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_3dcc022e961d90ea6b636f367e5e5f9d.png"
                />
                <p style="margin-bottom: 0; margin-left: 10px">Laptop Gaming</p>
              </a>
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_b706c0f50035bddb63ca6e91efef7703.png"
                />
                <p style="margin-bottom: 0; margin-left: 10px">
                  Laptop - Tablet - Mobile
                </p>
              </a>
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_0e7c5ca8ae5b342589830ae28fd25adc.jpg"
                />
                <p style="margin-bottom: 0; margin-left: 10px">
                  All-in-one Computer
                </p>
              </a>
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_a2e098b9730b13b0f4a5fa64ee45901c.png"
                />
                <p style="margin-bottom: 0; margin-left: 10px">
                  Computer - Server
                </p>
              </a>
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_c31556b0299892e16d0617a9c3c00263.png"
                />
                <p style="margin-bottom: 0; margin-left: 10px">
                  Storage Device, Memory Card
                </p>
              </a>
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_8a7100a2bf10de1685a042557ef4ee77.png"
                />
                <p style="margin-bottom: 0; margin-left: 10px">
                  Keyboard, Mouse, Gaming Gear
                </p>
              </a>
              <a
                style="display: flex; align-items: center"
                href="#"
                class="list-group-item list-group-item-action"
              >
                <img
                  style="max-width: 20px; max-height: 20px"
                  src="https://anphat.com.vn/media/category/cat_5804bb2ce092a894cf86a82c17affb54.png"
                />
                <p style="margin-bottom: 0; margin-left: 10px">
                  Other Accessories
                </p>
              </a>
            </div>
          </div>
          <div class="col-7" style="padding: 6px !important">
            <div
              id="carouselExampleIndicators"
              class="carousel slide"
              data-bs-ride="carousel"
            >
              <div class="carousel-indicators">
                <button
                  type="button"
                  data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="0"
                  class="active"
                  aria-current="true"
                  aria-label="Slide 1"
                ></button>
                <button
                  type="button"
                  data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="1"
                  aria-label="Slide 2"
                ></button>
                <button
                  type="button"
                  data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="2"
                  aria-label="Slide 3"
                ></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img
                    src="https://intphcm.com/data/upload/banner-la-gi.jpg"
                    class="d-block w-100"
                    alt="..."
                  />
                </div>
                <div class="carousel-item">
                  <img
                    src="https://anphat.com.vn/media/banner/31_May6849e4cea166cdbf0792ced763a1c2ab.png"
                    class="d-block w-100"
                    alt="..."
                  />
                </div>
                <div class="carousel-item">
                  <img
                    src="https://anphat.com.vn/media/banner/31_May251c443c69dfa5f4548f1a206f5447f8.png"
                    class="d-block w-100"
                    alt="..."
                  />
                </div>
              </div>
              <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev"
              >
                <span
                  class="carousel-control-prev-icon"
                  aria-hidden="true"
                ></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next"
              >
                <span
                  class="carousel-control-next-icon"
                  aria-hidden="true"
                ></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
          <div class="col-2" style="padding: 6px !important">
            <div class="row" style="height: 100%">
              <div class="col-12 mb-5">
                <img
                  style="max-width: 100%"
                  src="https://anphat.com.vn/media/banner/06_Jun18e1e444d2578801cc69c78fcc0cf4db.png"
                  alt=""
                />
              </div>
              <div class="col-12">
                <img
                  style="max-width: 100%"
                  src="https://anphat.com.vn/media/banner/31_Maye8e9c694ac7e2d3a7affb3ab02d99e6a.png"
                  alt=""
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row" style="padding: 0 20px 0 20px">
        <div class="col-4">
          <img
            style="max-width: 100%"
            src="https://anphat.com.vn/media/banner/31_May251c443c69dfa5f4548f1a206f5447f8.png"
            alt=""
          />
        </div>
        <div class="col-4">
          <img
            style="max-width: 100%"
            src="https://anphat.com.vn/media/banner/31_May6849e4cea166cdbf0792ced763a1c2ab.png"
            alt=""
          />
        </div>
        <div class="col-4">
          <img
            style="max-width: 100%"
            src="https://anphat.com.vn/media/banner/31_May84b5e6f5a54f9fbaa6b1fdf709501ca9.png"
            alt=""
          />
        </div>
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
