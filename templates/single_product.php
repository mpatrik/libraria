<section class="single-product">
    <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item breadcrumb-home"><a href="#"><i class="fa-solid fa-home"></i></a></li>
            <li class="breadcrumb-item breadcrumb-products"><a href="#">Könyvek</a></li>
            <li class="breadcrumb-item breadcrumb-category"><a href="#">{{mufaj_megnevezes}}</a></li>
            <li class="breadcrumb-item">{{cim}}</li>
        </ol>
    </nav>

    <div class="d-flex gap-3 flex-wrap">
        <div class="content d-flex gap-5 flex-wrap">
            <img class="content__img" src="{{kep}}" alt="{{cim}}">
            <div class="content__details">
                <div class="details__author">{{szerzo}}</div>
                <h2 class="details__title title-font my-2">{{cim}}</h2>
                <div class="details__rating">
                    <i class="bi bi-star-fill product-card__rating-icon"></i>
                    <i class="bi bi-star-fill product-card__rating-icon"></i>
                    <i class="bi bi-star-fill product-card__rating-icon"></i>
                    <i class="bi bi-star-fill product-card__rating-icon"></i>
                    <i class="bi bi-star-fill product-card__rating-icon"></i>
                    <span class="rating-number">4.6</span>
                <div class="details__basics mt-2 mb-4">
                    <span>{{kiado}}</span>
                    <span>{{kiadasi_ev}}</span>
                    <span>
                        <img src="{{nyelv_ikon}}" class="basics__language-icon">
                        &nbsp;{{nyelv_megnevezes}} nyelvű
                    </span>
                    <span>{{oldalszam}} oldal</span>
                </div>   
                </div>
                <p class="details__synopsis">{{leiras}}</p>
                <div class="infos container-fluid my-5">
                    <div>
                        <label class="infos__label">Kiadó</label>
                        <div class="infos__data">{{kiado}}</div>
                    </div>

                    <div>
                        <label class="infos__label">Kiadás éve</label>
                        <div class="infos__data">{{kiadasi_ev}}</div>
                    </div>

                    <div>
                        <label class="infos__label">Sorozat</label>
                        <div class="infos__data text-uppercase">{{sorozat_megnevezes}}</div>
                    </div>

                    <div>
                        <label class="infos__label">Nyelv</label>
                        <div class="infos__data text-uppercase">{{nyelv_megnevezes}}</div> 
                    </div>

                    <div>
                        <label class="infos__label">Oldalszám</label>
                        <div class="infos__data">{{oldalszam}}</div>
                    </div>
                    
                    <div>
                        <label class="infos__label">Borító</label>
                        <div class="infos__data text-uppercase">{{borito}}</div>
                    </div>

                    <div>
                        <label class="infos__label">Súly</label>
                        <div class="infos__data">{{suly}}</div>
                    </div>

                    <div>
                        <label class="infos__label">ISBN</label>
                        <div class="infos__data">{{isbn}}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="to-cart">
            <div>
                <div class="to-cart__price">{{ar}} Ft</div>
                <button class="add-to-cart to-cart__btn rounded-1 border-0">
                    <i class="fa-solid fa-cart-plus"></i>
                    &nbsp;Kosárba
                </button>
            </div>
        </div>
    </div>

    

</section>
