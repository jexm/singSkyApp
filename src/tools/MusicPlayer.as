package tools
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class MusicPlayer extends Sprite
	{
		private var sound:Sound;
		
		public function MusicPlayer(_url:String)
		{
			super();
			
			
			
			sound=new Sound();
			sound.load(new URLRequest(_url));
			sound.addEventListener(Event.COMPLETE,onCom);
			
			
			
		}
		private function onCom(e:Event){
			sound.play();
		}
	}
}