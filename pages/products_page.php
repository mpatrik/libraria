<div class="d-lg-flex gap-5 mt-5">

    <button class="filter-btn rounded-2 bg-custom-secondary text-custom-primary ms-3 mb-3 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#filtersOffcanvas" aria-controls="filtersOffcanvas">
        <i class="fa-solid fa-sliders"></i>
    </button>

    <div class="filters-offcanvas offcanvas-lg offcanvas-end bg-custom-primary" tabindex="-1" id="filtersOffcanvas" aria-labelledby="filtersOffcanvasLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title text-custom-secondary title-font" id="filtersOffcanvasLabel">Szűrők</h5>
            <button type="button" class="button-close border-0 bg-custom-primary text-custom-secondary ms-auto"
                        data-bs-dismiss="offcanvas" data-bs-target="#filtersOffcanvas" aria-label="Close">
                    <i class="bi bi-x-lg"></i>
            </button>
        </div>
        <section class="filters">
            <div class="categories">
                <a href="#" class="category-item all-books"><i class="fa-solid fa-layer-group nav-link-icon"></i><span>Mind</span></a>
            </div>
        </section>
    </div>

    <section class="products-container container-fluid">
        <h2 class="products-headline title-font"></h2>
        <div class="products d-flex flex-wrap gap-5">

        </div>
    </section>
</div>