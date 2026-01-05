$.fn.userController = function(par) {
    let containerObj = this;
    let userObj = {
        params: par,
        init: function() {
            userObj.isLoggedIn(res => {
                if (res) { // ha be van lépve
                    userObj.loginSuccess(res);
                } else {
                    userObj.loginController();
                }
            });
        },
        isLoggedIn: function(loginGuard) {
            $.ajax({
                url: userObj.params.apiBase + "logincheck",
                type: "POST",
                dataType: "json",
                data: {},
                success: function (res) {
                    loginGuard(res);
                }
            });
        },
        loginController: function() {
            containerObj.empty();

            $.get(userObj.params.login.template, (res) => {
                let tempObj = $().add(res);

                userObj.loginTemplate = tempObj;

                userObj.loginTemplate.appendTo(containerObj);

                userObj.loginTemplate.find(userObj.params.login.loginButton).click(() => {
                    userObj.login();
                });

                userObj.loginTemplate.find(userObj.params.login.toSignupButton).click(() => {
                    userObj.signupController();
                });
            });
        },
        login: function() {
            let postFields = {};

            for (let i = 0; i < userObj.params.login.fields.length; i++) {
                postFields[userObj.params.login.fields[i]] = userObj.loginTemplate.find("." + userObj.params.login.fields[i]).val();
            }           

            $.ajax({
                url: userObj.params.apiBase + "loginguard",
                type: "POST",
                dataType: "json",
                data: {
                    data: postFields,
                    passwordField: userObj.params.login.passwordField
                },
                success: function (res) {
                    if (!res.error) {
                        userObj.loginSuccess(res);
                    } else {
                        $(userObj.params.login.formContainer).find(".errors").remove();

                        let error = $("<div class='errors'>" + res.error + "</div>");

                        error.insertBefore($(userObj.params.login.form));
                    }
                }
            });
        },
        signupController: function() {
            $.get(userObj.params.signup.template, (res) => {
                let tempObj = $().add(res);

                userObj.signupTemplate = tempObj;

                containerObj.empty();
                userObj.signupTemplate.appendTo(containerObj);

                userObj.signupTemplate.find(userObj.params.signup.signupButton).click(() => {
                    userObj.signup();
                });

                userObj.signupTemplate.find(userObj.params.signup.toLoginButton).click(() => {
                    userObj.loginController();
                });
            });
            
        },
        signup: function() {
            let postFields = {};

            for (let i = 0; i < userObj.params.signup.fields.length; i++) {
                postFields[userObj.params.signup.fields[i]] = userObj.signupTemplate.find("." + userObj.params.signup.fields[i]).val();
            }               

            $.ajax({
                url: userObj.params.apiBase + "signupguard",
                type: "POST",
                dataType: "json",
                data: {
                    data: postFields,
                    passwordField: userObj.params.signup.passwordField,
                    passwordCheck: $(userObj.params.signup.passwordCheck).val(),
                    emailField: userObj.params.signup.emailField
                },
                success: function (res) {
                    if (!res.error.length) {
                        alert("Sikeres regisztráció!");
                        userObj.loginController();
                    } else {
                        $(userObj.params.signup.formContainer).find(".errors").remove();

                        let errorsContainer = $("<div class='errors'>");

                        for (let i = 0; i < res.error.length; i++) {
                            $("<div>" + res.error[i] + "</div>").appendTo(errorsContainer);
                        }

                        errorsContainer.insertBefore($(userObj.params.signup.form));

                    }
                    
                }
            });
        },
        isAdmin: function(admin) {
            userObj.admin = false;
            if (admin == 1) userObj.admin = true;
        },
        loginSuccess: function(user) {
            userObj.userData = user;
            userObj.isAdmin(user.admin);
            containerObj.empty();

            $.get(userObj.params.loggedIn.headerPanel.template, (res) => {
                let tempObj = $().add(res);
                let tempHtml = tempObj.html();
                

                // felhasználó adatinak beírása
                $.each(user, (idx, item) => {
                    tempHtml = tempHtml.replace(new RegExp("{{"+idx+"}}", "g"), item);
                    tempObj.html(tempHtml);
                });


                tempObj.appendTo(containerObj);

                // gombok clickjének hozzáadása
                $.each(userObj.params.loggedIn.headerPanel.buttons, (idx, item) => {
                    let button = $(userObj.params.loggedIn.headerPanel.buttonsContainer).find(item.obj);
                    
                    if (item.admin && !userObj.admin) button.remove();

                    button.click(() => {
                        item.onClick();
                    });
                });

                
            });
            
        },
        logout: function() {
            $.ajax({
                url: userObj.params.apiBase + "logout",
                type: "POST",
                dataType: "json",
                data: {},
                success: function (res) {
                    userObj.loginController();
                }
            });
        },
        // termék hozzáadása, frissítése és törlése műveletek
        newProduct: function() {
            if (userObj.admin) {
                userObj.getProductLists();

                userObj.productForm = $(userObj.params.adminUser.product.form);

                userObj.productForm.submit(() => {
                    if (userObj.isNewProductValid()) userObj.addProduct();   
                    return false;        
                });
            }
            
        },
        getProductLists: function(callback) {
            if (userObj.params.adminUser.product.selectLists) {
                $.ajax({
                    url: userObj.params.apiBase + "get-product-lists",
                    type: "POST",
                    dataType: "json",
                    data: userObj.params.adminUser.product.selectLists,
                    success: function(res) {
                        userObj.generateProductListOptions(res, callback);
                    }
                });
            }
        },
        generateProductListOptions: function(res, callback) {
            let lists = userObj.params.adminUser.product.selectLists;

            $.each(res, function(idx, item) {
                let htmlListObj = $(lists[idx].htmlSelect);

                $.each(item, function(idx2, data) {
                    let id = data[lists[idx].fields.key];
                    let value = data[lists[idx].fields.value];

                    $("<option value='"+id+"'>"+value+"</option>").appendTo(htmlListObj);
                });
            });

            if (typeof callback === "function") callback();
        },
        addProduct: function () {
            let formData = new FormData(userObj.productForm[0]);
            
            $.ajax({
                url: userObj.params.apiBase + "addproduct",
                type: "POST",
                dataType: "json",
                processData: false,
                contentType: false, 
                caches: false,
                data: formData,
                success: function(res) {
                    alert("Sikeres felöltés!");

                    userObj.productForm[0].reset();
                }
            });
        },
        isNewProductValid: function () {
            let fields = userObj.productForm.find(".product-field");
            let valid = true;
            let errorText = $("<span class='error-text'></span>");

            userObj.productForm.find(".error-text").remove();
            fields.removeClass("form-error");

        
            $.each(fields, (idx, field) => {
                field = $(field);                                

                if (!userObj.params.adminUser.product.new.notRequired.includes(field.data("field"))) {
                    if (!field.val() || field.val() == 0) {  
                        let errorTextClone = errorText.clone();
                        errorTextClone.html("*Kötelező kitöltés!");   

                        field.addClass("form-error");

                        errorTextClone.insertBefore(field);

                        valid = false;
                    }
                }

                
            });
            
            return valid;
        },
        deleteProduct: function(id, params, callback) {
            if (userObj.admin && confirm("Biztos törlöd a terméket?")) {
                $.ajax({
                    url: userObj.params.apiBase + "delete-product",
                    type: "POST",
                    dataType: "json",
                    data: {
                        idField: params.field,
                        id: id
                    },
                    success: function(res) {
                        if (typeof callback === "function") callback();
                    }
                });
                
            }
        },
        updateProductData: function(id, params) {
            if (userObj.admin) {
                $.ajax({
                    url: userObj.params.apiBase + "get-product-by-id",
                    type: "POST",
                    dataType: "json",
                    data: {
                        idField: params.field,
                        id: id
                    },
                    success: function(res) {
                        userObj.generateUpdateProductForm(res);
                    }
                });
                
            }
        },
        generateUpdateProductForm: function(product) {
            userObj.productForm = $(userObj.params.adminUser.product.form);
            let fields = userObj.productForm.find(".product-field");

            userObj.getProductLists(() => {
                userObj.productForm.find(userObj.params.adminUser.product.update.caption).html(
                    "Adatmódosítás (cikkszám: " + product[userObj.params.adminUser.product.update.idField] + ")"
                );

                $("<input type='hidden' name='"+userObj.params.adminUser.product.update.idField+"' value='" + product[userObj.params.adminUser.product.update.idField] + "'>").appendTo(userObj.productForm);

                $.each(fields, (idx, field) => {
                    field = $(field);

                    if (!userObj.params.adminUser.product.update.notGenerated.includes(field.data("field"))) {
                        field.val(product[field.data("field")]);
                    }
                });
            });

            

            userObj.productForm.submit(() => {
                if (userObj.isUpdateProductValid()) userObj.updateProduct();   
                return false;        
            });
        },
        updateProduct: function() {
            let formData = new FormData(userObj.productForm[0]);
        
            $.ajax({
                url: userObj.params.apiBase + "update-product",
                type: "POST",
                dataType: "json",
                processData: false,
                contentType: false, 
                caches: false,
                data: formData,
                success: function(res) {
                    alert("Adatok sikeresen módosítva!");
                }
            });
        },
        isUpdateProductValid: function () {
            let fields = userObj.productForm.find(".product-field");
            let valid = true;
            let errorText = $("<span class='error-text'></span>");

            userObj.productForm.find(".error-text").remove();
            fields.removeClass("form-error");

        
            $.each(fields, (idx, field) => {
                field = $(field);                                

                if (!userObj.params.adminUser.product.update.notRequired.includes(field.data("field"))) {
                    if (!field.val() || field.val() == 0) {  
                        let errorTextClone = errorText.clone();
                        errorTextClone.html("*Kötelező kitöltés!");   

                        field.addClass("form-error");

                        errorTextClone.insertBefore(field);

                        valid = false;
                    }
                }

            });
            
            return valid;
        }
        
    };

    userObj.init();

    return userObj;
}