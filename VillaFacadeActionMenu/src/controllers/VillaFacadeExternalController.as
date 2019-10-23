package controllers
{
	import flash.utils.Dictionary;
	
	import models.VillaFacadeExternalModel;
	
	import utils.DatasEvent;
	import utils.TestUtils;
	
	import views.VillaFacadeActionMenu;

	/**
	 * 外挂Controller
	 * @author leeman
	 * 
	 */	
	public class VillaFacadeExternalController extends BasicController
	{
		private var _model:VillaFacadeExternalModel = null; //数据model
		public function get model():VillaFacadeExternalModel
		{
			return _model;
		}
		
		/**
		 *  
		 * @param main
		 * 
		 */		
		public function VillaFacadeExternalController(main:VillaFacadeActionMenu)
		{
			initExternalData();
			
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
			super.writePartHeight = writePartHeightHandler;
			super.writePartLength = writePartLengthHandler;
			super.writePartWidth = writePartWidthHandler;
		}
		
		/**
		 * 创建数据 
		 * 
		 */		
		private function initExternalData():void
		{
			// TODO Auto Generated method stub
			if(!_model)
			{
				_model = new VillaFacadeExternalModel();
				_model.initializeData();
			}
		}
		
		/**
		 * 写入外挂 离地高 
		 * @param event
		 * 
		 */		
		public function writeOffgroundHandler(event:DatasEvent):void
		{
			// TODO Auto-generated method stub
			if(isRunning)
			{
				var offground:int = int(event.data);
				trace("External offground " + offground);
				_model.writeExternalOffground(offground);
			}
		}
		
		/**
		 * 读取外挂离地高 
		 * @return 
		 * 
		 */		
		public function readOffgroundHandler():int
		{
			if(isRunning)
			{
				return _model.readExternalOffground();
			}
			return NaN;
		}
		
		/**
		 * 写入外挂 部件数 
		 * @param event
		 * 
		 */				
		public function writePartnumHandler(event:DatasEvent):void
		{
			if(isRunning)
			{
				var partnum:int = int(event.data);
				trace("External partnum " + partnum);
				_model.writeExternalPartnum(partnum);
			}
		}
		
		/**
		 * 读取外挂 部件数
		 * @return 
		 * 
		 */		
		public function readPartnumHandler():int
		{
			if(isRunning)	
			{
				return _model.readExternalPartnum();
			}
			return NaN;
		}
		
		/**
		 * 写入外挂 部件长 
		 * @param event
		 * 
		 */		
		public function writePartLengthHandler(event:DatasEvent):void		
		{
			if(isRunning)
			{
				var partlength:int = int(event.data);
				trace("External partlength " + partlength);
				_model.writeExternalPartLength(partlength);
			}
		}
		
		/**
		 * 读取外挂 部件长 
		 * @return 
		 * 
		 */		
		public function readPartLengthHandler():int
		{
			if(isRunning)
			{
				return _model.readExternalPartLength();
			}
			return NaN;
		}
		
		/**
		 *  
		 * @param event
		 * 
		 */		
		public function writePartWidthHandler(event:DatasEvent):void
		{
			if(isRunning)
			{
				var partwidth:int = int(event.data);
				trace("External partwidth " + partwidth);
				_model.writeExternalPartWidth(partwidth);
			}
		}
		
		/**
		 *  
		 * @return 
		 * 
		 */				
		public function readPartWidthHandler():int
		{
			if(isRunning)
			{
				return _model.readExternalPartWidth();
			}
			return NaN;
		}
		
		/**
		 *  
		 * @param event
		 * 
		 */		
		public function writePartHeightHandler(event:DatasEvent):void
		{
			if(isRunning)
			{
				var partheight:int = int(event.data);
				trace("External partheight " + partheight);
				_model.writeExternalPartHeight(partheight);
			}
		}
		
		public function readPartHeightHandler():int
		{
			if(isRunning)
			{
				return _model.readExternalPartHeight();
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
			trace("update VillaFacadeExternal ");
			var dictionary:Dictionary = new Dictionary();
			dictionary.offground = readOffgroundHandler(); 
			dictionary.partnum = readPartnumHandler();
			
			dictionary.partheight = readPartHeightHandler();
			dictionary.partwidth = readPartWidthHandler();
			dictionary.partlength = readPartLengthHandler();
			
			TestUtils.showDictionary(dictionary);
			
			return dictionary;
		}
	}
}