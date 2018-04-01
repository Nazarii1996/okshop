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

