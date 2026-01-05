let cart = null;
let user = null;

$(document).ready(function(){
    generateHeader();
    
    generatePage("pages/home_page.php", () => {
        let carouselHighlights = new bootstrap.Carousel("#carouselHighlights");
        displayHighlights();
    });



});

// megjeleníti a kategória menüpontokat a fejlécben
function displayCategoriesHeader() {
    let categoriesPC = initCategories();
    categoriesPC.params.container = $(".dropdown-items");

    categoriesPC.display();


    let categoriesMobile = initCategories();
    categoriesMobile.params.container = $(".navbar-nav");
    categoriesMobile.params.menuItemStyle = "nav-link text-custom-secondary";

    categoriesMobile.display();

}

// megjeleníti a kategória menüpontokat a termékek oldalon
function displayCategoriesProducts() {
    let categories = initCategories();

    categories.params.container = $(".categories");
    categories.params.menuItemStyle = "category-item";
    categories.params.menuActive = "active-category";
    categories.params.chooseMenu = function (menuId, name) {
        displayProductsByCategory(menuId, name);
    }

    $(".categories .all-books").click(function() {
        displayProductsAll();
        categories.params.container.find("." + categories.params.menuItemStyle).removeClass(categories.params.menuActive);
        $(this).addClass(categories.params.menuActive);
    });

    categories.display();
}

// megjeleníti az összes terméket a termékek oldalon
function displayProductsAll() {
    let product = initContent();

    product.params.headline = {
        title: "Könyvek",
        container: $(".products-headline")
    };

    product.display();
}

// megjeleníti az összes terméket az admin oldalon
function displayProductsAllAdmin() {
    let product = initContent();

    product.params.container = $(".products-table__content");
    product.params.template = "templates/single_product_admin.php";
    product.params.fields = [
        { field : "cikkszam" },
        { field : "cim" },
        { field : "szerzo" },
        { field : "kiadasi_ev" },
        { field : "isbn" },
        { field : "ar" },
    ];
    product.params.buttons = [
        {
            obj: ".title",
            field: "cikkszam",
            onClick: function(id) {
                generatePage("pages/product_view_page.php", () => {
                    displayProductById(id);
                });
            }
        },
        {
            obj: ".delete-product",
            field: "cikkszam",
            onClick: function(id, params) {
                user.deleteProduct(id, params, () => {
                    displayProductsAllAdmin();
                });
            }
        },
        {
            obj: ".update-product",
            field: "cikkszam",
            onClick: function(id, params) {
                generateAdminContent("templates/new_product_form.php", () => {
                    user.updateProductData(id, params);
                });
                
            }
        }
    ];
    

    product.display();
}

// megjeleníti a termékeket kategória szerint szűrve
function displayProductsByCategory(categoryId, categoryTitle) {
    let product = initContent();

    product.params.filter = "mufaj="+categoryId;
    product.params.headline = {
        title: categoryTitle,
        container: $(".products-headline")
    };

    product.display();
}

// megjeleníti a kiemelt termékeket a kezdőlapon
function displayHighlights() {
    let product = initContent();

    product.params.container = $(".highlights");
    product.params.filter = "kiemelt=1";
    product.params.headline = {
        title: "<hr><h2>Mindenkinek ajánlott</h2><hr>",
        style: "highlights-headline title-font"
    };

    product.display();
}

// megjelenít egy terméket az azonosítójára (cikkszám) szűrve
function displayProductById(id) {
    let product = new Content({
        container: $(".current-product-container"),
        table: "konyvek",
        template: "templates/single_product.php",
        fields: [
            { field: "cim" },
            { field: "kep" },
            { field: "ar", numberFormat: true },
            { field: "szerzo" },
            { field: "borito" },
            { field: "leiras" },
            { field: "kiado" },
            { field: "kiadasi_ev" },
            { field: "oldalszam" },
            { field: "isbn" },
            { field: "suly" }
        ],
        foreignJoins: [
            {
                foreignFieldName: "nyelv",
                foreignTable: "nyelvek",
                foreignId: "nyelv_id",
                fields: ["nyelv_megnevezes", "nyelv_ikon"]
            },
            {
                foreignFieldName: "mufaj",
                foreignTable: "konyv_mufajok",
                foreignId: "mufaj_id",
                fields: ["mufaj_megnevezes"]
            },
            {
                foreignFieldName: "sorozat",
                foreignTable: "konyv_sorozatok",
                foreignId: "sorozat_id",
                fields: ["sorozat_megnevezes"]
            }
        ],
        buttons: [
            {
                obj: ".add-to-cart",
                field: "cikkszam",
                onClick: function(id) {
                    cart.addToCart(id);
                }
            },
            {
                obj: ".breadcrumb-home",
                onClick: function() {
                    generatePage("pages/home_page.php", () => {
                        let carouselHighlights = new bootstrap.Carousel("#carouselHighlights");
                        displayHighlights();
                    });
                    
                }
            },
            {
                obj: ".breadcrumb-products",
                onClick: function() {
                    generatePage("pages/products_page.php", () => {
                        displayProductsAll();
                        displayCategoriesProducts();
                    });
                }
            },
            {
                obj: ".breadcrumb-category",
                field: "mufaj",
                onClick: function(categoryId) {
                    generatePage("pages/products_page.php", () => {
                        $.ajax({
                            url: "modules/get_category_name.php",
                            type: "post",
                            dataType: "json",
                            data: {
                                category: categoryId,
                                table: "konyv_mufajok",
                                idField: "mufaj_id",
                                nameField: "mufaj_megnevezes"
                            },
                            success: function(res) {
                                displayProductsByCategory(categoryId, res.mufaj_megnevezes);
                                displayCategoriesProducts();
                            }
                        }); 
                    });
                }
            }
        ],
        filter: "cikkszam=" + id
    });
    

    product.display();
}

// cím szerint keres rá termékekre és megjeleníti a termékek oldalon
function search(keyword) {
    let product = initContent();

    product.params.filter = "cim like '%"+keyword+"%'";
    product.params.headline = {
        title: "Találatok: "+keyword,
        container: $(".products-headline")
    };

    product.display();
}

// elindítja a megrendelés folyamatát
function order() {
    generatePage("pages/order_page.php", () => {
        $("#order").orderController({
            template: "templates/order_form.php",
            notifWindow: {
                main: $("#successNotification"),
                body: ".modal-body",
                content: {
                    fail: $("<i class='fa-solid fa-circle-xmark order-modal-icon order-fail-icon'></i><div>Sajnáljuk, de a megrendelés meghíusult!<br>Lehetséges, hogy hiányosan vagy nem megfelelően adta meg az adatokat.</div>"),
                    success: $("<i class='fa-solid fa-circle-check order-modal-icon order-success-icon'></i><div>Sikeres megrendelés!<br>Köszönjük, hogy nálunk vásárolt, várjuk vissza legközelebb is!</div>")
                }
            },
            orderEnd: function () {
                cart.emptyCart();
                generatePage("pages/home_page.php", () => {
                    let carouselHighlights = new bootstrap.Carousel("#carouselHighlights");
                    displayHighlights();
                });
            },
            lists: {
                payMethodList: {
                    table: "fizetesi_modok",
                    fields: {
                        key: "fizmod_id",
                        value: "fizmod_megnev"
                    },
                    htmlSelect: ".fizetesi-modok-lista"
                },
                shipMethodList: {
                    table: "szallitasi_modok",
                    fields: {
                        key: "szallmod_id",
                        value: "szallmod_megnev"
                    },
                    htmlSelect: ".szallitasi-modok-lista"
                },
                taxpayerList: {
                    table: "adoalany",
                    fields: {
                        key: "adoalany_id",
                        value: "adoalany_megnev"
                    },
                    htmlSelect: ".adoalany-lista"
                }
            },
            customerKeyData: { // megrendelő kezelése esetén mely táblában milyen mező létezését figyelje
                table: "megrendelok",
                field: "email",
                keyField: "megrendelo_id",
                passwordField: "jelszo"
            },
            orderKeyData: {
                table: "megrendeles_adatok",
                customerField: "megrendelo_id",
                dateField: "idopont"
            },
            itemsKeyData: {
                table: "megrendeles_tetelek",
                cartFields: [
                    "cikkszam",
                    "ar",
                    "quantity"
                ],
                orderId: "megrendeles_id"
            }
        });
    });
}

// legenerálja a fejlécet
function generateHeader() {
    let template;

    $.get("templates/header.php", (response) => {
        template = $(response);

        template.appendTo($(".header"));

        displayCategoriesHeader();

        $("#search").click(function() {
            generatePage("pages/products_page.php", () => {
                search($("#keyword").val());
                displayCategoriesProducts();
            });
        });

        $("#keyword").keydown(function(e) {
            if (e.keyCode === 13) {
                generatePage("pages/products_page.php", () => {
                    search($("#keyword").val());
                    displayCategoriesProducts();
                });
            }
        });

        $(".nav-link-home, .navbar-logo").click(function() {
            generatePage("pages/home_page.php", () => {
                let carouselHighlights = new bootstrap.Carousel("#carouselHighlights");
                displayHighlights();
            });
        });

        $(".all-books, .nav-link-books").click(function() {
            generatePage("pages/products_page.php", () => {
                displayProductsAll();
                displayCategoriesProducts();
            });
        });

        // a kosár plugin felparaméterezése
        cart = $(".cart-body").cartController({
            quantity: $(".cart-quantity-display"),
            itemsContainerStyle: "cart-items",
            itemQuantityDecrease: ".item-quantity-decrease",
            itemQuantityIncrease: ".item-quantity-increase",
            itemDelete: ".item-delete",
            emptyMessage: "<div class='empty-cart-msg'><i class='fa-regular fa-face-frown'></i><span>Üres a kosara...<span></div>",
            title: "Kosár",
            titleStyle: "cart-title",
            table: "konyvek",
            productId: "cikkszam",
            itemTemplate: "templates/cart_item.php",
            priceField: "ar",
            emptyButtonContent: "<i class='fa fa-trash'></i> Kiürít",
            emptyButtonStyle: "cart-empty-button rounded-2 bg-custom-danger py-2 px-3 mb-3",
            totalPriceTitle: "Fizetendő",
            totalPriceStyle: "cart-total-price",
            fields: [
                "kep",
                "cim",
                "quantity",
                "tetelAr",
                "szerzo"
            ],
            buttons: [
                {
                    name: "Rendelés",
                    style: "order-btn",
                    onClick: function() {
                        order();
                    }
                }
            ]

        });

        // a user plugin felparaméterezése
        user = $(".header__user-body").userController({
            apiBase: "http://localhost/IEC2024/mestermunka/libraria/api/",
            login: {
                template: "templates/login_tpl.php",
                fields: [
                    "felhasznalo_email",
                    "felhasznalo_jelszo"
                ],
                passwordField: "felhasznalo_jelszo",
                loginButton: "#login",
                toSignupButton: "#goto-signup",
                form: ".userform",
                formContainer: ".userform-container"
            },
            signup: {
                template: "templates/signup_tpl.php",
                fields: [
                    "felhasznalo_nev",
                    "felhasznalo_email",
                    "felhasznalo_jelszo"
                ],
                passwordField: "felhasznalo_jelszo",
                passwordCheck: "#regpass2",
                emailField: "felhasznalo_email",
                signupButton: "#signup",
                toLoginButton: "#goto-login",
                form: ".userform",
                formContainer: ".userform-container"
            },
            loggedIn: {
                headerPanel: {
                    template: "templates/header_userpanel.php",
                    buttonsContainer: ".user-panel__buttons",
                    buttons: [
                        {
                            obj: ".profile-btn",
                            onClick: function() {
                                $(".header__user-body").toggle();
                                $(".header__user-container").toggleClass("open");
                                // funkciója fejlesztés alatt...
                            }
                        },
                        {
                            obj: ".myorders-btn",
                            onClick: function() {
                                $(".header__user-body").toggle();
                                $(".header__user-container").toggleClass("open");
                                // funkciója fejlesztés alatt...
                            }
                        },
                        {
                            obj: ".admin-btn",
                            admin: true,
                            onClick: function() {
                                generatePage("pages/admin_page.php", () => {
                                    $("#admin__books-btn").click(() => {
                                        generateAdminContent("templates/products_table.php", () => {
                                            displayProductsAllAdmin();
                                        });
                                    });

                                    $("#admin__new-book-btn").click(() => {
                                        generateAdminContent("templates/new_product_form.php", () => {
                                            user.newProduct();
                                        });
                                    });
                                });

                                $(".header__user-body").toggle();
                                $(".header__user-container").toggleClass("open");
                            }
                        },
                        {
                            obj: ".logout-btn",
                            onClick: function() {
                                user.logout();
                            }
                        }
                    ]
                }
            },
            adminUser: {
                product: {
                    form: ".product-form-container",
                    selectLists: {
                        categoryList: {
                            table: "konyv_mufajok",
                            fields: {
                                key: "mufaj_id",
                                value: "mufaj_megnevezes"
                            },
                            htmlSelect: ".category-list"
                        },
                        seriesList: {
                            table: "konyv_sorozatok",
                            fields: {
                                key: "sorozat_id",
                                value: "sorozat_megnevezes"
                            },
                            htmlSelect: ".series-list"
                        },
                        languageList: {
                            table: "nyelvek",
                            fields: {
                                key: "nyelv_id",
                                value: "nyelv_megnevezes"
                            },
                            htmlSelect: ".language-list"
                        }
                    },
                    new: {
                        addProductButton: "add-product-btn",
                        notRequired: [
                            "sorozat",
                            "kiemelt"
                        ],
                    },
                    update: {
                        idField: "cikkszam",
                        caption: ".caption",
                        notGenerated: [
                            "kep",
                            "kiemelt"
                        ],
                        notRequired: [
                            "kep",
                            "kiemelt",
                            "sorozat"
                        ],
                    }
                }
            }
        });


        $(".user-toggle").click(() => {
            $(".header__user-body").toggle();
            $(".header__user-container").toggleClass("open");
        });

        $(".cart-toggle").click(function() {
            $(".cart-body").toggle();
            $(".cart-container").toggleClass("open");
            $(".cart-quantity").toggleClass("open");
        });

    });

}

// megjeleníti a main container-be a megfelelő főtartalmat
// a "template" meghatározza, hogy mi legyen az oldal html struktúrája
// a "callback" egy függvény ami meghívódik és a használatkor dől el, hogy mit csinál
function generatePage(template, callback) {
    $(".main").empty();

    $.get(template, (response) => {
        $(response).appendTo($(".main"));

       if (typeof callback === "function") callback();
    });
}

// megjeleníti az admin oldalon a megfelelő tartalmat ugyanazzal a logikával mint a generatePage() függvény
function generateAdminContent(template, callback) {
    $(".admin-content").empty();

    $.get(template, (response) => {
        $(response).appendTo($(".admin-content"));

       if (typeof callback === "function") callback();
    });
}

// létrehoz egy terméket egy gyakran használt paraméterezéssel
function initContent() {
    let product = new Content({
        container: $(".products"),
        table: "konyvek",
        template: "templates/product_card.php",
        fields: [
            {
                field: "cim",
            },
            {
                field: "kep",
            },
            {
                field: "ar",
                numberFormat: true
            },
            {
                field: "szerzo"
            },
            {
                field: "borito"
            }
        ],
        foreignJoins: [
            {
                foreignFieldName: "nyelv",
                foreignTable: "nyelvek",
                foreignId: "nyelv_id",
                fields: ["nyelv_megnevezes", "nyelv_ikon"]
            }
        ],
        buttons: [
            {
                obj: ".add-to-cart",
                field: "cikkszam",
                onClick: function(id) {
                    cart.addToCart(id);
                }
            },
            {
                obj: ".product-card__title",
                field: "cikkszam",
                onClick: function(id) {
                    generatePage("pages/product_view_page.php", () => {
                        displayProductById(id);
                    });
                }
            },
            {
                obj: ".product-card__img",
                field: "cikkszam",
                onClick: function(id) {
                    generatePage("pages/product_view_page.php", () => {
                        displayProductById(id);
                    });
                }
            }
        ]
    });

    return product;
}

// lérehozza a kategóriák menüt alap paraméterekkel
function initCategories() {
    return new Menu({
        container: $(),
        menuTable: "konyv_mufajok",
        menuActive: "active-menu",
        chooseMenu: function(menuId, name) {
            generatePage("pages/products_page.php", () => {
                displayProductsByCategory(menuId, name);
                displayCategoriesProducts();
            });
        },
        idAlias: "mufaj_id",
        nameAlias: "mufaj_megnevezes",
        menuItemStyle: "nav-link",
        icon: "mufaj_ikon",
        iconStyle: "nav-link-icon"
    });
}



