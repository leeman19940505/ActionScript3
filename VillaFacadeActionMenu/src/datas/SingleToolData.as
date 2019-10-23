package datas
{
	public class SingleToolData
	{
		public function SingleToolData()
		{
		}
		
		/**
		 * 单个工具类型 1:输入框 2:svg按钮 3:文本按钮
		 */		
		public var toolType:int; 
		
		/**
		 * svg事件
		 */		
		public var svgEvent:int = 2;
		
		/**
		 * 文本 
		 */		
		public var labelText:int = 3;
		
		/**
		 * 输入框文本
		 */		
		public var labelInput:int = 1;
	}
}