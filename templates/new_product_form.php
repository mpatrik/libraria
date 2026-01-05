<form enctype="multipart/form-data" method="post" class="product-form-container">
    <div data-table="konyvek" class="datagroup">
        <h3 class="title-font my-3 caption">Új könyv adatai</h3>
        <div class="product-data">
            <div class="inputarea">
                <input type="text" name="cim" data-field="cim" class="product-field" placeholder="">
                <label>Cím</label>
            </div>
            <div class="inputarea">
                <input type="text" name="szerzo" data-field="szerzo" class="product-field" placeholder="">
                <label>Szerző</label>
            </div>
            <div class="inputarea">
                <input type="text" name="kiado" data-field="kiado" class="product-field" placeholder="">
                <label>Kiadó</label>
            </div>
            <div class="inputarea">
                <input type="number" name="kiadasi_ev" data-field="kiadasi_ev" class="product-field" placeholder="" min=0>
                <label>Kiadási év</label>
            </div>
            <div class="inputarea">
                <input type="number" name="oldalszam" data-field="oldalszam" class="product-field" placeholder="" min=0>
                <label>Oldalszám</label>
            </div>
            <div class="inputarea">
                <input type="text" name="isbn" data-field="isbn" class="product-field" placeholder="">
                <label>ISBN</label>
            </div>
            <div class="inputarea">
                <input type="text" name="borito" data-field="borito" class="product-field" placeholder="">
                <label>Borító</label>
            </div>
            <div class="inputarea">
                <input type="text" name="suly" data-field="suly" class="product-field" placeholder="">
                <label>Súly</label>
            </div>
            <div class="inputarea">
                <input type="number" name="ar" data-field="ar" class="product-field" placeholder="" min=0>
                <label>Ár</label>
            </div>
            <div class="inputarea">
                <select data-field="mufaj" name="mufaj" class="product-field category-list product-list">
                    <option value="0">Válasszon műfajt</option>
                </select>
            </div>
            <div class="inputarea">
                <select data-field="sorozat" name="sorozat" class="product-field series-list product-list">
                    <option value="0">Válasszon sorozatot</option>
                </select>
            </div>
            <div class="inputarea">
                <select data-field="nyelv" name="nyelv" class="product-field language-list product-list">
                    <option value="0">Válasszon nyelvet</option>
                </select>
            </div>
            <div class="inputarea">
                <input type="file" data-field="kep" name="kep" class="product-field" accept="image/*">
                <label>Kép</label>
            </div>
            <div class="inputarea">
                <textarea data-field="leiras" name="leiras" class="product-field" placeholder=""></textarea>
                <label>Leírás</label>
            </div>
        </div>
        <input type="checkbox" id="special" data-field="kiemelt" name="kiemelt" class="product-field checkbox" value="0"><label for="special">&nbsp;Kiemelt</label>
    </div>

    <button class="add-product-btn border-0 bg-custom-secondary text-custom-primary rounded-2"><i class="fa-solid fa-circle-plus"></i>&nbsp;Hozzáadás</button>
</form>


