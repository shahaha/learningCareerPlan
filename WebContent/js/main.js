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

function jsonBoolean2String(paramJson) {
	var newJson = paramJson;
	if (newJson != null) {
		for ( var item in newJson) {
			var temp = newJson[item];
			if (temp != null) {
				if (typeof(temp) === 'array' && temp.length === undefined) {
					$.each(temp,function(idx,obj){
						jsonBoolean2String(obj);
					});
				} else if (typeof(temp) === 'object' && temp.length === undefined) {
					jsonBoolean2String(temp);
				}else if (temp == true || temp == false) {
					newJson[item] = String(temp);
				}
			}
		}
	}
	return newJson;
}

