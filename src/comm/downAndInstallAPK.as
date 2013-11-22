package comm
{
	
	import com.sixuu.SFile;
	import com.sixuu.events.SErrorEvent;
	import com.sixuu.events.SEvent;
	import com.sixuu.events.SProgressEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.FileListEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import events.jexmEvent;
	
	import org.zengrong.ane.ANEToolkit;
	
	public class downAndInstallAPK extends Sprite
	{
		private var _file_downing_url:String;
		private var _file_save_name:String;
		
		public function init(_url:String,_name:String):void
		{
			var f:SFile=new SFile(SFile.applicationStorageDirectory.resolvePath(_name).nativePath)
			f.addEventListener(SErrorEvent.ERROR,onError)
			f.addEventListener(SProgressEvent.FILE_DOWN_PROGRESS,onProgress)
			f.addEventListener(SEvent.FILE_DOWN_COMPLETE,onComplete)
			f.downloadFileByStream(_url,10000,true)
			
			function onError(e:SErrorEvent){
				trace(e.errorType)
				dispatchEvent(new jexmEvent("error",{msg:e.errorType}));
			}
			function onProgress(e:SProgressEvent){
				trace(e.bytesLoaded,"----",e.bytesTotal);
				var _loaded:Number=Math.floor(e.bytesLoaded/e.bytesTotal*100);
				dispatchEvent(new jexmEvent("downing",{msg:_loaded}));
			}
			function onComplete(e:SEvent){
				trace("fileDownLoaded");
				dispatchEvent(new jexmEvent("complete",{msg:""}));  
				var file:File = File.applicationStorageDirectory; 
				file = file.resolvePath(_name); 
				ANEToolkit.intent.installAPK(file.nativePath);
				
			}
		}
		private function down(){
			var f:SFile=new SFile(SFile.applicationStorageDirectory.resolvePath(_file_save_name).nativePath)
			f.addEventListener(SErrorEvent.ERROR,onError)
			f.addEventListener(SProgressEvent.FILE_DOWN_PROGRESS,onProgress)
			f.addEventListener(SEvent.FILE_DOWN_COMPLETE,onComplete)
			f.downloadFileByStream(_file_downing_url,10000,true)
			
			function onError(e:SErrorEvent){
				trace(e.errorType)
			}
			function onProgress(e:SProgressEvent){
				trace(e.bytesLoaded,"----",e.bytesTotal)
			}
			function onComplete(e:SEvent){
				trace("fileDownLoaded");
				install();
			}
		}
		
		
		private function install(){
			var file:File = File.applicationStorageDirectory; 
			file = file.resolvePath(_file_save_name); 
			ANEToolkit.intent.installAPK(file.nativePath);
			
			trace("installing...");
		}
		
		
	}
}

