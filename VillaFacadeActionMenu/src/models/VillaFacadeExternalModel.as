package models
{
	import datas.VillaFacadeExternalData;
	

	/**
	 *  
	 * @author leeman
	 * 
	 */	
	public class VillaFacadeExternalModel
	{
		private var _externalData:VillaFacadeExternalData = null;
		public function VillaFacadeExternalModel()
		{
		}
		
		public function initializeData():void
		{
			_externalData = new VillaFacadeExternalData();
		}
		
		public function get externalData():VillaFacadeExternalData
		{
			return _externalData;
		}
		
		/**
		 * 更新外挂 离地高 
		 * @param offground
		 * 
		 */				
		public function writeExternalOffground(offground:int):void
		{
			_externalData.offGround = offground;
		}
		
		/**
		 * 读取外挂 离地高
		 * @return 
		 * 
		 */		
		public function readExternalOffground():int
		{
			return _externalData.offGround;
		}
		
		/**
		 * 更新外挂 部件数 
		 * @param partnum
		 * 
		 */		
		public function writeExternalPartnum(partnum:int):void
		{
			_externalData.partNum = partnum;
		}
		
		/**
		 * 读取外挂 部件数 
		 * @return 
		 * 
		 */		
		public function readExternalPartnum():int
		{
			return _externalData.partNum;
		}
		
		/**
		 *  
		 * @param partlength
		 * 
		 */		
		public function writeExternalPartLength(partlength:int):void
		{
			_externalData.partLength = partlength;
		}
		
		/**
		 *  
		 * @return 
		 * 
		 */		
		public function readExternalPartLength():int
		{
			return _externalData.partLength;
		}
		
		/**
		 *  
		 * @param partwidth
		 * 
		 */		
		public function writeExternalPartWidth(partwidth:int):void
		{
			_externalData.partWidth = partwidth;
		}
		
		/**
		 *  
		 * @return 
		 * 
		 */		
		public function readExternalPartWidth():int
		{
			return _externalData.partWidth;
		}
		
		/**
		 * 
		 * @param partheight
		 * 
		 */		
		public function writeExternalPartHeight(partheight:int):void
		{
			_externalData.partHeight = partheight;
		}
		
		/**
		 *  
		 * @return 
		 * 
		 */		
		public function readExternalPartHeight():int
		{
			return _externalData.partHeight;
		}
	}
}