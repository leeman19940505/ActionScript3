package datas
{
	public class NavigationData
	{
		public function NavigationData()
		{
		}
		
		/**
		 * 文字 
		 */		
		public var label:String = "";
		
		/**
		 * 类型 villaFacadeMenuScene.sceneType 
		 */		
		public var type:String = "";
		
		public static function buildNavigationData(label:String, type:String):NavigationData
		{
			var data:NavigationData = new NavigationData();
			data.label = label;
			data.type = type;
			
			return data;
		}
	}
}