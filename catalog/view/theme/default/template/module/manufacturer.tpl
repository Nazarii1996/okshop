        <section class="brand">
            <div class="container">
                <div class="tit">
                    <h3>Бренды</h3>
                </div>
                <div class="brand-slide">
                <?php foreach($manufacturers as $manufacturer){?>
                    <div class="brand-item">
                        <img title="<?=$manufacturer['name']?>" src="<?=$manufacturer['image']?>">
                    </div>
                <?php } ?>
                </div>
            </div>
        </section>
<script>
	function gobrandpage(id){
		window.location.href=id;
	}
</script>