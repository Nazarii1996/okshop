<section class="banner-ind">
            <div class="banner-slider">
            <?php foreach($banners as $banner){?>
                <div class="banner-slid">
                    <img class="big" title="<?=$banner['title']?>" src="<?=$banner['image']?>">
                    <img class="lit" title="<?=$banner['title']?>" src="<?=$banner['image']?>">
                </div>
            <?php } ?>
            </div>
            <div class="border">
                <div class="menu">
                    <ul>
                        <li>
                            <a href="javascript:void(0)">Каталог</a>
                            <ul>
                            <?php foreach($categories as $category){?>
                                <li><a href="<?=$category['href']?>"><?=$category['name']?></a></li>
                            <?php } ?>
      
                            </ul>
                        </li>
                        <li class="active"><a href="javascript:void(0)">Акции</a></li>
                        <li class="menu-logo">
                            <a href="javascript:void(0)">
                                <img src="/catalog/view/theme/okshop/img/logo_okshop.png">
                            </a>
                        </li>
                        <li><a href="javascript:void(0)">Отзывы</a></li>
                        <li>
                            <a href="javascript:void(0)">О нас</a>
                            <ul>
                                <li><a href="javascript:void(0)">Контакты</a></li>
                                <li><a href="javascript:void(0)">Частые вопросы</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="logo">
                    <a href="javascript:void(0)">
                        <img src="/catalog/view/theme/okshop/img/logo_okshop.png">
                    </a>
                </div>
                <div class="soc-icons">
                    <ul>
                        <li><a href="javascript:void(0)"><i class="icon-facebook-squared"></i></a></li>
                        <li><a href="javascript:void(0)"><i class="icon-instagram"></i></a></li>
                        <li><a href="javascript:void(0)"><i class="icon-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
            
            </section>