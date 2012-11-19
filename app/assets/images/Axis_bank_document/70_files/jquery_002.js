/*!
 AnythingSlider v1.7.27 minified using Google Closure Compiler
 Original by Chris Coyier: http://css-tricks.com
 Get the latest version: https://github.com/ProLoser/AnythingSlider
*/

(function(d){d.anythingSlider=function(h,j){var a=this,b;a.el=h;a.$el=d(h).addClass("anythingBase").wrap('<div class="anythingSlider"><div class="anythingWindow" /></div>');a.$el.data("AnythingSlider",a);a.init=function(){a.options=b=d.extend({},d.anythingSlider.defaults,j);a.initialized=!1;d.isFunction(b.onBeforeInitialize)&&a.$el.bind("before_initialize",b.onBeforeInitialize);a.$el.trigger("before_initialize",a);a.$wrapper=a.$el.parent().closest("div.anythingSlider").addClass("anythingSlider-"+ b.theme);a.$window=a.$el.closest("div.anythingWindow");a.win=window;a.$win=d(a.win);a.$controls=d('<div class="anythingControls"></div>').appendTo(b.appendControlsTo&&d(b.appendControlsTo).length?d(b.appendControlsTo):a.$wrapper);a.$startStop=d('<a href="#" class="start-stop"></a>');b.buildStartStop&&a.$startStop.appendTo(b.appendStartStopTo&&d(b.appendStartStopTo).length?d(b.appendStartStopTo):a.$controls);a.$nav=d('<ul class="thumbNav" />').appendTo(b.appendNavigationTo&&d(b.appendNavigationTo).length? d(b.appendNavigationTo):a.$controls);a.flag=!1;a.playing=b.autoPlay;a.slideshow=!1;a.hovered=!1;a.panelSize=[];a.currentPage=b.startPanel=parseInt(b.startPanel,10)||1;b.changeBy=parseInt(b.changeBy,10)||1;a.adj=b.infiniteSlides?0:1;a.width=a.$el.width();a.height=a.$el.height();a.outerPad=[a.$wrapper.innerWidth()-a.$wrapper.width(),a.$wrapper.innerHeight()-a.$wrapper.height()];b.playRtl&&a.$wrapper.addClass("rtl");b.expand&&(a.$outer=a.$wrapper.parent(),a.$window.css({width:"100%",height:"100%"}), a.checkResize());b.buildStartStop&&a.buildAutoPlay();b.buildArrows&&a.buildNextBackButtons();b.autoPlay||(b.autoPlayLocked=!1);a.updateSlider();a.runTimes=d("div.anythingSlider").index(a.$wrapper)+1;a.regex=RegExp("panel"+a.runTimes+"-(\\d+)","i");1===a.runTimes&&a.makeActive();d.isFunction(d.easing[b.easing])||(b.easing="swing");b.pauseOnHover&&a.$wrapper.hover(function(){if(a.playing){a.$el.trigger("slideshow_paused",a);a.clearTimer(true)}},function(){if(a.playing){a.$el.trigger("slideshow_unpaused", a);a.startStop(a.playing,true)}});a.setCurrentPage(a.gotoHash()||b.startPage,!1);a.$lastPage=a.$targetPage=a.$currentPage;a.slideControls(!1);a.$wrapper.bind("mouseenter mouseleave",function(b){a.hovered=b.type==="mouseenter"?true:false;a.slideControls(a.hovered,false)});d(document).keyup(function(c){if(b.enableKeyboard&&a.$wrapper.is(".activeSlider")&&!c.target.tagName.match("TEXTAREA|INPUT|SELECT")&&(b.vertical||!(c.which===38||c.which===40)))switch(c.which){case 39:case 40:a.goForward();break; case 37:case 38:a.goBack()}});a.$items.delegate("a","focus.AnythingSlider",function(c){var e=d(this).closest(".panel"),e=a.$items.index(e)+a.adj;a.$items.find(".focusedLink").removeClass("focusedLink");d(this).addClass("focusedLink");a.$window.scrollLeft(0);if(e!==-1&&(e>=a.currentPage+b.showMultiple||e<a.currentPage)){a.gotoPage(e);c.preventDefault()}});var c="slideshow_paused,slideshow_unpaused,slide_init,slide_begin,slideshow_stop,slideshow_start,initialized,swf_completed".split(",");d.each("onShowPause,onShowUnpause,onSlideInit,onSlideBegin,onShowStop,onShowStart,onInitialized,onSWFComplete".split(","), function(f,e){d.isFunction(b[e])&&a.$el.bind(c[f],b[e])});d.isFunction(b.onSlideComplete)&&a.$el.bind("slide_complete",function(){setTimeout(function(){b.onSlideComplete(a)},0)});a.initialized=!0;a.$el.trigger("initialized",a);a.startStop(a.playing)};a.updateSlider=function(){var c;a.$el.children(".cloned").remove();a.$nav.empty();a.currentPage=a.currentPage||1;a.$items=a.$el.children();a.pages=a.$items.length;a.dir=b.vertical?"top":"left";b.showMultiple=b.vertical?1:parseInt(b.showMultiple,10)|| 1;b.navigationSize=!1===b.navigationSize?0:parseInt(b.navigationSize,10)||0;1<b.showMultiple&&(b.showMultiple>a.pages&&(b.showMultiple=a.pages),a.adjustMultiple=b.infiniteSlides&&1<a.pages?0:b.showMultiple-1,a.pages=a.$items.length-a.adjustMultiple);a.$controls.add(a.$nav).add(a.$startStop).add(a.$forward).add(a.$back)[1>=a.pages?"hide":"show"]();1<a.pages&&a.buildNavigation();b.infiniteSlides&&1<a.pages&&(a.$el.prepend(a.$items.filter(":last").clone().addClass("cloned")),1<b.showMultiple?a.$el.append(a.$items.filter(":lt("+ b.showMultiple+")").clone().addClass("cloned multiple")):a.$el.append(a.$items.filter(":first").clone().addClass("cloned")),a.$el.find(".cloned").each(function(){d(this).find("a,input,textarea,select,button,area").attr("disabled","disabled");d(this).find("[id]").andSelf().removeAttr("id")}));a.$items=a.$el.children().addClass("panel"+(b.vertical?" vertical":""));a.setDimensions();b.resizeContents?(a.$items.css("width",a.width),a.$wrapper.css("width",a.getDim(a.currentPage)[0]).add(a.$items).css("height", a.height)):a.$win.load(function(){a.setDimensions();c=a.getDim(a.currentPage);a.$wrapper.css({width:c[0],height:c[1]})});a.currentPage>a.pages&&(a.currentPage=a.pages);a.setCurrentPage(a.currentPage,!1);a.$nav.find("a").eq(a.currentPage-1).addClass("cur")};a.buildNavigation=function(){if(b.buildNavigation&&1<a.pages){var c,f,e,g,i;a.$items.filter(":not(.cloned)").each(function(l){i=d("<li/>");e=l+1;f=b.tooltipClass+(1===e?" first":"")+(e===a.pages?" last":"");c='<a class="panel'+e+'" href="#"><span>@</span></a>'; d.isFunction(b.navigationFormatter)?(g=b.navigationFormatter(e,d(this)),"string"===typeof g?i.html(c.replace(/@/,g)):i=d("<li/>",g)):i.html(c.replace(/@/,e));i.appendTo(a.$nav).addClass(f).data("index",e)});a.$nav.children("li").bind(b.clickControls,function(c){!a.flag&&b.enableNavigation&&(a.flag=!0,setTimeout(function(){a.flag=!1},100),a.gotoPage(d(this).data("index")));c.preventDefault()});b.navigationSize&&b.navigationSize<a.pages&&(a.$controls.find(".anythingNavWindow").length||a.$nav.before('<ul><li class="prev"><a href="#"><span>'+ b.backText+"</span></a></li></ul>").after('<ul><li class="next"><a href="#"><span>'+b.forwardText+"</span></a></li></ul>").wrap('<div class="anythingNavWindow"></div>'),a.navWidths=a.$nav.find("li").map(function(){return d(this).innerWidth()+Math.ceil(parseInt(d(this).find("span").css("left"),10)/2||0)}).get(),a.navLeft=a.currentPage,a.$nav.width(a.navWidth(1,a.pages+1)+5),a.$controls.find(".anythingNavWindow").width(a.navWidth(1,b.navigationSize+1)).end().find(".prev,.next").bind(b.clickControls, function(c){a.flag||(a.flag=!0,setTimeout(function(){a.flag=!1},200),a.navWindow(a.navLeft+b.navigationSize*(d(this).is(".prev")?-1:1)));c.preventDefault()}))}};a.navWidth=function(b,d){var e;e=Math.min(b,d);for(var g=Math.max(b,d),i=0;e<g;e++)i+=a.navWidths[e-1]||0;return i};a.navWindow=function(c){if(b.navigationSize&&b.navigationSize<a.pages&&a.navWidths){var d=a.pages-b.navigationSize+1,c=1>=c?1:1<c&&c<d?c:d;c!==a.navLeft&&(a.$controls.find(".anythingNavWindow").animate({scrollLeft:a.navWidth(1, c),width:a.navWidth(c,c+b.navigationSize)},{queue:!1,duration:b.animationTime}),a.navLeft=c)}};a.buildNextBackButtons=function(){a.$forward=d('<span class="arrow forward"><a href="#"><span>'+b.forwardText+"</span></a></span>");a.$back=d('<span class="arrow back"><a href="#"><span>'+b.backText+"</span></a></span>");a.$back.bind(b.clickBackArrow,function(c){b.enableArrows&&!a.flag&&(a.flag=!0,setTimeout(function(){a.flag=!1},100),a.goBack());c.preventDefault()});a.$forward.bind(b.clickForwardArrow, function(c){b.enableArrows&&!a.flag&&(a.flag=!0,setTimeout(function(){a.flag=!1},100),a.goForward());c.preventDefault()});a.$back.add(a.$forward).find("a").bind("focusin focusout",function(){d(this).toggleClass("hover")});a.$back.appendTo(b.appendBackTo&&d(b.appendBackTo).length?d(b.appendBackTo):a.$wrapper);a.$forward.appendTo(b.appendForwardTo&&d(b.appendForwardTo).length?d(b.appendForwardTo):a.$wrapper);a.arrowWidth=a.$forward.width();a.arrowRight=parseInt(a.$forward.css("right"),10);a.arrowLeft= parseInt(a.$back.css("left"),10)};a.buildAutoPlay=function(){a.$startStop.html("<span>"+(a.playing?b.stopText:b.startText)+"</span>").bind(b.clickSlideshow,function(c){b.enableStartStop&&(a.startStop(!a.playing),a.makeActive(),a.playing&&!b.autoPlayDelayed&&a.goForward(!0));c.preventDefault()}).bind("focusin focusout",function(){d(this).toggleClass("hover")})};a.checkResize=function(c){clearTimeout(a.resizeTimer);a.resizeTimer=setTimeout(function(){var d=a.$outer.width()-a.outerPad[0],e=("BODY"=== a.$outer[0].tagName?a.$win.height():a.$outer.height())-a.outerPad[1];if(a.width*b.showMultiple!==d||a.height!==e)a.setDimensions(),a.gotoPage(a.currentPage,a.playing,null,-1);"undefined"===typeof c&&a.checkResize()},500)};a.setDimensions=function(){var c,f,e,g,i=0,h={width:"100%",height:"100%"},k=1<b.showMultiple?a.width||a.$window.width()/b.showMultiple:a.$window.width(),j=a.$win.width();b.expand&&(c=a.$outer.width()-a.outerPad[0],a.height=f=a.$outer.height()-a.outerPad[1],a.$wrapper.add(a.$window).add(a.$items).css({width:c, height:f}),a.width=k=1<b.showMultiple?c/b.showMultiple:c);a.$items.each(function(m){g=d(this);e=g.children();if(b.resizeContents){c=a.width;f=a.height;g.css({width:c,height:f});if(e.length){e[0].tagName==="EMBED"&&e.attr(h);e[0].tagName==="OBJECT"&&e.find("embed").attr(h);e.length===1&&e.css(h)}}else{c=g.width()||a.width;if(e.length===1&&c>=j){c=e.width()>=j?k:e.width();e.css("max-width",c)}g.css("width",c);f=e.length===1?e.outerHeight(true):g.height();if(f<=a.outerPad[1])f=a.height;g.css("height", f)}a.panelSize[m]=[c,f,i];i=i+(b.vertical?f:c)});a.$el.css(b.vertical?"height":"width",i)};a.getDim=function(c){if(1>a.pages||isNaN(c))return[a.width,a.height];var c=b.infiniteSlides&&1<a.pages?c:c-1,d,e=a.panelSize[c][0],g=a.panelSize[c][1];if(1<b.showMultiple)for(d=1;d<b.showMultiple;d++)e+=a.panelSize[(c+d)%b.showMultiple][0],g=Math.max(g,a.panelSize[c+d][1]);return[e,g]};a.goForward=function(c){a.gotoPage(a.currentPage+b.changeBy*(b.playRtl?-1:1),c)};a.goBack=function(c){a.gotoPage(a.currentPage+ b.changeBy*(b.playRtl?1:-1),c)};a.gotoPage=function(c,f,e,g){!0!==f&&(f=!1,a.startStop(!1),a.makeActive());/^[#|.]/.test(c)&&d(c).length&&(c=d(c).closest(".panel").index()+a.adj);1!==b.changeBy&&(0>c&&(c+=a.pages),c>a.pages&&(c-=a.pages));if(!(1>=a.pages)&&(a.$lastPage=a.$currentPage,"number"!==typeof c&&(c=b.startPanel,a.setCurrentPage(c)),!f||!b.isVideoPlaying(a)))a.exactPage=c,c>a.pages+1-a.adj&&(c=!b.infiniteSlides&&!b.stopAtEnd?1:a.pages),c<a.adj&&(c=!b.infiniteSlides&&!b.stopAtEnd?a.pages:1), b.infiniteSlides||(a.exactPage=c),a.currentPage=c>a.pages?a.pages:1>c?1:a.currentPage,a.$currentPage=a.$items.eq(a.currentPage-a.adj),a.targetPage=0===c?a.pages:c>a.pages?1:c,a.$targetPage=a.$items.eq(a.targetPage-a.adj),g=g||b.animationTime,0<=g&&a.$el.trigger("slide_init",a),a.slideControls(!0,!1),!0!==f&&(f=!1),(!f||b.stopAtEnd&&c===a.pages)&&a.startStop(!1),0<=g&&a.$el.trigger("slide_begin",a),setTimeout(function(d){var f,h=true;if(!b.resizeContents){f=a.getDim(c);d={};if(a.$wrapper.width()!== f[0]){d.width=f[0]||a.width;h=false}if(a.$wrapper.height()!==f[1]){d.height=f[1]||a.height;h=false}h||a.$wrapper.filter(":not(:animated)").animate(d,{queue:false,duration:g<0?0:g,easing:b.easing})}d={};d[a.dir]=-a.panelSize[b.infiniteSlides&&a.pages>1?c:c-1][2];a.$el.filter(":not(:animated)").animate(d,{queue:false,duration:g,easing:b.easing,complete:function(){a.endAnimation(c,e,g)}})},parseInt(b.delayBeforeAnimate,10)||0)};a.endAnimation=function(c,d,e){0===c?(a.$el.css(a.dir,-a.panelSize[a.pages][2]), c=a.pages):c>a.pages&&(a.$el.css(a.dir,-a.panelSize[1][2]),c=1);a.exactPage=c;a.setCurrentPage(c,!1);a.$items.removeClass("activePage").eq(c-a.adj).addClass("activePage");a.hovered||a.slideControls(!1);b.hashTags&&a.setHash(c);0<=e&&a.$el.trigger("slide_complete",a);"function"===typeof d&&d(a);b.autoPlayLocked&&!a.playing&&setTimeout(function(){a.startStop(true)},b.resumeDelay-(b.autoPlayDelayed?b.delay:0))};a.setCurrentPage=function(c,d){c=parseInt(c,10);if(!(1>a.pages||0===c||isNaN(c))){c>a.pages+ 1-a.adj&&(c=a.pages-a.adj);c<a.adj&&(c=1);b.buildNavigation&&a.$nav.find(".cur").removeClass("cur").end().find("a").eq(c-1).addClass("cur");!b.infiniteSlides&&b.stopAtEnd&&(a.$wrapper.find("span.forward")[c===a.pages?"addClass":"removeClass"]("disabled").end().find("span.back")[1===c?"addClass":"removeClass"]("disabled"),c===a.pages&&a.playing&&a.startStop());if(!d){var e=a.getDim(c);a.$wrapper.css({width:e[0],height:e[1]}).add(a.$window).scrollLeft(0);a.$el.css(a.dir,-a.panelSize[b.infiniteSlides&& 1<a.pages?c:c-1][2])}a.currentPage=c;a.$currentPage=a.$items.removeClass("activePage").eq(c-a.adj).addClass("activePage")}};a.makeActive=function(){a.$wrapper.is(".activeSlider")||(d(".activeSlider").removeClass("activeSlider"),a.$wrapper.addClass("activeSlider"))};a.gotoHash=function(){var c=a.win.location.hash,f=c.indexOf("&"),e=c.match(a.regex);null===e&&!/^#&/.test(c)&&!/#!?\//.test(c)?(c=c.substring(0,0<=f?f:c.length),e=d(c).length&&d(c).closest(".anythingBase")[0]===a.el?d(c).closest(".panel").index()+ a.adj:null):null!==e&&(e=b.hashTags?parseInt(e[1],10):null);return e};a.setHash=function(b){var d="panel"+a.runTimes+"-",e=a.win.location.hash;"undefined"!==typeof e&&(a.win.location.hash=0<e.indexOf(d)?e.replace(a.regex,d+b):e+"&"+d+b)};a.slideControls=function(c){var d=c?0:b.animationTime,e=c?b.animationTime:0,g=c?1:0,h=c?0:1;b.toggleControls&&a.$controls.stop(!0,!0).delay(d)[c?"slideDown":"slideUp"](b.animationTime/2).delay(e);b.buildArrows&&b.toggleArrows&&(!a.hovered&&a.playing&&(h=1,g=0),a.$forward.stop(!0, !0).delay(d).animate({right:a.arrowRight+h*a.arrowWidth,opacity:g},b.animationTime/2),a.$back.stop(!0,!0).delay(d).animate({left:a.arrowLeft+h*a.arrowWidth,opacity:g},b.animationTime/2))};a.clearTimer=function(b){a.timer&&(a.win.clearInterval(a.timer),!b&&a.slideshow&&(a.$el.trigger("slideshow_stop",a),a.slideshow=!1))};a.startStop=function(c,d){!0!==c&&(c=!1);if((a.playing=c)&&!d)a.$el.trigger("slideshow_start",a),a.slideshow=!0;b.buildStartStop&&(a.$startStop.toggleClass("playing",c).find("span").html(c? b.stopText:b.startText),"hidden"===a.$startStop.find("span").css("visibility")&&a.$startStop.addClass(b.tooltipClass).attr("title",c?b.stopText:b.startText));c?(a.clearTimer(!0),a.timer=a.win.setInterval(function(){b.isVideoPlaying(a)?b.resumeOnVideoEnd||a.startStop():a.goForward(true)},b.delay)):a.clearTimer()};a.init()};d.anythingSlider.defaults={theme:"default",expand:!1,resizeContents:!0,vertical:!1,showMultiple:!1,easing:"swing",buildArrows:!0,buildNavigation:!0,buildStartStop:!0,toggleArrows:!1, toggleControls:!1,startText:"Start",stopText:"Stop",forwardText:"&raquo;",backText:"&laquo;",tooltipClass:"tooltip",enableArrows:!0,enableNavigation:!0,enableStartStop:!0,enableKeyboard:!0,startPanel:1,changeBy:1,hashTags:!0,infiniteSlides:!0,navigationFormatter:null,navigationSize:!1,autoPlay:!1,autoPlayLocked:!1,autoPlayDelayed:!1,pauseOnHover:!0,stopAtEnd:!1,playRtl:!1,delay:3E3,resumeDelay:15E3,animationTime:600,delayBeforeAnimate:0,clickForwardArrow:"click",clickBackArrow:"click",clickControls:"click focusin", clickSlideshow:"click",resumeOnVideoEnd:!0,resumeOnVisible:!0,addWmodeToObject:"opaque",isVideoPlaying:function(){return!1}};d.fn.anythingSlider=function(h,j){return this.each(function(){var a,b=d(this).data("AnythingSlider");(typeof h).match("object|undefined")?b?b.updateSlider():new d.anythingSlider(this,h):/\d/.test(h)&&!isNaN(h)&&b?(a="number"===typeof h?h:parseInt(d.trim(h),10),1<=a&&a<=b.pages&&b.gotoPage(a,!1,j)):/^[#|.]/.test(h)&&d(h).length&&b.gotoPage(h,!1,j)})}})(jQuery);
