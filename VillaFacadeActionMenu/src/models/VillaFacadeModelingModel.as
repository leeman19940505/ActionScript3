package models
{
	import datas.VillaFacadeModelingData;

	/**
	 * 别墅造型model 
	 * @author leeman
	 * 
	 */	
	public class VillaFacadeModelingModel
	{
		private var _modelingData:VillaFacadeModelingData = null;
		
		public function VillaFacadeModelingModel()
		{
		}
		
		public function initializeData():void
		{
			_modelingData = new VillaFacadeModelingData();
		}
		
		public function get modelingData():VillaFacadeModelingData
		{
			return _modelingData;
		}
		
		/**
		 * 更新外挂 离地高 
		 * @param offground
		 * 
		 */				
		public function writeModelingOffground(offground:int):void
		{
			_modelingData.offGround = offground;
		}
		
		/**
		 * 读取外挂 离地高
		 * @return 
		 * 
		 */		
		public function readModelingOffground():int
		{
			return _modelingData.offGround;
		}
		
		/**
		 * 更新外挂 部件数 
		 * @param partnum
		 * 
		 */		
		public function writeModelingPartnum(partnum:int):void
		{
			_modelingData.partNum = partnum;
		}
		
		/**
		 * 读取外挂 
		 * @return 
		 * 
		 */		
		public function readModelingPartnum():int
		{
			return _modelingData.partNum;
		}
	}
}