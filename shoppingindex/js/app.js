$(document).ready(function(){
	$("#shopping-car").mouseover(function(){
		$(this).children("ul").show();
		$("#shopping-car").css({
				"backgroundColor":"#fff",
				"boxShadow":"0px 0px 1px 1px #ccc",
		});
		$("#shopping-car img").attr("src","images/图标/icon-购物车-商品旁.png");
//		$("a:hover").css("color","#FF6700");
		$("#shopping-car a").css({
			"color":"#F1C318"				
		});	
	});
	$("#shopping-car").mouseout(function(){
		$(this).find("ul").hide();
		$("#shopping-car").css({
				"backgroundColor":"#333",
				"boxShadow":"none",
		});
		$("#shopping-car a").css("color","#8C8C8C");
		$("#shopping-car img").attr("src","images/图标/icon-购物车.png");
	});
	$(".first-list").mouseover(function(){
		$(this).addClass("active").children("ul").show();
		
	});
	$(".first-list").mouseout(function(){
		$(this).removeClass("active").children("ul").hide();
	});
});
  $(function () {
            var container = $('#carousel-nav');
            var list = $('#carousel-list');
            var buttons = $('#carousel-btn span');
            var prev = $('#prev');
            var next = $('#next');
            var index = 1;
            var len = 3;
            var interval = 3000;
            var timer;


            function animate (offset) {
                var left = parseInt(list.css('left')) + offset;
                if (offset>0) {
                    offset = '+=' + offset;
                }
                else {
                    offset = '-=' + Math.abs(offset);
                }
                list.animate({'left': offset}, 613, function () {
                    if(left > -408){
                        list.css('left', -1226 * len);
                    }
                    if(left < (-1226 * len)) {
                        list.css('left', -1226);
                    }
                });
            }

            function showButton() {
                buttons.eq(index-1).addClass('on').siblings().removeClass('on');
            }

            function play() {
                timer = setTimeout(function () {
                    next.trigger('click');
                    play();
                }, interval);
            }
            function stop() {
                clearTimeout(timer);
            }

            next.bind('click', function () {
                if (list.is(':animated')) {
                    return;
                }
                if (index == 3) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-1226);
                showButton();
            });

            prev.bind('click', function () {
                if (list.is(':animated')) {
                    return;
                }
                if (index == 1) {
                    index = 3;
                }
                else {
                    index -= 1;
                }
                animate(1226);
                showButton();
            });

            buttons.each(function () {
                 $(this).bind('click', function () {
                     if (list.is(':animated') || $(this).attr('class')=='on') {
                         return;
                     }
                     var myIndex = parseInt($(this).attr('index'));
                     var offset = -1226 * (myIndex - index);

                     animate(offset);
                     index = myIndex;
                     showButton();
                 })
            });

            container.hover(stop, play);

            play();

        });