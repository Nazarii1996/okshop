<?php echo $header; ?>

 <div class="container">
    
     <div class="notifications">
    <?=$success_acc?>
    <?=$error_warning?>
    <?=$warning_password?>
    <?=$error_email?>
    <?=$wrong_password?>
    
    </div>
            <div class="tabs" id="tabs">
                <ul>
                    <li><a href="#tabs-1">личные данные</a></li>
                    <li><a href="#tabs-2">Корзина</a></li>
                    <li><a href="#tabs-3">Список желаний</a></li>
                    <li><a href="#tabs-4">История заказов</a></li>
                </ul>
                <div class="tab pers" id="tabs-1">
                    <form action="/index.php?route=account/account/edit" method="post" enctype="multipart/form-data" class="form-horizontal" >
                        <div class="pers-item">
                            <p>Редактирование личных данных</p>
                            <label>Имя,отчество</label>
                            <input type="text" name="firstname" value="<?=$firstname?>">
                            <label>E-mail</label>
                            <input type="email" name="email" value="<?=$email?>">
                        </div>
                        <div class="pers-item">
                            <p>Изменение пароля</p>
                            <label>Старый пароль</label>
                            <input name="old_password" type="password">
                            <label>Новый пароль</label>
                            <input name="password" type="password">
                            <label>Подтверждение пароля</label>
                            <input type="password" name="password_r">
                        </div>
                        <div class="for-but">
                            <input type="submit" value="Сохранить">
                        </div>
                    </form>
                </div>
                <div class="tab bask" id="tabs-2">
                <?php if($products){?>
                    <?php foreach($products as $product){?>
                    <div class="bask-item" id="<?=$product['cart_id']?>">
                        <div class="bask-item-left">
                            <div class="img">
                                <img src="<?=$product['image']?>">
                            </div>
                            <div class="text">
                                <p class="tit"><?=$product['name']?></p>
                                <ul>
                                   <?php foreach($product['option'] as $option){?>
                                    <li><span class="name"><?=$option['name']?>:</span><span><?=$option['value']?></span></li>
                                   
                                   <?php } ?>
                                    <li><span class="name">Количество:</span>
                                        <input onchange="cart.update(<?=$product['cart_id']?>,$(this).val());" value="<?=$product['quantity']?>" type="number" min="1">
                                    </li>
                                    <li><span class="name">Цена:</span><span><?=$product['price']?> грн</span> </li>
                                </ul>
                            </div>
                        </div>
                        <div class="bask-item-right">
                            <p class="res-price" data-price="<?=$product['price']?>"><?=$product['total']?> грн</p>
                            <a class="del-bus" onclick="cart.remove(<?=$product['cart_id']?>)">Убрать из корзины</a>
                        </div>
                    </div>
                    
                    
                    <?php } ?>
                    <div class="result">
                        <p class="pr basket_price" ><span>К оплате:</span><?=$total?> грн</p>
                        <a href="javascript:void(0)">Оформить заказ</a>
                    </div>
                    <?php } else { ?>
                    
                    Ваша корзина пустая
                    <?php } ?>
                    
                    
                </div>
                <div class="tab fav" id="tabs-3">
                <?php if($wishlist){?>
                    <div class="sort-but" style="display:none;">
                        <p class="but">Сортировка</p>
                        <div class="sort-pop">
                            <div class="sort-close">
                                <span></span>
                            </div>
                            <div class="men">
                                <p class="t">Сортировка по:</p>
                                <ul>
                                    <li><a href="javascript:void(0)">имени</a></li>
                                    <li><a href="javascript:void(0)">цене</a></li>
                                    <li class="active"><a href="javascript:void(0)">дате</a></li>
                                    <li class="button but-active"><a href="javascript:void(0)"><i class="icon-down-open-big"></i></a></li>
                                    <li class="button"><a href="javascript:void(0)"><i class="icon-up-open-big"></i></a></li>
                                </ul>
                                <a href="javascript:void(0)" class="ok">Применить</a>
                            </div>
                        </div>
                        <div class="sort-line">
                            <div class="sort-desc">
                                <p class="t">Сортировка по:</p>
                                <ul>
                                    <li><a href="javascript:void(0)">имени</a></li>
                                    <li><a href="javascript:void(0)">цене</a></li>
                                    <li class="active"><a href="javascript:void(0)">дате</a></li>
                                    <li class="button but-active"><a href="javascript:void(0)"><i class="icon-down-open-big"></i></a></li>
                                    <li class="button"><a href="javascript:void(0)"><i class="icon-up-open-big"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                   <?php foreach($wishlist as $product){?>
                    <div class="fav-item" id="wishlist_<?=$product['product_id']?>">
                        <div class="fav-item-left">
                            <div class="img">
                                <img src="<?=$product['thumb']?>">
                            </div>
                            <div class="text">
                                <p class="tit"><?=$product['name']?></p>
                                <ul>
                                    <li><span class="name not-stock"><?=$product['stock']?></span></li>
                                    <li><span class="name">Цена:</span><span><?=$product['price']?></span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="fav-item-right">
                            <a class="in-bus not" onclick="cart.add(<?=$product['product_id']?>)">В корзину</a>
                            <a class="del-bus" onclick="wishlist.remove(<?=$product['product_id']?>)">Убрать из избраного</a>
                        </div>
                    </div>
                    <?php } ?>
                    <?php } else { ?>
                    
                    Ваш список желаний пуст.
                    <?php } ?>
                </div>
                <div class="tab his" id="tabs-4">
                    <div class="accordion" id="accordion">
                      <?php foreach($orders as $order){?>
                        <p class="<?=$order['class']?>"><span><?=$order['date_added']?></span><span class="rs"><?=$order['status']?><i class="icon-down-open-mini"></i></span></p>
                        <div>
                            <div class="table">
                                <table>
                                    <tr>
                                        <th class="wb">Наименование товара</th>
                                  
                                        <th>Кол-во</th>
                                        <th>Цена</th>
                                        <th>Сума</th>
                                    </tr>
                                  
                                     <?php foreach($order['products'] as $product){?>
                                    <tr>
                                        <td class="wb"><?=$product['name']?></td>
                                      
                                        <td><?=$product['quantity']?></td>
                                        <td><?=$product['price']?></td>
                                        <td><?=$product['total']?></td>
                                    </tr>
                                    <?php } ?>
                                    <tr>
                                        <td class="wb"></td>
                                        <td></td>
                                     
                                        <td></td>
                                        <td><?=$order['total']?></td>
                                    </tr>
                                </table>
                            </div>
                            <ul>
                                <li><span>Имя:</span><?=$order['name']?></li>
                                <li><span>Адрес доставки:</span><?=$order['address']?></li>
                                <li><span>Коментарий к заказу:</span><?=$order['comment']?></li>
                            </ul>
                            <ul>
                                <li><span>Дата:</span><?=$order['date_added']?></li>
                                <li><span>Статус:</span><?=$order['status']?></li>
                            </ul>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
<?php echo $footer; ?> 