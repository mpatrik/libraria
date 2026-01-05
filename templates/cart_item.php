<article class="cart-item text-custom-primary d-flex gap-2">
    <img src="{{kep}}" class="cart-item__img">

    <div class="cart-item__content">
        <div class="cart-item__title title-font" title="{{cim}}">{{cim}}</div>
        <div class="cart-item__author">{{szerzo}}</div>
        <div class="cart-item__price">{{tetelAr}} Ft</div>
    </div>

    <div class="cart-item__quantity-container d-flex">
        <div class="item-quantity-decrease cart-item__icon rounded-start-2">
            <i class="bi bi-dash-lg" title="Darabszám csökkentése"></i>
        </div>
        <div class="cart-item__quantity">{{quantity}}</div>
        <div class="item-quantity-increase cart-item__icon rounded-end-2">
            <i class="bi-plus-lg" title="Darabszám növelése"></i>
        </div>
    </div>

    <div class="item-delete cart-item__delete text-custom-danger">
        <i class="bi bi-x-lg" title="Tétel törlése"></i>
    </div>

</article>

