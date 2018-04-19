$("#login_popup").on('submit',function(e){
    var form=$(this);
    e.preventDefault();
    $.ajax({
        url:form.attr('action'),
        data:form.serialize(),
        type:"POST",
        dataType:"json",
        success:function(json){
            if(json['redirect']){
                window.location=json['redirect'];
             }
            if(json['error_warning']){
                console.log(json['error_warning']);
                form.find(".error").html(json['error_warning']);
            }

        }

    });

});




$("#reg_popup").on('submit',function(e){
    e.preventDefault();
    var form=$(this);
    $.ajax({
        url:form.attr('action'),
        data:form.serialize(),
        type:"POST",
        dataType:"json",
        success:function(json){
        if(json['redirect']){
            window.location=json['redirect'];
        }
        if(json['errors']){
            form.find(".error").html(json['errors']);
        }
        
     

        }

        });
});

var showmore=function(link){
$.ajax({
url:link,
type:"GET",
dataType:"html",
beforeSend:function(){
 $( ".products" ).animate({opacity: "hide"}, 1000);

},
complete:function(){
 $( ".products" ).animate({opacity: "show"}, 1000);
},
success:function(html){
$(".products").html(html);
}
});

}



$(".show_login").click(function(){
        $('.loginpop').addClass('active');
      $('body').addClass('pop');  
      }
)


$(".onbask-x").on("click",function(){$(".onbask").removeClass("active"),$("body").removeClass("pop")});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: '/index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}


			if (json['success']) {
                var bask=$(".onbask");
                
                bask.find(".title .first").text(json['title']);
                bask.find(".price .sec").text(json['price']);
                bask.find(".quantity .sec").text(json['quantity']);
                  console.log(json['option'].length);
                if(json['option'].length){
                console.log(json['option'].length);
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

			
                $(".bask").load('/index.php?route=common/cart/info');
				$('.basket').load('/index.php?route=common/cart/info');
			}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: '/index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
		     $(".bask").eq(0).load('/index.php?route=common/cart/info');
             $('.basket').eq(0).load('/index.php?route=common/cart/info');
             $(".basket_price").html(json['total']+' грн');      
            $("#"+key).find(".res-price").text(json['total_pr']+" грн");
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: '/index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
		          $(".bask").eq(0).load('/index.php?route=common/cart/info');
                  $('.basket').eq(0).load('/index.php?route=common/cart/info');
                  $("#"+key).remove();
                  
                  
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}



var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: '/index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				/*if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}*/

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);

				//$('html, body').animate({ scrollTop: 0 }, 'slow');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(product_id) {
        	$.ajax({
			url: '/index.php?route=account/wishlist',
			type: 'get',
			data: 'remove=' + product_id,

			success: function() {
				
                $("#wishlist_"+product_id).remove();
                
			},
			error: function(xhr, ajaxOptions, thrownError) {
			//	alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});


            
	}
}