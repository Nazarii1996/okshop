<?php if($is_Logged){?>


                                <p><i class="icon-basket"></i></p>
                                <p class="price"><?=$text_items?></p>
                                <a href="<?=$checkout?>"></a>
                 

<?php } else { ?>
<i class="icon-basket"></i><?=$text_items?>


<?php } ?>