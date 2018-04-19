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
  
    <section class="contact">
            <div class="container">
                <div class="contact-container">
                    <div class="contact-inf">
                        <div class="contact-inf-item">
                            <p>Контакты:</p>
                          <?=$contancts?>
                        </div>
                        <div class="contact-inf-item">
                            <p>Режим работы:</p>
                                <?=$work_time?>
                        </div>
                    </div>
                    <div class="contact-about">
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal" >
                            <p>Обратная форма связи</p>
                            <div>
                                <input type="text" placeholder="Имя" type="text" name="name" value="<?php echo $name; ?>" id="input-name" >
                                 <?php if ($error_name) { ?>
                                     <div class="text-danger"><?php echo $error_name; ?></div>
                                 <?php } ?>
                                 
                                <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" placeholder="E-mail">
                                <?php if ($error_email) { ?>
                                    <div class="text-danger"><?php echo $error_email; ?></div>
                                <?php } ?>
                                
                                
                                
                            </div>
                            <textarea name="enquiry" rows="10" id="input-enquiry" placeholder="Текст сообщения"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                                 <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                            <input type="submit" value="Отправить">
                        </form>
                        <h2>О нас:</h2>
                        <p class="text">Заказать косметику в нашем интернет-магазине вы можете круглосуточно онлайн в любое удобное для вас время или по телефону в рабочие дни с 10.00 до 18.30</p>
                        <p class="text big">У НАС - ТОЛЬКО ОРИГИНАЛЬНОЕ КАЧЕСТВО, НЕТ РЕПЛИК И ПОДДЕЛОК</p>
                        <p class="text">Все мы знаем, что косметика произведенная не для стран СНГ совершенно другого качества, именно ее вы можете приобрести в нашем магазине и почувствовать все преимущества такой косметики.</p>
                        <p class="text">Каждый покупатель может оставить отзыв, который не подвергается редактированию и вы можете прочитать объективную информацию о наших товарах</p>
                        <p class="text">Мы работаем по принципу " Все для покупателя". С нами всегда можно решить любой вопрос.</p>
                        <p class="text">В нашем магазине работает индивидуальная гибкая система скидок.
                            <br> Мы готовы обсудить любые варианты сотрудничества.</p>
                    </div>
                </div>
            </div>
        </section>


<?php echo $footer; ?>
