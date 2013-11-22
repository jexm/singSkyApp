package comm {
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	public class jxmlLoad extends Sprite {
		public var _items:XMLList;
		private var externalXML:XML;
		private var loader:URLLoader;
		private var loadRequest:URLRequest;
		
		public function jxmlLoad() {
			loader = new URLLoader();
		}
		
		public function load (xmlReq:URLRequest):void{
			loader.load(xmlReq);
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
		}
		
		private function onComplete(event:Event):void {
			externalXML=new XML(loader.data);			
			_items = externalXML.*;
			//trace(_items)
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			trace("ioErrorHandler: " + event);
		}
	}
}