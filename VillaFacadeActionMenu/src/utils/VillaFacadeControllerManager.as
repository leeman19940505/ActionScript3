package utils
{
	import flash.utils.Dictionary;
	
	import controllers.BasicController;
	import controllers.VillaFacadeExternalController;
	import controllers.VillaFacadeModelingController;
	import controllers.VillaFacadePorchController;
	import controllers.VillaFacadeStairController;
	import controllers.VillaFacadeTopController;
	
	import views.VillaFacadeActionMenu;

	public class VillaFacadeControllerManager
	{
		private var _main:VillaFacadeActionMenu = null;
		
		private var currentController:BasicController = null; //当前控制器
		private var externalController:BasicController = null; //外挂控制器
		private var modelingController:BasicController = null; //造型控制器
		private var porchController:BasicController = null; //门廊控制器
		private var stairController:BasicController = null; //台阶控制器
		private var topController:BasicController = null; //顶面控制器
		
		public function set main(main:VillaFacadeActionMenu):void
		{
			_main = main;
		}
		
		public function VillaFacadeControllerManager()
		{
			
		}
		
		/**
		 *  
		 * 
		 */		
		public function startController():void
		{
			stopController();
			switch(VillaFacadeMenuScene.sceneType)
			{
				case VillaFacadeMenuScene.VILLAFACADE_VIEW_EXTERNAL:
				{
					externalController.start();
					currentController = externalController;
				}
					break;
				case VillaFacadeMenuScene.VILLAFACADE_VIEW_MODELING:
				{
					modelingController.start();
					currentController = modelingController;
				}
					break;
				case VillaFacadeMenuScene.VILLAFACADE_VIEW_PORCH:
				{
					porchController.start();
					currentController = porchController;
				}
					break;
				case VillaFacadeMenuScene.VILLAFACADE_VIEW_STAIR:
				{
					stairController.start();
					currentController = stairController;
				}
					break;
				case VillaFacadeMenuScene.VILLAFACADE_VIEW_TOP:
				{
					topController.start();
					currentController = topController;
				}
					break;
			}
		}
		
		/**
		 *  
		 * 
		 */		
		public function stopController():void
		{
			externalController.stop();
			modelingController.stop();
			porchController.stop();
			stairController.stop();
			topController.stop();
			
			currentController = null;
		}
		
		/**
		 * 初始化 
		 * 
		 */		
		public function initControllers():void
		{
			// TODO Auto Generated method stub
			if(!externalController)
			{
				externalController = new VillaFacadeExternalController(_main);
			}
			
			if(!modelingController)
			{
				modelingController = new VillaFacadeModelingController(_main);
			}
			
			if(!porchController)
			{
				porchController = new VillaFacadePorchController(_main);
			}
			
			if(!stairController)
			{
				stairController = new VillaFacadeStairController(_main);
			}
			
			if(!topController)
			{
				topController = new VillaFacadeTopController(_main);
			}
			
			startController();
			changeCurrentTypeViewData();
		}
		
		public function changeCurrentSceneTypeController():void
		{
			stopController();
			startController();
			
			changeCurrentTypeViewData();
		}
		
		private function changeCurrentTypeViewData():void
		{
			// TODO Auto Generated method stub
			var currentViewData:Dictionary = getCurrentTypeViewData();
			VillaFacadeMenuScene.currentViewData = currentViewData;
		}
		
		private function getCurrentTypeViewData():Dictionary
		{
			// TODO Auto Generated method stub
			if(currentController)
			{
				return currentController.getCurrentViewData();
			}
			return null;
		}
		
	}
}