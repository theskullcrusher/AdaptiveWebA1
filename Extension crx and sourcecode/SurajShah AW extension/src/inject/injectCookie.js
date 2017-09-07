function getCookie(ck) {
    var nm = ck + "=";
    var decodedck = decodeURIComponent(document.cookie);
    var ck1 = decodedck.split(';');
    for(var i = 0; i <ck1.length; i++) {
        var a = ck1[i];
        while (a.charAt(0) == ' ') {
            a = a.substring(1);
        }
        if (a.indexOf(nm) == 0) {
            return a.substring(nm.length, a.length);
        }
    }
    return "";
}
var x = getCookie('userId');
if (x == ""){
    alert("Please login to the website before accessing profile page");
}
else{
//    alert('Cookie is '+ x);
    chrome.runtime.sendMessage({
      method: 'cookie', userId: x 
    }, function(response){
        if (response){
        //  alert("Successful");
            console.log("Successfully stored cookie in localstorage");
        }
    });
}
