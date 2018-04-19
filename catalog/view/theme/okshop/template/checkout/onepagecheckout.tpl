<?php echo $header; ?>
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
<div class="errors-block"></div>
        <div class="container">
            <div class="order-cont">
                <div class="ord">
                    <h2>Ваш заказ</h2>
                    <div>
                    
                     <?php foreach($products as $product){?>
                        <div class="bask-item">
                            <div class="bask-item-left">
                                <div class="img">
                                    <img src="<?=$product['image']?>">
                                </div>
                                <div class="text">
                                    <p class="tit"><?=$product['name']?></p>
                                    <ul>
                                    <?php if($product['option']){?>
                                    <?php foreach($product['option'] as $option){?>
                                        <li><span class="name"><?=$option['name']?>:</span><span><?=$option['value']?></span></li>
                                    <?php } ?>
                                        <?php } ?>
                                        <li><span class="name">Количество:</span><span><?=$product['quantity']?></span></li>
                                        <li><span class="name">Цена:</span><span><?=$product['total']?></span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                        <?php } ?>
                        <div class="res">
                        <?php foreach($totals as $total){?>
                            <p><span><?=$total['title']?>:</span><?=$total['text']?></p>
                            
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <form class="formx">
                <input type="hidden" name="customer_id" value="<?=$isLogged?>" />
                    <div>
                        <p>Выберите способ оплаты:</p>
                        <select id="payment_select" name="payment_method"  data-jcf='{"wrapNative": false, "wrapNativeOnMobile": false, "fakeDropInBody": false, "useCustomScroll": false}'>
                            
                              <?php foreach ($payment_methods as $payment_method) { ?>
                                                    <option
                                                        value='{"title": "<?php echo $payment_method['title'] ?>", "code": "<?php echo $payment_method['code'] ?>"}'
                                                        class="payment_method_value <?php echo $payment_method['code']?>"
                                                        style=""><?php echo $payment_method['title'] ?></option>
                                                        <?php } ?>
                        </select>
                    </div>
                    <div>
                        <p>Выберите способ доставки:</p>
                        <select onChange="updateShipping(this)" name="shipping_method" id="shipping-method" data-jcf='{"wrapNative": false, "wrapNativeOnMobile": false, "fakeDropInBody": false, "useCustomScroll": false}'>
                        <?php foreach ($shippig_methods as $shipping_method) { ?>
                                            <option

                                            value='{"title": "<?php echo $shipping_method['title'] ?>", "code": "<?php echo $shipping_method['value'] ?>", "comment":"", "shipping_method":"<?php echo $shipping_method['value'] ?>", "cost":"<?php echo $shipping_method['cost'] ?>","tax_class_id":""}'
                                                class="form-control large-field <?= substr($shipping_method['value'], strpos($shipping_method['value'], '.')+1 )?>"><?php echo $shipping_method['title'] ?></option>

                                                <?php } ?>
                        </select>
                    </div>
                    <div id="firstname-ch">
                        <p>Имя получателя:</p>
                        <input type="text" name="firstname" value="<?=$firstname?>" placeholder="Введите имя">
                        <p class="error">
                        </p>
                    </div>
                    <div  id="lastname-ch">
                        <p>Фамилия получателя:</p>
                        <input type="text" name="lastname" value="<?=$lastname?>" placeholder="Введите фамилию">
                            <p class="error">
                        </p>
                    </div>
                     <div id="telephone-ch">
                        <p>Телефон получателя:</p>
                        <input type="text" name="telephone" value="<?=$telephone?>" placeholder="Введите имя">
                        <p class="error">
                        </p>
                    </div>
                    <div id="city-ch">
                        <p>Город:</p>
                        <input type="text" placeholder="Город" name="city" value="<?=$city?>">
                              <p class="error">
                        </p>
                    </div>
                    <div id="address_1-ch">
                        <p>Номер отделения:</p>
                        <input type="text"  name="address_1" placeholder="Номер отделения">
                          <p class="error">
                        </p>
                    </div>
                    <div id="email-ch">
                        <p>Email:</p>
                        <input type="text" value="<?=$email?>" name="email" placeholder="Email">
                          <p class="error">
                        </p>
                    </div>
                    <div>
                        <p>Коментарий к заказу:</p>
                        <textarea name="comment" placeholder="Ваш коментарий"></textarea>
                    </div>
                </form>
                <div class="but">
                    <form>
                        <input type="submit" id="ajax-button-confirm" value="Оформить заказ">
                    </form>
                </div>
            </div>
        </div>
<div class="hiden_payment_info">

</div>

      <script type="text/javascript"><!--

function updateShipping(s) {
    shp = JSON.parse(s.value)
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: shp,
        dataType: 'json',
        beforeSend: function() {
            $('#shipping-method').addClass('loading');
		},
        success: function(json) {
            $('.alert, .text-danger').remove();

            //if (json['redirect']) {
            //    location = json['redirect'];
            //}
            if (json['error']) {
                if (json['error']['warning']) {
                 // Error ylanyrkkaan....
                 alert(json['error']['warning']);
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/onepagecheckout/totals',
                    type: 'get',
                    success: function(json) {
                        $('.res p').remove();
                        
                        for (t in json['totals']) {
                            $('.res').append('<p><span>'+json['totals'][t]['title']+'</span>'+json['totals'][t]["text"]+'</p>');
                            }
                    }
                    });
                // Update Totalsi!
            }
            $('#shipping-method').removeClass('loading');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
        }
        ); //ajax
}

$(document).ready(function () {


            $('#ajax-button-confirm').on('click', function (e) {
                e.preventDefault();

$.ajax({
url: 'index.php?route=checkout/onepagecheckout',
type: 'post',
data: $('.formx input[type=\'text\'], .formx input[type=\'tel\'], .formx input[type=\'radio\']:checked, .formx select,.formx textarea,.formx input[type=\'hidden\'] '),
dataType: 'json',
beforeSend: function () {
$('#ajax-button-confirm').addClass('preloader');

},
complete: function () {
$('#ajax-button-confirm').removeClass('preloader');

},
success: function (json) {
console.log(json);

if (json.error) {
if (json['error']['firstname']) {
$('#firstname-ch .error').html(json['error']['firstname']);
}


if (json['error']['email']) {
    $('#email-ch .error').html(json['error']['email']);
}

if (json['error']['telephone']) {
    $('#telephone-ch .error').html(json['error']['telephone']);
}

if (json['error']['address_1']) {
    $('#address_1-ch .error').html(json['error']['address_1']);
}

if (json['error']['city']) {
    $('#city-ch .error').html(json['error']['city']);
}
}

else if(json['cod']) {
    $.ajax({
        type: 'get',
        url: 'index.php?route=extension/payment/cod/confirm',
        cache: false,
   
        success: function() {
            location = 'index.php?route=checkout/success';
            console.log('index.php?route=checkout/success');
        }
    });
}

else if(json['payment']) {
    $('.hiden_payment_info').html(json['payment']);
    console.log($('.hiden_payment_info a').attr('href'));
   // location = $('.hiden_payment_info a').attr('href');
}
else {
    if (json.credit)
        credit_confirm('/index.php?route=checkout/part_payment_cart/getResult&from_privat24=true');
   /* else
        location = 'index.php?route=checkout/success'*/

}
},
error: function (xhr, ajaxOptions, thrownError) {
           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
       }
});


});


});
//--></script>
<?php echo $footer; ?>
