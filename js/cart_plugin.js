$.fn.cartController = function(par) {
    let containerObj = this;
    let cartObj = {
        params: par,
        init: function() {
            cartObj.refresh();
        },
        refresh: function() {
            $.ajax({
                url: "modules/cart_refresh.php",
                type: "POST",
                dataType: "json",
                data: {  },
                success: function(response) {
                    cartObj.displayItems(response);
                }
            });
        },
        displayItems: function(response) {
            // frissítjük a tételszámlálót
            cartObj.params.quantity.html(response.cart_size);

            if (response.cart_size === 0) {
                if (cartObj.params.emptyMessage) containerObj.html(cartObj.params.emptyMessage);
                else containerObj.html("Az Ön kosara jelenleg üres!");
            } else { // ha a kosár nem üres
                containerObj.empty();

                if (cartObj.params.title) {
                    let cartTitle = $("<div>"+ cartObj.params.title +"</div>");

                    if (cartObj.params.titleStyle) cartTitle.addClass(cartObj.params.titleStyle);
                    else {
                        cartTitle.css({
                            "text-align": "center",
                            "font-weight": "bold",
                            "padding-bottom": "10px",
                            "margin-bottom": "20px",
                            "border-bottom": "1px solid black"
                        });
                    }

                    cartTitle.appendTo(containerObj);
                }

                cartObj.generateEmptyCartBtn();
                cartObj.generateItems(response);
            }
        },
        addToCart: function(id) {
            $.ajax({
                url: "modules/add_to_cart.php",
                type: "POST",
                dataType: "json",
                data: { 
                    table: cartObj.params.table,
                    productId: cartObj.params.productId,
                    id: id
                },
                success: function(response) {
                    cartObj.refresh();
                }
            });
        },
        generateItems: function(cart) {
            let itemsContainer = $("<div>");
            if (cartObj.params.itemsContainerStyle) itemsContainer.addClass(cartObj.params.itemsContainerStyle);

            $.get(cartObj.params.itemTemplate, (template) => {
                let templateObj = $().add(template);


                let totalPrice = 0;

                $.each(cart.cart_items, function(idx, item) {
                    let itemObj = templateObj.clone(true, true);
                    let itemHtml = itemObj.html();

                    for (let i = 0; i < cartObj.params.fields.length; i++) {
                        if (cartObj.params.fields[i] === "tetelAr") {
                            let calcPrice = item["quantity"]*item[cartObj.params.priceField];
                            totalPrice += calcPrice;

                            itemHtml = itemHtml.replace(new RegExp("{{" + cartObj.params.fields[i] + "}}", "g"), calcPrice.toLocaleString());
                        } else {
                            itemHtml = itemHtml.replace(new RegExp("{{" + cartObj.params.fields[i] + "}}", "g"), item[cartObj.params.fields[i]]);
                        }

                    }

                    itemObj.html(itemHtml);

                    itemObj.find(cartObj.params.itemDelete).click(function() {
                        cartObj.deleteItem(idx);
                    });

                    itemObj.find(cartObj.params.itemQuantityDecrease).click(function() {
                        cartObj.updateItemQuantity(idx, -1);
                    });

                    itemObj.find(cartObj.params.itemQuantityIncrease).click(function() {
                        cartObj.updateItemQuantity(idx, 1);
                    });

                    itemObj.appendTo(itemsContainer);
                });

                itemsContainer.appendTo(containerObj);
                // összegzés
                let totalPriceTitle = "Total"
                if (cartObj.params.totalPriceTitle) totalPriceTitle = cartObj.params.totalPriceTitle;

                let totalPriceContainer = $("<div>" + totalPriceTitle +": " + totalPrice.toLocaleString() + " Ft</div>");

                if (cartObj.params.totalPriceStyle) totalPriceContainer.addClass(cartObj.params.totalPriceStyle);

                totalPriceContainer.appendTo(containerObj);
                // összegzés vége

                // gombok generálása
                if (cartObj.params.buttons) {
                    for (let i = 0; i < cartObj.params.buttons.length; i++) {
                        let btn = $("<button>"+cartObj.params.buttons[i].name+"</button>");
                        btn.addClass(cartObj.params.buttons[i].style);

                        btn.data("ownData", cartObj.params.buttons[i]);
                        
                        btn.click(function() {
                            $(this).data("ownData").onClick();
                        });

                        btn.appendTo(containerObj);
                    }
                }
                // vége
            });
        },
        generateEmptyCartBtn: function() {
            let emptyButton = $("<div>");

            if (cartObj.params.emptyButtonContent) emptyButton.html(cartObj.params.emptyButtonContent);
            else emptyButton.html("Empty cart");

            if (cartObj.params.emptyButtonStyle) emptyButton.addClass(cartObj.params.emptyButtonStyle);
            else {
                emptyButton.css({
                    "background": "orange",
                    "padding": "8px",
                    "cursor": "pointer",
                    "margin-bottom": "8px",
                    "width": "30%",
                    "text-align": "center",
                    "margin-left": "auto"
                });
            }
            
            emptyButton.click(function() {
                if (confirm("Valóban törli az összes kosártételt?")) {
                    cartObj.emptyCart();
                }
            });

            emptyButton.appendTo(containerObj);
        },
        emptyCart: function () {
            $.ajax({
                url: "modules/empty_cart.php",
                type: "POST",
                dataType: "json",
                data: {},
                success: function(response) {
                    cartObj.refresh();
                }
            });
        },
        deleteItem: function(idx) {
            $.ajax({
                url: "modules/cart_item_delete.php",
                type: "POST",
                dataType: "json",
                data: { id: idx },
                success: function(response) {
                    cartObj.refresh();
                }
            });
        },
        updateItemQuantity: function(idx, difference) {
            $.ajax({
                url: "modules/cart_item_update_quantity.php",
                type: "POST",
                dataType: "json",
                data: {
                    id: idx,
                    difference: difference
                },
                success: function(response) {
                    cartObj.refresh();
                }
            });
        }
    };


    cartObj.init();

    return cartObj;
};