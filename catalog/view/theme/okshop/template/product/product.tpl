<?=$header?>

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

        <section class="one-product">
            <div class="container">
                <div class="prod" id="product">
                <input type="hidden" name="product_id" value="<?=$product_id?>" />
                    <div class="img">
                        <img src="<?=$popup?>">
                    </div>
                    <div class="text">
                        <p class="des"><?=$heading_title?></p>
                        <div class="pr">
                            <span class="cena">ЦЕНА :</span>
                            <span><?=$price?></span>
                        </div>
                        <div>
                            <p>Производитель:</p>
                            <p><?=$manufacturer?></p>
                        </div>
                        <div>
                            <p>Наличие:</p>
                            <p><?=$stock?></p>
                        </div>
                        <div>
                            <p>Количество</p>
                            <input value="1" type="number" name="quantity" min="1">
                        </div>
                        <div>
                            <?php foreach ($options as $option) { ?>
                            <?php if($option['type']=="select"){?>
                            
                            
                            <p><?=$option['name']?></p>
                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>"  data-jcf='{"wrapNative": false, "wrapNativeOnMobile": false, "fakeDropInBody": false, "useCustomScroll": false}'>
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
                            </select>
                            <?php } ?>
                            
                            
                            <?php } ?>
                        </div>
                        <div>
                            <div class="bus <?php if($incart){?> active <?php } ?> " id="button-cart" >
                                <a  class="bus-bt" href="javascript:void(0)"><i class="icon-basket-1"></i>В корзину</a>
                                <a class="bus-on" href="javascript:void(0)"><i class="icon-basket-1"></i>В корзине</a>
                            </div>
                            <div class="fav" onclick="wishlist.add(<?=$product_id?>)">
                                <a class="fav-bt" href="javascript:void(0)"><i class="icon-star"></i>В желание</a>
                                <a class="fav-on" href="javascript:void(0)"><i class="icon-star"></i>В списке</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tabs" id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Описание</a></li>
                        <li><a href="#tab-review">Отзывы</a></li>
                    </ul>
                    <div class="tab" id="tabs-1">
                        <div class="tab-description">
                            <?=$description?>
                           
                           
                           
                            <div class="ph-slider">
                            <?php foreach($images as $image){?>
                                <div class="img">
                                    <img src="<?=$image['popup']?>">
                                </div>
                                <?php } ?>
                            
                            </div>
                             </div>
                    </div>
                    <div class="tab reviews" id="tab-review">
                    
                    <?=$content_top?>
                    
                        <div class="rew">
                            <div class="login">
                                <p class="name">Some_Login</p>
                                <p class="date">02.02.2002</p>
                                <ul class="mark">
                                    <li><i class="icon-star"></i></li>
                                    <li><i class="icon-star"></i></li>
                                    <li><i class="icon-star"></i></li>
                                    <li class="empty"><i class="icon-star"></i></li>
                                    <li class="empty"><i class="icon-star"></i></li>
                                </ul>
                            </div>
                            <div class="rew-text">
                                <p>Решила оставить еще отзыв об оттенке # 82. Они у меня уже год и я их обажаю, так же как и # 170.Это цвет просто огонь))) Мягкий персик с золотым шимером. У меня теплый подтон кожи и они мне подходят просто отлично. Освежают
                                    идеально, очень люблю делать макияж в стиле нюд, так они с этим справляются на 5++++.Лицо выглядит свежо и молодо)))Оченю рекомендую!!!</p>
                                <p class="answ">
                                    <a href="javascript:void(0)">Ответить</a>
                                </p>
                            </div>
                        </div>
                        <div class="rew answer">
                            <div class="login">
                                <p class="name">Support</p>
                                <p class="date">02.02.2002</p>
                            </div>
                            <div class="rew-text">
                                <p>Анастасия, очень жаль, что у Вас осталось такое впечатление от данного заказа. К сожалению, мы не смогли идентифицировать Вас как клиента нашего магазина. Для рассмотрения Вашего обращения, укажите, пожалуйста, номер Вашего
                                    заказа.</p>
                                <p class="answ">
                                    <a href="javascript:void(0)">Ответить</a>
                                </p>
                            </div>
                        </div>
     
                        <ul class="pagination">
                            <li><a href="javascript:void(0)">1</a></li>
                            <li class="active"><a href="javascript:void(0)">2</a></li>
                            <li><a href="javascript:void(0)">3</a></li>
                            <li><a href="javascript:void(0)">4</a></li>
                            <li><a>...</a></li>
                            <li><a href="javascript:void(0)">10</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

<?=$content_bottom?>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: '/index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'],#product input[type=\'number\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',

		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
                var bask=$(".onbask");
                
                bask.find(".title .first").text(json['title']);
                bask.find(".price .sec").text(json['price']);
                bask.find(".quantity .sec").text(json['quantity']);
                
                console.log(json['option']);
                if(json['option']){
                var options='<div class="text-item option">';
                bask.find(".option").remove();
                $.each(json['option'],function(index,value){
                  options+='<p class="first">'+index+':</p><p class="sec">'+value+'</p>';
                })
                options+='</div>';
                
                bask.find(".title").after(options);
                }
                
                $(".bus").addClass("active")
                bask.find('img').attr('src',json['image']);
		      	bask.addClass("active");
                $("body").addClass("pop");

			
                $(".bask").load('index.php?route=common/cart/info');
				$('.basket').load('index.php?route=common/cart/info');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
  <?=$footer?>