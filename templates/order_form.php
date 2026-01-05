<section class="order-form">
    <div data-table="megrendelok" class="datagroup">
        <h3 class="title-font mt-0">Megrendelő adatai</h3>
        <div class="customer-data">
            <div class="inputarea">
                <input type="text" data-field="nev" class="order-field" placeholder="">
                <label>Név</label>
            </div>
            <div class="inputarea">
                <input type="email" data-field="email" class="order-field" placeholder="">
                <label>E-mail</label>
            </div>
            <div class="inputarea">
                <input type="text" data-field="mobil" class="order-field" placeholder="">
                <label>Telefonszám</label>
            </div>
            <div class="inputarea">
                <input type="text" data-field="szall_cim" class="order-field" placeholder="">
                <label>Szállítási cím</label>
            </div>
            <div class="inputarea">
                <input type="text" data-field="adoszam" class="order-field" placeholder="">
                <label>Adószám</label>
            </div>
        </div>
    </div>

    <div data-table="megrendeles_adatok" class="datagroup">
        <h3 class="title-font">Szállítási és fizetési adatok</h3>
        <div class="inputarea mb-4">
            <select data-field="szallitasi_mod" class="order-field szallitasi-modok-lista">
                <option value="0">Válasszon szállítási módot</option>
            </select>
        </div>
        <div class="inputarea">
            <select data-field="fizetesi_mod" class="order-field fizetesi-modok-lista">
                <option value="0">Válasszon fizetési módot</option>
            </select>
        </div>

        <h3 class="title-font">Számlázási adóalany</h3>
        <div class="inputarea">
            <select data-field="adoalany" class="order-field adoalany-lista">
                <option value="0">Válasszon</option>
            </select>
        </div>
    </div>
    <button class="order-save-btn border-0 bg-custom-secondary text-custom-primary rounded-2" data-bs-toggle="modal" data-bs-target="#successNotification">Megrendelés</button>
</section>