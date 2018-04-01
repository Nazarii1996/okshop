<script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemail').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					$(".subscription").find('.error').html("Неправильный Email");
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=extension/module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemail').val(),
						dataType: 'json',
						
									
						success: function(json) {
						
						$(".subscription").find('.error').html(json.message);
						
						}
						
					});
					return false;
				}
			}
			else
			{
				$(".subscription").find('.error').html("Email обязательно");
				$(email).focus();
				return false;
			}
			

		}
	</script>
	
        <section class="subscription">
            <div class="container">
                <div class="sub-cont">
                    <h3>Будьте в курсах всех новинок!</h3>
                    <span class="error"></span>
                    <form>
                   
                        <input type="text"  name="name" placeholder="Имя">
                        <input type="email" id="txtemail" name="email" placeholder="E-mail">
                        <input type="submit" onclick="subscribe();return false;" value="Подписаться!">
                        </form>
                 
                </div>
            </div>
        </section>