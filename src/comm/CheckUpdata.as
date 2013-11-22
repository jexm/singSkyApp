package comm
{
	
	import com.ssd.ane.AndroidExtensions;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	import events.jexmEvent;
	
	import pl.mateuszmackowiak.nativeANE.dialogs.NativeAlertDialog;
	import pl.mateuszmackowiak.nativeANE.events.NativeDialogEvent;
	
	public class CheckUpdata
	{
		public static function initialize(_isFromMenu:Boolean=false):void
		{
						
			var request:URLRequest = new URLRequest(Config.CHECK_UPDATA_URL+"?="+Math.random());
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			loader.addEventListener(Event.COMPLETE, loader_complete);
			loader.load(request);
			
			function loader_complete (e:Event):void {
				var variables:URLVariables = new URLVariables(loader.data);
				
				var _the_ver:Number=Number(variables.ver);
				if(_the_ver>Config.VER_INIT){
					trace("有跟新")
					var a:NativeAlertDialog = new NativeAlertDialog();
					a.closeHandler = function(e:NativeDialogEvent):void{
						if(e.index=="0"){
							//dispatchEvent(new jexmEvent("complete",{msg:""}));
							//navigateToURL(new URLRequest(variables.url));
							var _downAndInstallAPK:downAndInstallAPK=new downAndInstallAPK();
							_downAndInstallAPK.init(variables.url,"hiGirls.apk");
							_downAndInstallAPK.addEventListener("downing",onProgress);
							_downAndInstallAPK.addEventListener("complete",oncomplete);
							_downAndInstallAPK.addEventListener("error",onerror);
							function onProgress(e:jexmEvent){
								trace("downing---"+e.param.msg);
								//AndroidExtensions.toast("正在后台下载..."+e.param.msg+"%", "Short");
							}
							function oncomplete(e:jexmEvent){
								trace("oncomplete---");
								AndroidExtensions.toast("文件下载完毕，即将安装！", "Short");
							}
							function onerror(e:jexmEvent){
								trace("error---");
								AndroidExtensions.toast("更新文件出错，请稍候再试！", "Short");
							}
							AndroidExtensions.toast("正在后台下载，请稍候！", "Short");
						}
					};
					a.title = "更新提示";
					a.message = "发现新版本，版本号为："+variables.ver+variables.msg;
					a.closeLabel = "更新";
					a.otherLabels = "不更新";
					a.show();
					
				}else{
					trace("木有更新");
					if(_isFromMenu){
						var a:NativeAlertDialog = new NativeAlertDialog();
						a.closeHandler = function(e:NativeDialogEvent):void{
							
						};
						a.title = "更新提示";
						a.message = "版本号:"+variables.ver+",这是最新版本了，惊喜还在不断进行中！";
						/*a.closeLabel = "关闭";
						a.otherLabels = "提醒我们";*/
						a.show();
					}
				}
				
				
				
			}
			
		}
		
		
	}
}

