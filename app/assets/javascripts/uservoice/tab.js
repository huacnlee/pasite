if(!UserVoice){var UserVoice={};}
if(!UserVoice.Util){UserVoice.Util={sslAssetHost:"https://uservoice.com",assetHost:"http://cdn.uservoice.com",getAssetHost:function(){return("https:"==document.location.protocol)?this.sslAssetHost:this.assetHost;},render:function(template,params){return template.replace(/\#{([^{}]*)}/g,function(a,b){var r=params[b];return typeof r==='string'||typeof r==='number'?r:a;})},toQueryString:function(params){var pairs=[];for(key in params){if(params[key]!=null&&params[key]!=''){pairs.push([key,params[key]].join('='));}}
return pairs.join('&');}}}
UserVoice.Page={getDimensions:function(){var de=document.documentElement;var width=window.innerWidth||self.innerWidth||(de&&de.clientWidth)||document.body.clientWidth;var height=window.innerHeight||self.innerHeight||(de&&de.clientHeight)||document.body.clientHeight;return{width:width,height:height};}}
UserVoice.Dialog={preload:function(id_or_html){if(!this.preloaded){var element=document.getElementById(id_or_html);var html=(element==null)?id_or_html:element.innerHTML;this.setContent(html);this.preloaded=true;}},show:function(id_or_html){if(!this.preloaded){this.preload(id_or_html);}
this.Overlay.show();this.setPosition();UserVoice.Element.addClassName(this.htmlElement(),'dialog-open');this.element().style.display='block';this.preloaded=false;},close:function(){var change=UserVoice.needsConfirm;if(change){var answer=confirm(change);if(!answer){return}}
this.element().style.display='none';UserVoice.Element.removeClassName(this.htmlElement(),'dialog-open');this.Overlay.hide();UserVoice.onClose();},id:'uservoice-dialog',css_template:"\
	#uservoice-dialog {\
	  z-index: 100003;\
	  display: block;\
	  text-align: left;\
	  margin: -2em auto 0 auto;\
	  position: absolute; \
	}\
	\
	#uservoice-overlay {\
	  position: absolute;\
	  z-index:100002;\
	  width: 100%;\
	  height: 100%;\
	  left: 0;\
	  top: 0;\
	  background-color: #000;\
	  opacity: .7;\
	 filter: alpha(opacity=70);\
	}\
	\
	#uservoice-dialog[id],\
	#uservoice-overlay[id] {\
	 position:fixed;\
	}\
	\
	#uservoice-overlay p {\
	  padding: 5px;\
	  color: #ddd;\
	  font: bold 14px arial, sans-serif;\
	  margin: 0;\
	  letter-spacing: -1px;\
	}\
	\
	#uservoice-dialog #uservoice-dialog-close {\
	  position: absolute;\
	  height: 48px;\
	  width: 48px;\
	  top: -11px;\
	  right: -12px;\
	  color: #06c;\
	  cursor: pointer;\
	  background-position: 0 0;\
	  background-repeat: no-repeat;\
	  background-color: transparent;\
	}\
	\
	* html.dialog-open body {\
	  height: 100%;\
	}\
	\
	* html.dialog-open,\
	* html.dialog-open body {\
	  overflow: hidden;\
	}\
	\
	html.dialog-open object,\
	html.dialog-open embed,\
	* html.dialog-open select {\
	  visibility: hidden;\
	}\
	\
	* html #uservoice-overlay {\
	  width: 110%;\
	}\
	\
	* html #uservoice-dialog #uservoice-dialog-close {\
	  background: none;\
	  filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='https://uservoice.com/images/icons/close.png');\
	}\
   \
   a#uservoice-dialog-close { background-image: url(#{background_image_url}); }",element:function(){if(!document.getElementById(this.id)){var dummy=document.createElement('div');dummy.innerHTML='<div id="'+this.id+'" class="uservoice-component" style="display:none;">'+'<a href="#" onclick="UserVoice.Dialog.close(); return false;" id="'+this.id+'-close"></a>'+'<div id="'+this.id+'-content"></div></div>';document.body.appendChild(dummy.firstChild);}
return document.getElementById(this.id);},setContent:function(html){this.element()
if(typeof(Prototype)!='undefined'){document.getElementById(this.id+"-content").innerHTML=html.stripScripts();setTimeout(function(){html.evalScripts()},100);}else{document.getElementById(this.id+"-content").innerHTML=html;}},setPosition:function(){var dialogDimensions=UserVoice.Element.getDimensions(this.element());var pageDimensions=UserVoice.Page.getDimensions();var els=this.element().style;els.width='auto';els.height='auto';els.left=((pageDimensions.width-dialogDimensions.width)/2)+"px";els.top=((pageDimensions.height-dialogDimensions.height)/2)+"px";},htmlElement:function(){return document.getElementsByTagName('html')[0];}}
UserVoice.Dialog.Overlay={show:function(){this.element().style.display='block';},hide:function(){this.element().style.display='none';},id:'uservoice-overlay',element:function(){if(!document.getElementById(this.id)){var dummy=document.createElement('div');dummy.innerHTML='<div id="'+this.id+'" class="uservoice-component" onclick="UserVoice.Dialog.close(); return false;" style="display:none;"></div>';document.body.appendChild(dummy.firstChild);}
return document.getElementById(this.id);}}
UserVoice.Element={getDimensions:function(element){var display=element.display;if(display!='none'&&display!=null){return{width:element.offsetWidth,height:element.offsetHeight};}
var els=element.style;var originalVisibility=els.visibility;var originalPosition=els.position;var originalDisplay=els.display;els.visibility='hidden';els.position='absolute';els.display='block';var originalWidth=element.clientWidth;var originalHeight=element.clientHeight;els.display=originalDisplay;els.position=originalPosition;els.visibility=originalVisibility;return{width:originalWidth,height:originalHeight};},hasClassName:function(element,className){var elementClassName=element.className;return(elementClassName.length>0&&(elementClassName==className||new RegExp("(^|\\s)"+className+"(\\s|$)").test(elementClassName)));},addClassName:function(element,className){if(!this.hasClassName(element,className)){element.className+=(element.className?' ':'')+className;}
return element;},removeClassName:function(element,className){element.className=element.className.replace(new RegExp("(^|\\s+)"+className+"(\\s+|$)"),' ');return element;}}
UserVoice.needsConfirm=false;UserVoice.onClose=function(){};document.write('<style type="text/css">'+UserVoice.Util.render(UserVoice.Dialog.css_template,{background_image_url:UserVoice.Util.getAssetHost()+'/images/icons/close.png'})+'</style>')
if(!UserVoice){var UserVoice={}}
if(!UserVoice.Util){UserVoice.Util={sslAssetHost:"https://uservoice.com",assetHost:"http://cdn.uservoice.com",getAssetHost:function(){return("https:"==document.location.protocol)?this.sslAssetHost:this.assetHost;},render:function(template,params){return template.replace(/\#{([^{}]*)}/g,function(a,b){var r=params[b];return typeof r==='string'||typeof r==='number'?r:a;})},toQueryString:function(params){var pairs=[];for(key in params){if(params[key]!=null&&params[key]!=''){pairs.push([key,params[key]].join('='));}}
return pairs.join('&');}}}
UserVoice.Popin={content_template:'<iframe src="#{url}/widgets/#{dialog}.html?#{query}" frameborder="0" scrolling="no" allowtransparency="true" width="#{width}" height="#{height}" style="height: #{height}; width: #{width};"></iframe>',setup:function(options){this.setupOptions(options||{});},preload:function(){UserVoice.Dialog.preload(UserVoice.Util.render(this.content_template,this.options));},show:function(){UserVoice.Dialog.show(UserVoice.Util.render(this.content_template,this.options));},setupOptions:function(options){this.options={dialog:'popin',width:'350px',height:'430px',lang:'en',params:{}};for(attr in options){this.options[attr]=options[attr]};this.options.url=this.url();this.options.params.lang=this.options.lang;this.options.params.referer=this.getReferer();this.options.query=UserVoice.Util.toQueryString(this.options.params);},getReferer:function(){var referer=window.location.href;if(referer.indexOf('?')!=-1){referer=referer.substring(0,referer.indexOf('?'));}
return referer;},url:function(){if("https:"==document.location.protocol&&this.options.key!=null){var url='https://'+this.options.key+'.uservoice.com/pages/'+this.options.forum;}else{var url='http://'+this.options.host+'/pages/'+this.options.forum;}
return url;}}
UserVoice.Tab={id:"uservoice-feedback-tab",css_template:"\
   body a#uservoice-feedback-tab,\
   body a#uservoice-feedback-tab:link {\
	  background-position: 2px 50% !important;\
	  position: fixed !important;\
	  top: 45% !important;\
	  display: block !important;\
	  width: 25px !important;\
	  height: 98px !important;\
	  margin: -45px 0 0 0 !important;\
	  padding: 0 !important;\
	  z-index: 100001 !important;\
	  background-position: 2px 50% !important;\
	  background-repeat: none !important;\
	  text-indent: -9000px;\
	}\
	\
	body a#uservoice-feedback-tab:hover {\
	  cursor: pointer;\
	}\
	\
	* html a#uservoice-feedback-tab,\
	* html a#uservoice-feedback-tab:link {\
	  position: absolute !important;\
	  background-image: none !important;\
	}\
   \
   a##{id} { \
	 #{alignment}: 0; \
	 background-repeat: no-repeat; \
	 background-color: #{background_color}; \
	 background-image: url(#{text_url}); \
	 border: outset 1px #{background_color}; \
	 border-#{alignment}: none; \
	 -moz-border-radius: 1em; \
	 -moz-border-radius-top#{alignment}: 0; \
	 -moz-border-radius-bottom#{alignment}: 0; \
	 -webkit-border-radius: 1em; \
	 -webkit-border-top-#{alignment}-radius: 0; \
	 -webkit-border-bottom-#{alignment}-radius: 0;\
   }\
	\
	a##{id}:hover { \
	  background-color: #{hover_color}; \
	  border: outset 1px #{hover_color}; \
	  border-#{alignment}: none; \
	}\
	\
	* html a##{id} { filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='#{text_url}'); }",show:function(options){this.setupOptions(options||{});UserVoice.Popin.setup(options);var html='<a id="'+this.id+'"';if(!this.options.no_dialog){html+='" onclick="UserVoice.Popin.show(); return false;"';if(this.options.preload){html+='" onmouseover="UserVoice.Popin.preload();"';}}
html+=' href="'+UserVoice.Popin.url()+'">'+(this.options.tab_string[this.options.lang]?this.options.tab_string[this.options.lang]:'Feedback')+'</a>';document.write(html);if(!this.options.no_styles){document.write('<style type="text/css">'+UserVoice.Util.render(this.css_template,this.options)+'</style>')}},setupOptions:function(options){this.options={alignment:'left',background_color:'#f00',text_color:'white',hover_color:'#06C',lang:'en',no_styles:false,no_dialog:false,preload:true}
for(attr in options){this.options[attr]=options[attr];}
this.options.tab_string={cn:"反馈",de:"Feedback",es:"Sugerencias",fr:"Commentaires",ja:"フィードバック",nl:"Feedback",pt_BR:"Comentário"};this.options.text_url='/images/feedback_tab_'+this.options.text_color+'.png';this.options.id=this.id;}}
