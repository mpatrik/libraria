<nav class="navbar navbar-expand-lg d-flex flex-wrap">
    <div class="container-fluid py-3 pe-lg-5">
        <button class="navbar-toggler border-0 p-0" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#navbarOffcanvasLg" aria-controls="navbarOffcanvasLg"
                aria-label="Toggle navigation">
            <i class="bi bi-list navbar-hamburger text-custom-secondary"></i>
        </button>
        <a class="navbar-logo" href="#">
            <img class="logo" src="images/logo.png" alt="logo">
        </a>

        <!-- MOBIL NAVIGÁCIÓ -->
        <div class="offcanvas offcanvas-start bg-custom-primary" tabindex="-1" id="navbarOffcanvasLg"
             aria-labelledby="navbarOffcanvasLgLabel">
            <div class="offcanvas-header">
                <button type="button" class="button-close border-0 bg-custom-primary text-custom-secondary ms-auto"
                        data-bs-dismiss="offcanvas" aria-label="Close">
                    <i class="bi bi-x-lg"></i>
                </button>
            </div>
            <div class="offcanvas-body">
                <div class="navbar-nav">
                    <a class="nav-link nav-link-home text-custom-secondary"><i class="fa fa-house"></i>&nbsp;Kezdőlap</a>
                    <a class="nav-link nav-link-books text-custom-secondary"><i class="fa-solid fa-book-open"></i>&nbsp;Könyvek</a>
                </div>

                <div class="search-container d-flex w-100 justify-content-center">
                    <input type="text" id="keyword" class="searchbar form-control border-0 rounded-2" aria-label="Search" placeholder="Keresés...">
                    <button id="search" class="search-btn bg-custom-secondary text-custom-light border-0 rounded-end-2">
                        <i class="fa fa-search"></i></button>
                </div>
            </div>
        </div>
        <!-- MOBIL NAVIGÁCIÓ VÉGE -->

        <!-- IKONOK -->
        <div class="header-icons d-flex gap-3">
            <!-- USER PANEL -->
            <div class="header__user-container rounded-top-2">
                <i class="bi bi-person-circle user-toggle header-icon"></i>
                <div class="header__user-body rounded-start-2 rounded-bottom-2">
                    
                </div>
            </div>
            <!-- KOSÁR PANEL -->
            <div class="cart-container rounded-top-2">
                <div class="cart-toggle cart-icon-container">
                    <i class="bi bi-cart3 header-icon"></i>
                    <div class="cart-quantity"><span class="cart-quantity-display bg-custom-danger"></span></div>
                </div>
                <div class="cart-body p-3 rounded-start-2 rounded-bottom-2">

                </div>
            </div>
        </div>
        <!-- IKONOK VÉGE -->
    </div>

    <!-- PC NAVIGÁCIÓ -->
    <div class="nav-links bg-custom-light text-custom-primary w-100 px-3 d-flex gap-5">
        <a href="#" class="nav-link nav-link-home"><i class="fa fa-house"></i>&nbsp;Kezdőlap</a>
        <div class="nav-links__dropdown">
            <a href="#" class="nav-link nav-link-books">
                <i class="fa-solid fa-book-open"></i>
                Könyvek
                <i class="fa-solid fa-angle-down dropdown-arrow"></i>
            </a>
            <div class="dropdown-items bg-custom-primary text-custom-light">
                <a href="#" class="nav-link all-books"><i class="fa-solid fa-layer-group"></i>&nbsp;Mind</a>
            </div>
        </div>
    </div>
    <!-- PC NAVIGÁCIÓ VÉGE -->
</nav>