<section class="categories">
            <div class="container">
                <div class="tit">
                    <h3>Категории</h3>
                </div>
                <div class="categ-cont">
                <?php foreach($categories as $category){?>
                    <div class="categ-item">
                        <div class="img" style="height: 193px;">
                            <img src="<?=$category['image']?>">
                        </div>
                        <div class="text">
                            <p class="cat-tit"><span><?=$category['name']?></span></p>
                            <p class="decs"><?=$category['description']?></p>
                        </div>
                        <a href="<?=$category['href']?>"></a>
                    </div>
                <?php } ?>
                </div>
            </div>
        </section>