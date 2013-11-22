package comm
{
	
	import com.ssd.ane.AndroidExtensions;
	import flash.events.StatusEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import air.net.URLMonitor;

	public class CheckWeb
	{
		public static function initialize():void
		{
			var monitor:URLMonitor;
			var url:URLRequest = new URLRequest('http://www.singsky.cn');
			url.method  = URLRequestMethod.HEAD;
			monitor = new URLMonitor(url);
			monitor.addEventListener(StatusEvent.STATUS ,  onCon)
			monitor.pollInterval=3000;
			monitor.start();
			trace("monitor.start to contact......");
			
			function onCon(event:flash.events.StatusEvent):void{
				var _code:String=event.code;
				if(_code!="Service.available"){
					trace("网络不可用");
					AndroidExtensions.toast("请保持网络畅通,否则部分功能将用不了！", true);
				}else{
					trace("good,网络可用!");
					AndroidExtensions.toast("PHONE_BRAND："+TELSTATE.PHONE_BRAND, false);
					AndroidExtensions.toast("PHONE_BOARD："+TELSTATE.PHONE_BOARD, false);
					AndroidExtensions.toast("PHONE_ANDROID_VER："+TELSTATE.PHONE_ANDROID_VER, false);
					AndroidExtensions.toast("PHONE_NUMBER："+TELSTATE.PHONE_NUMBER, false);
					AndroidExtensions.toast("PHONE_SIM_IMEI："+TELSTATE.PHONE_SIM_IMEI, false);
					
				}
				
				
			}
		}
		
		
		
		
		
	}
}

