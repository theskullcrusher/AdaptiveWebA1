$(window).load(function(){
	localStorage.setItem('flag','false');
});
$(document).on('click', 'a', function(event) {
 a_id = 'click';

 main_link = $(location).attr('href');
 text = $(this).html();
 link = $(this).attr('href');
 date = new Date();
 timestamp = date.getTime();
 //alert(''+text+'\n'+link + '\n'+timestamp);

 chrome.runtime.sendMessage({
      method:'event', a_id: a_id, a_text: text, a_link: link, timestamp: timestamp, main_link: main_link 
    },function(response) {
    	if (response){
		        var flag = localStorage.getItem('flag') || '';
			    if (flag != 'true') {
			      alert("Please login to the website first before using stackoverflow for tracking events");
			      localStorage.setItem('flag','true');
			    }
		}
    	else{
    	console.log("Logged click event successfully");
    	}
  	});
});


$.fn.scrollLimit = function(callback, timeout) {          
  $(this).scroll(function(){
    var $this = $(this);
    if ($this.data('scrollTimeout')) {
      clearTimeout($this.data('scrollTimeout'));
    }
    $this.data('scrollTimeout', setTimeout(callback,timeout));
  });
};

var ScrollDirTop = 0;
$(document).ready(function(){  
	$(window).scrollLimit(function(){
	    // a_id = $(this).attr('id'));
		 a_id = 'scroll';

		 var val = $(this).scrollTop();
	     if (val > ScrollDirTop){
	  		a_id += ' down';
	     } else {
	     	a_id += ' up';
	     }
	     ScrollDirTop = val;

		 main_link = $(location).attr('href');
		 text = '';
		 link = '';
		 date = new Date();
		 timestamp = date.getTime();
		 //alert(''+text+'\n'+link + '\n'+timestamp);
		 chrome.runtime.sendMessage({
		      method:'event', a_id: a_id, a_text: text, a_link: link, timestamp: timestamp, main_link: main_link
		    },function(response) {
		    	if (response){
			        var flag = localStorage.getItem('flag') || '';
				    if (flag != 'true') {
				      alert("Please login to the website first before using stackoverflow for tracking events");
				      localStorage.setItem('flag','true');
				    }
			    }
		    	else{
		    	console.log("Logged scroll event successfully");
		    	}
		  	});
	}, 1000);
});

$(document).ready(function(){  
	$(document).on("mouseover", ".vote-up-off, .post-tag, .js-gps.track, .star-off", function () {
	 a_id = 'hover';
	 main_link = $(location).attr('href');
	 text = $(this).html();
	 link = $(this).attr('href');
	 date = new Date();
	 timestamp = date.getTime();

	 chrome.runtime.sendMessage({
	      method:'event', a_id: a_id, a_text: text, a_link: link, timestamp: timestamp, main_link: main_link 
	    },function(response) {
	    	if (response){
			        var flag = localStorage.getItem('flag') || '';
				    if (flag != 'true') {
				      alert("Please login to the website first before using stackoverflow for tracking events");
				      localStorage.setItem('flag','true');
				    }
			}
	    	else{
	    		console.log("Logged hover event successfully");
	    	}
	  	});   
	});
});

$(document).ready(function(){  
	$("form").submit( function () {
	 a_id = '';
	 main_link = $(location).attr('href');
	 text = $(this).attr('action');
	 if (text == 'post-form'){
	 	a_id = 'Post';
	 }
	 else{
	 	a_id = 'Search';
	 }
	 link = $(this).attr('action');
	 date = new Date();
	 timestamp = date.getTime();
     
     console.log("Post/Search triggered");

	 chrome.runtime.sendMessage({
	      method:'event', a_id: a_id, a_text: text, a_link: link, timestamp: timestamp, main_link: main_link 
	    },function(response) {
	    	if (response){
			        var flag = localStorage.getItem('flag') || '';
				    if (flag != 'true') {
				      alert("Please login to the website first before using stackoverflow for tracking events");
				      localStorage.setItem('flag','true');
				    }
			}
	    	else{
	    		console.log("Logged post/search event successfully");
	    	}
	  	});   
	});
});