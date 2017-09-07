// Store the value of cookie on site login in background.js to access it later from injectEvents.js events
chrome.runtime.onMessage.addListener(
    function(request, sender, sendResponse){
    	console.log("background.js");
        if (request.method == 'cookie'){    
			chrome.storage.local.set({"userId": request.userId}, function() {
			  if(chrome.runtime.lastError) {
			    console.error(
			      "Could not set userId to " + JSON.stringify(data) + ": " + chrome.runtime.lastError.message
			    );
			  }
			});
            sendResponse({
        		response: true
    		});
    	}
        else if (request.method == 'event')
        {
            var response1 = "";
        	chrome.storage.local.get("userId", function(data) {
			    if ("userId" in data){
	        	console.log("userId retrieved"+data.userId);
	        	a_id = request.a_id;
	        	a_text = request.a_text;
	        	a_link = request.a_link;
	        	timestamp = request.timestamp;
                main_link = request.main_link;
	        	TrackUser(data.userId, a_id, a_text, a_link, main_link, timestamp);
		       	response1 = false;
	        	}
	        	else {
	        		console.log("userId could not be retrieved");
	        		response1 = true;
	        	}
	        	
    		});
            sendResponse({
                    response: response1
            });
        }
        else if (request.method == 'deletecookie')
        {
           chrome.storage.local.clear(function() {
           var error = chrome.runtime.lastError;
           if (error) {
               console.error(error);
           }
           });
           sendResponse({
                    response: true
           }); 
        }
	}
);

function TrackUser(user, action, object, link, main_link, timestamp)
{
    $.ajax
    (
        {
            type: "POST",
            url: "http://ec2-54-215-192-184.us-west-1.compute.amazonaws.com/record/",
            dataType:"json",
            data: 
            {            
                'userId': user,   
                'action': action,
                'link':link,
                'obj':object,
                'timestamp':timestamp,
                'main_link': main_link
            },
            success: function(msg)
            {
                console.log("Event Tracked");
            }
        }
    );
}