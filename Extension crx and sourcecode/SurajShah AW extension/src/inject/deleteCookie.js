chrome.runtime.sendMessage({
      method: 'deletecookie'
    }, function(response){
    	document.cookie = 'userId' + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        if (response){
        //  alert("Successful");
            console.log("Successfully deleted cookie from localstorage");
        }
    });