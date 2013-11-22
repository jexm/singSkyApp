package comm
{
	public class Config
	{
		public function Config()
		{
		}
		public static var ViewNum:int=0;
		
		public static var CatLogXmlArr:Array = [];
		public static var CacheImgArr:Array = [];
		public static var imgItemArr:Array = [];  //图片list的url arr
		public static var imgObjArr:Array = [];
		
		
		public static var appStageWidth:int=640;
		public static var appStageHeight:int=960;

		
		public static var SERVERURL:String="http://jexm.user.d-jet.com/hiGirls/xml/data.xml";
		public static var CHECK_UPDATA_URL:String="http://jexm.user.d-jet.com/hiGirls/ver.txt";
		public static var AboutImageURL:String="http://jexm.user.d-jet.com/hiGirls/about.jpg";
		
		public static var SHARE_MSG:String="向大家推荐一个非常不错的应用程序：http://112.124.39.181/downApkHelloGirl.php";
		
		public static var VER_INIT:Number=1.41;
		
		public static var CURRENT_ID:Number=0;
		
		
		public static var ADmob_ID:String="a15254055734b3d";
		public static var mogoID:String="a772ba0d93e04b51bb299c80f9783bdd";  //芒果广告
		
		public static var showADtimer:Number=60000; 
		public static var showADNum:int=1; 
		public static var showADMsg:String="请点击广告来关闭广告，惊喜需要您的支持，谢谢！"; 
	}
}