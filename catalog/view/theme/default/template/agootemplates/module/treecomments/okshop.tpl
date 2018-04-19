          <section class="answerpop">
            <div class="popcont">
                <div class="answer-x">
                    <span></span>
                </div>
                <p>Ответить</p>
                <div class="block">
                    <label>Текст отзыва:</label>
                    <input type="hidden" name="name" value="fas" />
                    <textarea name="text"></textarea>
                    
                </div>
            
            </div>
        </section>

        <section class="notregpop">
            <div class="popcont">
                <div class="notregpop-x">
                    <span></span>
                </div>
                <p>Отзывы могут оставлять лишь зарегистрированные пользователи</p>
                <form>
                    <input class="login" class="ent" type="submit" value="Войти">
                    <input class="registration" type="submit" value="Регистрация">
                </form>
            </div>
        </section>
<div class="container_comments <?php if (isset($settings_widget['number_comments']) && $settings_widget['number_comments'] == '0') { ?> agoo_displaynone <?php } ?>" id="container_comments_<?php echo $mark;?>_<?php echo $mark_id;?>">
	<!-- <noindex> -->

	<!-- </noindex> -->




<?php if (isset($settings_widget['micro_status']) && $settings_widget['micro_status'] && isset($comments_stat['count_ratings']) && $comments_stat['count_ratings'] > 0.1 && isset($product_info['name']) && $product_info['name']!='') { ?>
<span vocab="http://schema.org/" typeof="<?php
    if (isset($product_info['name']) && $product_info['name']!='') {
    	echo "Product";
    }
  ?>">
    <span property="name" content="<?php
    if (isset($product_info['name']) && $product_info['name']!='') {
    	echo strip_tags(htmlspecialchars($product_info['name'], ENT_COMPAT, 'UTF-8'));
    }
  ?>"></span>

  <span property="aggregateRating" typeof="AggregateRating">
      <span property="ratingValue" min="1" value="<?php echo round($comments_stat['count_ratings_value'] / $comments_stat['count_ratings']); ?>" max="5" content="<?php echo round($comments_stat['count_ratings_value'] / $comments_stat['count_ratings']);?>"></span>
      <span property="bestRating" content="5"></span>
      <span property="worstRating" content="1"></span>
      <span property="ratingCount" content="<?php echo $comments_stat['count_ratings'];?>"></span>
  </span>
</span>

<?php } ?>

	<?php
	if (isset($mycomments) && $mycomments) {
	  	if (isset($record_comment['admin_name']) && $record_comment['admin_name']) {
			$admin_name =  array_flip(explode(";",trim($record_comment['admin_name'])));
		}

		$admin = false;
		$opendiv=0;
		foreach ($mycomments as $number => $comment) {
		$opendiv++;
		if (isset($admin_name[trim($comment['author'])]) || (isset($settings_widget['admins']) && in_array($comment['customer_id'], $settings_widget['admins']))) {
		 $back_color = 'background-color: '.$record_comment['admin_color'].';';
		 $admin = true;
		} else {
		 $back_color ='';
		 $admin = false;
		}
	?>
                        <div class="rew <?php if($comment['level']){?>answer <?php } ?>">
                        
                            <div class="login">
                                <p class="name"><?php  echo $comment['author']; ?></p>
                                <p class="date"><?php echo $comment['date_added']; ?></p>
                                <ul class="mark">
                            
                                <?php for($i=1;$i<=5;$i++){?>
                                <?php if($i<=$comment['rating']){?>
                                    <li><i class="icon-star"></i></li>
                                <?php } else { ?>
                                    <li class="empty"><i class="icon-star"></i></li>
                            <?php } ?>
                            <?php } ?>
                                </ul>
                            </div>
                            <div class="rew-text">
                                <p><?php echo $comment['text']; ?></p>	
                                	<div class="container_comment_vars" id="container_comment_<?php echo $mark;?>_<?php echo $mark_id;?>_<?php echo  $comment['comment_id']; ?>" style="display: none">
			<div class="comment_id"><?php echo  $comment['comment_id']; ?></div>
		</div>
                                <p class="answ" >
                                
		<a href="#" data-cmswidget="<?php echo $cmswidget; ?>" id="comment_id_reply_<?php echo $comment['comment_id']; ?>" class="reply comment_reply comment_buttons hrefajax"><?php
					echo $text_reply_button;
					?></a>
                                </p>
                                
                            </div>
                        </div>


<?php

}
?>

<!-- <noindex> -->

<div class="pagination sc_h_s"><?php echo $pagination; ?></div>
<!-- </noindex> -->
<div class="overflowhidden">&nbsp;</div>
<?php  }  else { ?>
<!-- <noindex> -->
<div class="sc_h_s"><?php echo $text_no_comments; ?></div>
<!-- </noindex> -->
<?php
}
?>
</div>
<script>
$(document).ready(function(){
$('.sc_h_s').show();
});
</script>


<script>
var isLogged=<?=$is_Logged?>;
$(".reply").click(function(e){
    
   if(!isLogged){
  
      $('.loginpop').addClass('active');
      $('body').addClass('pop');
    return false;
   }else{
   /* $(".answerpop").addClass("active");
    $('body').addClass('pop');*/
   }
    
    
})
$(".answer-x").click(function(){
    $(".answerpop").removeClass("active"),
    $("body").removeClass("pop")
    return false;
})


</script>