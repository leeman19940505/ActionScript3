package controllers
{
	import flash.utils.Dictionary;
	
	import consts.VillaFacadeEventsType;
	
	import utils.VillaFacadeDispatcher;
	
	import views.VillaFacadeActionMenu;

	public class BasicController
	{
		private var _main:VillaFacadeActionMenu = null;
		private var _isRunning:Boolean = false; //当前控制器是否运行
//		private var _extendsInstance:* = null; //当前子类
		
		public var writeOffGround:Function = null; //修改离地高
		public var writePartNum:Function = null; //修改部件数
		public var writePartLength:Function = null; //修改部件长
		public var writePartWidth:Function = null; //修改部件宽
		public var writePartHeight:Function = null;	 //修改部件高
		
		public var currentViewData:Function = null;
		
		public function get isRunning():Boolean
		{
			return _isRunning;
		}
		
//		public function set extendsInstance(instance:*):void
//		{
//			_extendsInstance = instance;
//		}
		
		public function get main():VillaFacadeActionMenu
		{
			return _main;
		}
		
		public function BasicController(main:VillaFacadeActionMenu)
		{
			_main = main;
		}
		
		public function addListeners():void
		{
			// TODO Auto Generated method stub
			if(writeOffGround != null)
			{
				VillaFacadeDispatcher.Instance.addEventListener(VillaFacadeEventsType.UPDATE_OFFGROUND, writeOffGround);
			}
			
			if(writePartNum != null)
			{
				VillaFacadeDispatcher.Instance.addEventListener(VillaFacadeEventsType.UPDATE_PARTNUM, writePartNum);
			}
			
			if(writePartLength != null)
			{
				VillaFacadeDispatcher.Instance.addEventListener(VillaFacadeEventsType.UPDATE_PARTLENGTH, writePartLength);
			}
			
			if(writePartWidth != null)
			{
				VillaFacadeDispatcher.Instance.addEventListener(VillaFacadeEventsType.UPDATE_PARTWIDTH, writePartWidth);
			}
			
			if(writePartHeight != null)
			{
				VillaFacadeDispatcher.Instance.addEventListener(VillaFacadeEventsType.UPDATE_PARTHEIGHT, writePartHeight);
			}
			
		}
		
		public function removeListener():void
		{
			if(writeOffGround != null)
			{
				VillaFacadeDispatcher.Instance.removeEventListener(VillaFacadeEventsType.UPDATE_OFFGROUND, writeOffGround);
			}
			
			if(writePartNum != null)
			{
				VillaFacadeDispatcher.Instance.removeEventListener(VillaFacadeEventsType.UPDATE_PARTNUM, writePartNum);
			}
			
			if(writePartLength != null)
			{
				VillaFacadeDispatcher.Instance.removeEventListener(VillaFacadeEventsType.UPDATE_PARTLENGTH, writePartLength);
			}
			
			if(writePartWidth != null)
			{
				VillaFacadeDispatcher.Instance.removeEventListener(VillaFacadeEventsType.UPDATE_PARTWIDTH, writePartWidth);
			}
			
			if(writePartHeight != null)
			{
				VillaFacadeDispatcher.Instance.removeEventListener(VillaFacadeEventsType.UPDATE_PARTHEIGHT, writePartHeight);
			}
		}
		
		public function getCurrentViewData():Dictionary
		{
			return currentViewData == null ? null : currentViewData();
		}
		
		public function start():void
		{
			_isRunning = true;
		}
		
		public function stop():void
		{
			_isRunning = false;
		}
	}
}