class Content {
    params;

    constructor(params) {
        this.params = params;
    }

    display() {
        this.params.container.empty();

        $.get(this.params.template, (response) => {
            this.templateObj = $().add(response);

            //adatok lekérdezése
            this.getData();

        });
    }

    getData() {
        let currentFilter;

        if (this.params.filter) {
            currentFilter = this.params.filter;
        } else currentFilter = "";

        $.ajax({
            url: "modules/get_content_data.php",
            type: "POST",
            dataType: "json",
            data: {
                table: this.params.table,
                filter: currentFilter,
                foreignJoins: JSON.stringify(this.params.foreignJoins)
            },
            success: (res) => {
                this.dataSource = res;
                this.generateContent();
            }
        });
    }

    generateContent() {
        if (this.params.headline) {
            let headlineObj = $("<div>"+this.params.headline.title+"</div>");
            if (this.params.headline.style) headlineObj.addClass(this.params.headline.style);
            if (this.params.headline.container) {
                this.params.headline.container.empty();
                headlineObj.appendTo(this.params.headline.container);
            }
            else headlineObj.appendTo(this.params.container);
        }

        $.each(this.dataSource, (idx, item) => {            
            let articleObj = this.templateObj.clone();
            let articleHtml = articleObj.html();

            // behelyettesítem az adatokat a template-be
            for (let i = 0; i < this.params.fields.length; i++) {
                articleHtml = articleHtml.replace(new RegExp("{{"+this.params.fields[i].field+"}}", "g"), item[this.params.fields[i].field]);
                articleObj.html(articleHtml);
            }

            // behelyettesítem az idegen táblából érkező mezők értékeit a template-be
            for (let i = 0; i < this.params.foreignJoins.length; i++) {
                for (let j = 0; j < this.params.foreignJoins[i].fields.length; j++) {
                    let text = "";

                    if (item[this.params.foreignJoins[i].fields[j]]) {                        
                        text = item[this.params.foreignJoins[i].fields[j]];
                    }

                    articleHtml = articleHtml.replace(new RegExp("{{"+this.params.foreignJoins[i].fields[j]+"}}", "g"), text);
                    articleObj.html(articleHtml);
                    
                }
            }

            // gombok kezelése
            this.generateButtons(item, articleObj);
    

            articleObj.appendTo(this.params.container);
        });
    }

    generateButtons(data, articleObj) {
        // gombok paraméter bejárása
        if (this.params.buttons) {
            for (let i = 0; i < this.params.buttons.length; i++) {
                let currentButton = articleObj.find(this.params.buttons[i].obj);

                currentButton.data("ownParams", this.params.buttons[i]);
                currentButton.data("getData", data[this.params.buttons[i].field]);

                currentButton.click(() => {
                    currentButton.data("ownParams").onClick( currentButton.data("getData"), currentButton.data("ownParams") );
                });
            }
        }
    }


}