<article class="product-card text-custom-primary">
    <div class="product-card__img">
        <img src="{{kep}}" alt="{{cim}}">
    </div>
    <img class="product-card__language rounded-circle" src="{{nyelv_ikon}}" alt="{{nyelv_megnevezes}}" title="{{nyelv_megnevezes}}">


    <div class="product-card__title title-font mt-1" title="{{cim}}">{{cim}}</div>
    <div class="product-card__author">{{szerzo}}</div>

    <div class="d-flex gap-1">
        <div class="product-card__rating"><i class="bi bi-star-fill product-card__rating-icon"></i>&nbsp;4.6</div>
        <i class="bi bi-slash"></i>
        <div class="product-card__cover"><i class="fa fa-book"></i>&nbsp;{{borito}}</div>
    </div>

    <div class="d-flex justify-content-between align-items-center mt-2">
        <button class="add-to-cart product-card__cart-btn rounded-1 border-0" title="Kosárba">
            <i class="fa-solid fa-cart-plus"></i>
        </button>
        <div class="product-card__price">{{ar}} Ft</div>
    </div>

</article>

