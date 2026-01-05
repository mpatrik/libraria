class Menu {
    params;

    constructor(params) {
        this.params = params;
    }

    display() {
        if (this.params.menuTable) { // ha a menüpontokat tábla tartalmazza
            this.getMenuItems();
        } else {
            for (let i = 0; i < this.params.menuItemsArray.length; i++) {
                let menuItem = $("<div>"+this.params.menuItemsArray[i].name+"</div>");
                menuItem.addClass(this.params.menuItemsArray[i].style);
                menuItem.addClass("menu-item");

                menuItem.data("id", this.params.menuItemsArray[i].id);

                menuItem.click(() => {
                    this.onClick(menuItem);
                });

                menuItem.appendTo(this.params.container);
            }
        }
    }

    onClick(currentMenuItem) {
        if (this.params.menuItemStyle) this.params.container.find("." + this.params.menuItemStyle).removeClass(this.params.menuActive);
        else this.params.container.find(".menu-item").removeClass(this.params.menuActive);
        currentMenuItem.addClass(this.params.menuActive);

        if (this.params.chooseMenu) { // ha létezik a callback
            this.params.chooseMenu(currentMenuItem.data("id"), currentMenuItem.data("name"));
        }
    }

    getMenuItems() {
        let idField = "";
        let nameField = "";

        if (this.params.idAlias) idField = this.params.idAlias;
        else idField = "id";

        if (this.params.nameAlias) nameField = this.params.nameAlias;
        else nameField = "name";

        $.ajax({
            url: "modules/get_menu_items.php",
            type: "POST",
            dataType: "json",
            data: { table: this.params.menuTable },
            success: (res) => {
                // válasz bejárása és a menüpontok létrehozása
                $.each(res, (idx, item) => {
                    let menuItem = $("<a href='#'><span>"+item[nameField]+"</span></a>");

                    if (this.params.menuItemStyle) menuItem.addClass(this.params.menuItemStyle);
                    else menuItem.addClass("menu-item");

                    if (this.params.icon) {
                        let iconImage = $(item[this.params.icon]);
                        iconImage.insertBefore(menuItem.find("span"));
                        if (this.params.iconStyle) iconImage.addClass(this.params.iconStyle);
                    }

                    menuItem.data("id", item[idField]);
                    menuItem.data("name", item[nameField]);

                    menuItem.click(() => {
                        this.onClick(menuItem);
                    });

                    menuItem.appendTo(this.params.container);
                });

                // vége
            }
        });
    }


}