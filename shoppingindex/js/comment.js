//function showHint(id,changeHtml) {
//				var xmlhttp;
//				
//				if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
//					xmlhttp = new XMLHttpRequest();
//				} else { // code for IE6, IE5
//					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
//				}
//				xmlhttp.onreadystatechange = function() {
//					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
//						changeHtml(xmlhttp.responseText);
//					}
//				}
//				var url ="http://localhost/play/admin.php/Home/Comment/comment?id=1&content=2"
//				if(id=="b1")
//				{
//				xmlhttp.open("GET", url, true);
//				}
////				if(id=="s2")
////				{
////				xmlhttp.open("GET", "http://localhost/play/admin.php/Home/zan/cut", true);	
////				}
//				xmlhttp.send();
//			}

function getJson(url,changeHtml) {
				var xmlhttp;
				if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else { // code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						changeHtml(xmlhttp.responseText);
					}
				}
				xmlhttp.open("GET", url, true);
				xmlhttp.send();
			}