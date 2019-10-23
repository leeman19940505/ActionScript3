package controllers
{
	import flash.utils.Dictionary;
	
	import models.VillaFacadeModelingModel;
	
	import utils.DatasEvent;
	import utils.TestUtils;
	
	import views.VillaFacadeActionMenu;

	/**
	 *  
	 * @author leeman
	 * 
	 */	
	public class VillaFacadeModelingController extends BasicController
	{
		private var _model:VillaFacadeModelingModel = null;
		public function get model():VillaFacadeModelingModel
		{
			return _model;
		}
		
		/**
		 *  
		 * @param main
		 * 
		 */		
		public function VillaFacadeModelingController(main:VillaFacadeActionMenu)
		{
			initModelingData();
			
			setFunctions();			
			super(main);
//			super.extendsInstance = this;
			super.addListeners();
		}
		
		private function setFunctions():void
		{
			// TODO Auto Generated method stub
			super.currentViewData = getCurrentViewData;
			super.writeOffGround = writeOffgroundHandler;
			super.writePartNum = writePartnumHandler;
		}
		
		private function initModelingData():void
		{
			if(!_model)
			{
				_model = new VillaFacadeModelingModel();
				_model.initializeData();
			}
		}
		
		public function writeOffgroundHandler(event:DatasEvent):void
		{
			// TODO Auto-generated method stub
			if(isRunning)
			{
				var offground:int = int(event.data);
				trace("Modeling offground " + offground);
				_model.writeModelingOffground(offground);
			}
		}
		
		public function readOffgroundHandler():int
		{
			if(isRunning)
			{
				return _model.readModelingOffground();
			}
			return NaN;
		}
		
		public function writePartnumHandler(event:DatasEvent):void
		{
			if(isRunning)
			{
				var partnum:int = int(event.data);
				trace("Modeling partnum " + partnum);
				_model.writeModelingPartnum(partnum);
			}
		}
		
		public function readPartnumHandler():int
		{
			if(isRunning)	
			{
				return _model.readModelingPartnum();	
			}
			return NaN;
		}
		
		/**
		 * 获取当前界面数据 
		 * @return 
		 * 
		 */		
		public override function getCurrentViewData():Dictionary
		{
			trace("update VillaFacadeModeling ");
			var dictionary:Dictionary = new Dictionary();
			dictionary.offground = readOffgroundHandler(); 
			dictionary.partnum = readPartnumHandler();
			
			TestUtils.showDictionary(dictionary);
			
			return dictionary;
		}
		
	}
}