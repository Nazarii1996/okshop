<section class="other-products">
            <div class="container">
                <div class="tit">
                    <h3><?=$heading_title?></h3>
                </div>
                <div class="product-cont">
                   <?php foreach($products as $product){?>
                    <div class="product">
                        <div class="prod-img">
                            <img src="<?=$product['thumb']?>">
                            <ul class="choice">
                                <li>
                                    <a href="wishlist.add(<?=$product['product_id']?>);">
                                        <i class="icon-star"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="cart.add(<?=$product['product_id']?>);">
                                        <i class="icon-basket-1"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?=$product['href']?>">
                                        <i class="icon-dot-3"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <p class="description"><?=$product['name']?></p>
                        <p class="price"><?=$product['price']?></p>
                        <a href="<?=$product['href']?>"></a>
                    </div>
                    <?php } ?>
                </div>
                
            </div>
        </section>