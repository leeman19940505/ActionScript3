package utils
{
	public class FitBorder
	{
		public function FitBorder()
		{
		}
		
		/**
		 * 右边框宽度计算 resize和setup时调用 
		 * @param stageHeight
		 * @return 
		 * 
		 */		
		public static function getLibraryWidth(stageHeight:Number):uint
		{
			return int((stageHeight - 200)/3) + 90;
		}
	}
}