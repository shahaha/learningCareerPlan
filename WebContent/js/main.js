function request(method,url,data,successCallBack,errorCallBack,async){
        $.ajax({
            url: url,
            //contentType:"application/json",
            async:async,
            //data: JSON.stringify(data),
            data:data,
            method: method
        }).done(successCallBack).fail(errorCallBack);
}

function showMessage(msg) {
    var c = $(".showmsg").attr("class");
    if (c == 'showmsg') {
	    $(".showmsg").fadeIn(100);
	    $(".showmsg>span").text(msg);
    } else {
	    var htm = '<div class="showmsg"><span>' + msg + '</span></div>';
	    $("body").append(htm);
	    $(".showmsg").fadeIn(100);
    }
    setTimeout(function() {
        $(".showmsg").fadeOut(100);
        }, 1500);
}

function serverError(XMLHttpRequest, textStatus){
    console.log("responseText:",XMLHttpRequest.responseText);
    console.log("status:",XMLHttpRequest.status);
    console.log("textStatus:",textStatus);
    console.log("readyState:",XMLHttpRequest.readyState);
    alert("服务器故障");
}


