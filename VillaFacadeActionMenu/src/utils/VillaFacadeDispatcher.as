package utils
{
	import flash.events.EventDispatcher;
	
	public class VillaFacadeDispatcher extends EventDispatcher
	{
		private static var _Instance:VillaFacadeDispatcher;
		public function VillaFacadeDispatcher()
		{
		}
		
		public static function get Instance():VillaFacadeDispatcher
		{
			return _Instance||=new VillaFacadeDispatcher();
		}
	}
}