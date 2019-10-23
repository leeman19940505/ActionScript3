package utils
{
	import flash.utils.Dictionary;

	public class TestUtils
	{
		public function TestUtils()
		{
		}
		
		public static function showDictionary(dictionary:Dictionary):void
		{
			trace("currentDictionary");
			for(var key:* in dictionary)
			{
				trace(key + ": " + dictionary[key]);
			}
		}
	}
}