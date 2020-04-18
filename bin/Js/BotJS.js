document.addEventListener('DOMContentLoaded', function () {
   
var elemDiv1 = document.createElement('div');
elemDiv1.id ="OpenChatIcon"
elemDiv1.style.cssText = 'position:fixed;right:5px;bottom:5px;backgroud-color:red';
elemDiv1.innerHTML = '<img style="width:60%" src="https://kartooz2000hotmail.sharepoint.com/Sites/IdeationDemo/SiteAssets/boticon.png" />';
document.body.appendChild(elemDiv1);
var elemDiv2 = document.createElement('div');
elemDiv2.id = "Chat"
elemDiv2.style.cssText = 'visibility:hidden;width:400px;height500px;position:fixed;right:5px;bottom:5px;backgroud-color:Green;';
    elemDiv2.innerHTML = '<img id="chatclose" style="width: 25px;right: 5px;position: absolute;padding-top: 10px;" src="https://kartooz2000hotmail.sharepoint.com/Sites/IdeationDemo/SiteAssets/iconclose.png"><div  style="background: white;min-width: 400px; width: 100%; min-height: 500px;"></div>'; 
document.body.appendChild(elemDiv2);

document.getElementById("OpenChatIcon").addEventListener('click', function (event) { 
	document.getElementById("Chat").style.visibility = "visible";
	 document.getElementById("OpenChatIcon").style.visibility = "hidden";
});
document.getElementById("chatclose").addEventListener('click', function (event) { 
	document.getElementById("Chat").style.visibility = "hidden";
	 document.getElementById("OpenChatIcon").style.visibility = "visible";
});

});
