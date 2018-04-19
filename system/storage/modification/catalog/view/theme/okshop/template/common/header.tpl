<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?=$title?></title>

<?php if ($noindex) { ?>
<!-- OCFilter Start -->
<meta name="robots" content="noindex,nofollow" />
<!-- OCFilter End -->
<?php } ?>
      
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;" />
    <link href="https://fonts.googleapis.com/css?family=Comfortaa:300,400,700&amp;subset=cyrillic" rel="stylesheet">
    <link rel="icon" type="image/png" sizes="16x16" href="/catalog/view/theme/okshop/img/favicon_ok.png">
    <link rel="stylesheet" href="/catalog/view/theme/okshop/css/style.css">
    <link rel="stylesheet" href="/catalog/view/theme/okshop/css/opencart.css">
  
  <script src="/catalog/view/theme/okshop/js/jquery.min.js"></script>


    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    
     
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script> 
    <?php } ?>
        <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
    <?php } ?>
</head>

<body>

    <section class="home">

        <header>
            <div class="container">
                <div class="hed-cont">
                    <div class="search">
                    <form method="GET" action="index.php">
                        <input type="hidden" value="product/search" name="route" />
                        <input type="text" name="search" placeholder="Поиск" />
                        <i onclick="$(this).parent().submit();" class="but icon-search"></i>
                        
                        </form>
                    </div>
                    <div class="account <?php if($is_Logged){?> enter <?php } ?>">
                        <a class="bask"><?=$cart?></a>
                        
                        <a class="registration" href="javascript:void(0)"><?php echo $text_register; ?></a>
                        <a class="login" href="javascript:void(0)"><?php echo $text_login; ?></a>
         
                        <div class="menu-button">
                            <span></span>
                        </div>
                        <div class="my-account">
                            <a class="wish-list" href="<?=$wishlist?>">Список желаний</a>
                            <div class="basket">
                            <?=$cart?>
                            </div>
                            <div class="pers">
                                <div class="osn">
                                    <p class="pr"><i class="icon-user-1"></i></p>
                                    <span><i class="icon-down-open-mini"></i></span>
                                </div>
                                <ul class="dop">
                                    <li><a href="<?=$order?>">Мои заказы</a></li>
                                    <li><a href="<?=$account?>">Управление профилем</a></li>
                                    <li><a href="javascript:void(0)">Условия доставки</a></li>
                                    <li><a href="<?=$logout?>">Выйти</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section class="mobmenu">
            <div class="menu-button-close">
                <span></span>
            </div>
            <div class="men">
                <!--<ul>
        <li>
            <a href="javascript:void(0)">Каталог</a>
            &lt;!&ndash;<ul>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Для губ</a></li>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Для глаз</a></li>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Для лица</a></li>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Тени и палитры теней</a></li>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Подарочные наборы</a></li>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Для визажистов</a></li>&ndash;&gt;
                &lt;!&ndash;<li><a href="javascript:void(0)">Товары для детей</a></li>&ndash;&gt;
            &lt;!&ndash;</ul>&ndash;&gt;
        </li>
        <li><a href="javascript:void(0)">Акции</a></li>
        <li><a href="javascript:void(0)">Отзывы</a></li>
        <li><a href="javascript:void(0)">О нас</a></li>
    </ul>-->
                <ul class="accordion-menu">
                    <li>
                        <div class="dropdownlink"><a href="javascript:void(0)">Каталог</a>
                        </div>
                        <ul class="submenuItems">
                            <li><a href="javascript:void(0)">Для губ</a></li>
                            <li><a href="javascript:void(0)">Для глаз</a></li>
                            <li><a href="javascript:void(0)">Для лица</a></li>
                            <li><a href="javascript:void(0)">Тени и палитры теней</a></li>
                            <li><a href="javascript:void(0)">Подарочные наборы</a></li>
                            <li><a href="javascript:void(0)">Для визажистов</a></li>
                            <li><a href="javascript:void(0)">Товары для детей</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="dropdownlink">
                            <a href="javascript:void(0)">Акции</a>
                        </div>
                    </li>
                    <li>
                        <div class="dropdownlink">
                            <a href="javascript:void(0)">Отзывы</a>
                        </div>
                    </li>
                    <li>
                        <div class="dropdownlink">
                            <a href="javascript:void(0)">О нас</a>
                        </div>
                        <ul class="submenuItems">
                            <li><a href="javascript:void(0)">Контакты</a></li>
                            <li><a href="javascript:void(0)">Частые вопросы</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="men-account">
                    <a class="registration" href="javascript:void(0)">Регистрация</a>
                    <a class="login" href="javascript:void(0)">Войти</a>
                    <a class="bask"><i class="icon-basket"></i>0 грн</a>
                    <div class="my-account">
                        <a class="wish-list" href="javascript:void(0)">Список желаний</a>
                        <div class="basket">
                            <p><i class="icon-basket"></i></p>
                            <p class="price">777 грн</p>
                            <a href="javascript:void(0)"></a>
                        </div>
                        <div class="pers">
                            <div class="osn">
                                <p class="pr"><i class="icon-user-1"></i></p>
                                <span><i class="icon-down-open-mini"></i></span>
                            </div>
                            <ul class="dop">
                                <li><a href="javascript:void(0)">Мои заказы</a></li>
                                <li><a href="javascript:void(0)">Управление профилем</a></li>
                                <li><a href="javascript:void(0)">Условия доставки</a></li>
                                <li><a href="javascript:void(0)">Выйти</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="onbask">
            <div class="popcont">
                <div class="onbask-x">
                    <span></span>
                </div>
                <p>Товар добавлен в корзину</p>
                <div class="tov">
                    <div class="img">
                        <img>
                    </div>
                    <div class="text">
                        <div class="text-item title">
                            <p class="first">Хайлайтер Wet n Wild MegaGlo™ Illuminating Powder Catwalk Pink</p>
                            <p class="sec"></p>
                        </div>
                
          
                        <div class="text-item quantity">
                            <p class="first">Количество:</p>
                            <p class="sec">2</p>
                        </div>
                        <div class="text-item price">
                            <p class="first">Цена:</p>
                            <p class="sec">468 грн</p>
                        </div>
                    </div>
                </div>
                <form>
                    <input class="ent" type="submit" value="Перейти в корзину">
                    <input type="submit" value="Продолжить покупки">
                </form>
            </div>
        </section>
        <section class="loginpop">
            <div class="popcont">
                <div class="login-x">
                    <span></span>
                </div>
                <p>Вход</p>
                
                <form action="/index.php?route=account/login/popup" id="login_popup" >
                <span class="error"></span>
                    <input type="text"  name="email" placeholder="E-mail">
                    <input type="password" name="password" placeholder="Пароль">
                    <a class="pas" href="javascript:void(0)">Забыли пароль?</a>
                    <input type="submit" value="Войти">
                    <a href="javascript:void(0)">Регистрация</a>
                    
                </form>
            </div>
        </section>

        <section class="regpop">
            <div class="popcont">
                <div class="registration-x">
                    <span></span>
                </div>
                <p>Регистрация</p>
                <form  action="index.php?route=account/register/popup" id="reg_popup">
                <span class="error"></span>
                    <input type="text" name="lastname"  placeholder="Имя">
                    <input type="text" name="email" placeholder="E-mail">
                    <input type="password" name="password" placeholder="Пароль">
                    <input type="password" name="password_reply" placeholder="Пароль для проверки">
                    <input type="submit" value="Регистрация">
                    <a href="javascript:void(0)">Войти</a>
                </form>
            </div>
        </section>

        <section class="paswpop">
            <div class="popcont">
                <div class="paswpop-x">
                    <span></span>
                </div>
                <p>Вход</p>
                <form>
                    <p>Пожалуйста, введите ваше имя пользователя или e-mail. Вы получите письмо со ссылкой для создания нового пароля.</p>
                    <input type="text" placeholder="Логин или E-mail">
                    <input type="submit" value="Войти">
                </form>
            </div>
        </section>
        <?php if($class!="common-home"){?>
        <section class="banner">
            <div class="container">
                <div class="logo">
                    <a href="javascript:void(0)">
                        <img src="/catalog/view/theme/okshop/img/logo_okshop.png">
                    </a>
                </div>
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
                            <a href="/">
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
            </div>
        </section>
         <?php } ?>