$.fn.orderController = function(par) {
    let containerObj = this;
    let orderObj = {
        params: par,
        init: function() {
            $.get(orderObj.params.template, function(response) {
                orderObj.form = $().add(response);

                containerObj.append(orderObj.form);

                orderObj.form.find(".order-save-btn").click(function() {
                    orderObj.sendOrder();
                });

                orderObj.getLists();

            });
        },
        getLists: function() {
            if (orderObj.params.lists) {
                $.ajax({
                    url: "modules/get_order_lists.php",
                    type: "POST",
                    dataType: "json",
                    data: orderObj.params.lists,
                    success: function(res) {
                        orderObj.generateListOptions(res);
                    }
                });
            }
        },
        generateListOptions: function(res) {
            $.each(res, function(idx, item) {
                let htmlListObj = $(orderObj.params.lists[idx].htmlSelect);

                $.each(item, function(idx2, data) {
                    let id = data[orderObj.params.lists[idx].fields.key];
                    let value = data[orderObj.params.lists[idx].fields.value];

                    $("<option value='"+id+"'>"+value+"</option>").appendTo(htmlListObj);
                });
            });
        },
        isValid: function () {
            let fields = orderObj.form.find(".order-field");
            let email = orderObj.form.find(".order-field[type='email']");
            let valid = true;
            let errorText = $("<span class='error-text'></span>");

            orderObj.form.find(".error-text").remove();
            fields.removeClass("order-error");

            if (email.val() && !email.val().includes("@")) {
                let errorTextClone = errorText.clone();
                errorTextClone.html("*Hibás email!");

                email.addClass("order-error");

                errorTextClone.insertBefore(email);

                valid = false;
            }

            $.each(fields, (idx, field) => {
                field = $(field);                                

                if (!field.val() || field.val() == 0) {  
                    let errorTextClone = errorText.clone();
                    errorTextClone.html("*Kötelező kitöltés!");   

                    field.addClass("order-error");

                    errorTextClone.insertBefore(field);

                    valid = false;
                }
            });
            
            return valid;
        },
        sendOrder: function() {
            if (!orderObj.isValid()) {
                if (orderObj.params.notifWindow) {
                    orderObj.params.notifWindow.main.find(orderObj.params.notifWindow.body).empty();
                    orderObj.params.notifWindow.content.fail.appendTo(orderObj.params.notifWindow.main.find(orderObj.params.notifWindow.body));
                } else {
                    alert("Megrendelés sikertelen! Hiányos vagy hibás kitöltés!");
                }
                
            } else {
                let postData = {};

                // adatcsoportok összeszedése
                let dataGroups = orderObj.form.find(".datagroup");

                for (let i = 0; i < dataGroups.length; i++) {
                    postData[$(dataGroups[i]).data("table")] = {};

                    let fields = $(dataGroups[i]).find(".order-field");

                    for (let j = 0; j < fields.length; j++) {
                        postData[$(dataGroups[i]).data("table")][$(fields[j]).data("field")] = $(fields[j]).val();
                    }
                }          

                $.ajax({
                    url: "modules/save_order.php",
                    type: "POST",
                    dataType: "json",
                    data: {
                        data: postData,
                        keyData: orderObj.params.customerKeyData,
                        orderData: orderObj.params.orderKeyData,
                        orderItems: orderObj.params.itemsKeyData
                    },
                    success: function(res) {
                        if (orderObj.params.notifWindow) {
                            orderObj.params.notifWindow.main.find(orderObj.params.notifWindow.body).empty();
                            orderObj.params.notifWindow.content.success.appendTo(orderObj.params.notifWindow.main.find(orderObj.params.notifWindow.body));
                        } else {
                            alert("Sikeres megrendelés! Köszönjük, hogy nálunk vásárolt!");
                        }

                        orderObj.params.orderEnd();
                    }
                });

            }
            
        }
    };

    orderObj.init();

    return orderObj;
}