        <section class="kit-ban">
            <div class="container">
                <div class="kit-ban-slide">
                <?php foreach($banners as $banner){?>
                    <div class="kit-ban-item">
                        <img title="<?=$banner['title']?>" src="<?=$banner['image']?>">
                    </div>
                    <?php } ?>
            
                </div>
            </div>
        </section>