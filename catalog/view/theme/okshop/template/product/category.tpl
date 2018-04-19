

<?php if(!isset($show_more)){?>
<?php echo $header; ?>

        <section class="filter">
            <div class="fil-close">
                <span></span>
            </div>
            <div class="men">
                <div class="fil-item">
                    <p class="t">Подкатегории</p>
                    <ul>
                        <li><a href="javascript:void(0)">Блеск для губ</a></li>
                        <li><a href="javascript:void(0)">Помада для губ</a></li>
                        <li><a href="javascript:void(0)">карандаш для губ</a></li>
                    </ul>
                </div>
                <div class="fil-item">
                    <p class="t">Бренд</p>
                    <form>
                        <div>
                            <input id="ch1" type="checkbox">
                            <label for="ch1">EOS</label>
                        </div>
                        <div>
                            <input id="ch2" type="checkbox">
                            <label for="ch2">Wet n Wild</label>
                        </div>
                        <div>
                            <input id="ch3" type="checkbox">
                            <label for="ch3">NYX</label>
                        </div>
                        <div>
                            <input id="ch4" type="checkbox">
                            <label for="ch4">Makeup Revolution</label>
                        </div>
                        <div>
                            <input id="ch5" type="checkbox">
                            <label for="ch5">L.A. Girl</label>
                        </div>
                    </form>
                </div>
                <div class="fil-item">
                    <p class="t">Цена</p>
                    <form>
                        <div class="range">
                            <input type="text" placeholder="от 43 грн">
                            <input type="text" placeholder="до 1143 грн">
                        </div>
                    </form>
                    <p class="t">Наличие:</p>
                    <form>
                        <div>
                            <input id="ch6" type="checkbox">
                            <label for="ch6">В наличии</label>
                        </div>
                    </form>
                    <p class="t">Акция:</p>
                    <form>
                        <div>
                            <input id="ch7" type="checkbox">
                            <label for="ch7">Товары со скидками</label>
                        </div>
                    </form>
                </div>
                <a href="javascript:void(0)" class="ok">Применить</a>
            </div>
        </section>

        <section class="sort">
            <div class="sort-close">
                <span></span>
            </div>
            <div class="men">
                <p class="t">Сортировка по:</p>
                <ul>
                    <li><a href="javascript:void(0)">имени</a></li>
                    <li><a href="javascript:void(0)">цене</a></li>
                    <li><a href="javascript:void(0)">дате</a></li>
                    <li class="active"><a href="javascript:void(0)">популярности</a></li>
                    <li class="button but-active"><a href="javascript:void(0)"><i class="icon-down-open-big"></i></a></li>
                    <li class="button"><a href="javascript:void(0)"><i class="icon-up-open-big"></i></a></li>
                </ul>
                <a href="javascript:void(0)" class="ok">Применить</a>
            </div>
        </section>
        
        
        
        <section class="bread-crumbs">
            <div class="container">
                <ul>
                <?php foreach($breadcrumbs as $key=>$breadcrumb){?>
                    <li class=""><a href="<?=$breadcrumb['href']?>"><?=$breadcrumb['text']?></a>
                    
                    <?php if(count($breadcrumbs)-1!=$key){?>
                    <i class="icon-right-open-mini"></i></li>
                    <?php } ?>
                <?php } ?>

                </ul>
            </div>
        </section>

        <section class="all-products">
            <div class="container">
                <div class="all-prod-cont">
          <?=$column_left?>
                    <div class="products">
                    <?php } ?>
                        <div class="sorts">
                            <div class="sort-desc">
                                <p class="t">Сортировка по:</p>
                                <ul>
                                <?php foreach($sorts as $s){?>
                                    <?php if($sort==$s['val']){?>
                                 <li class="active"><a href="<?=$s['href']?>"><?=$s['text']?></a></li>
                                 <?php } else { ?> 
                                
                                    <li><a href="<?=$s['href']?>"><?=$s['text']?></a></li>
                                    <?php } ?>
                                <?php } ?>
                                    
                          
                          
                                    <li class="button <?php if($order=="DESC"){?>  but-active <?php } ?>"><a href="<?=$order_desc?>"><i class="icon-down-open-big"></i></a></li>
                                    <li class="button <?php if($order=="ASC"){?>  but-active <?php } ?>"><a href="<?=$order_asc?>"><i class="icon-up-open-big"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="products-cont">
                           
                           <?php if(!empty($products)){?> 
                            <?php foreach($products as $product){?>
                            <div class="product">
                            
                                <div class="prod-img1">
                                    <img src="<?=$product['thumb']?>" title="<?=$product['name']?>">
                                    <ul class="choice">
                                        <li>
                                            <a onclick="wishlist.add(<?=$product['product_id']?>)" href="javascript:void(0)">
                                                <i class="icon-star"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="cart.add(<?=$product['product_id']?>)" href="javascript:void(0)">
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
                                <p class="description1"><?=$product['name']?></p>
                                <p class="price"><?=$product['price']?></p>
                                <a href="<?=$product['href']?>"></a>
                            </div>
                                 <?php } ?>
                                 <?php } else { ?>
                                 <?=$text_empty?>
                                 <?php } ?>
                                 
                        </div>
                   <?php if($pagination){?>
                        <div class="more">
                        
                            <a class="show-more" <?php if(!$sm){?>style="border:none;"<?php } ?> onclick="showmore('<?=$link?>&show_more=1');"><?php if($sm){?>Показать больше<?php } ?></a>
                       
                            <?=$pagination?>
                        </div>
                        <?php } ?>
                        <?php if(!isset($show_more)){?>
                    </div>
                </div>
            </div>
        </section>

      <?=$content_bottom?>

      


<?php echo $footer; ?>
<?php } ?>
