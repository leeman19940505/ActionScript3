package
{
	import mx.events.FlexEvent;
	
	import utils.DatasEvent;
	import utils.VillaFacadeMenuScene;
	
	import views.VillaFacadeActionMenu;

	/**
	 *  
	 * @author leeman
	 * 
	 */	
	public class VillaFacadeActionMenuManager
	{
		public var library:VillaFacadeActionMenu = null;
		public var livelyMain:VillaFacadeActionMenuTest = null;
		public var libraryType:String = VillaFacadeMenuScene.VILLAFACADE_VIEW_EXTERNAL;
		private var _libraryexisted:Boolean = false;
		
		public function VillaFacadeActionMenuManager()
		{
			addEventListeners();
		}
		
		private function addEventListeners():void
		{
			// TODO Auto Generated method stub
			
		}
		
		/**
		 * type为当前的默认type 随Navigation切换而改变 
		 * @param type
		 * @param isNoremaDownloadMode
		 * 
		 */		
		public function buildVillaFacadeActionMenu(type:String = VillaFacadeMenuScene.VILLAFACADE_VIEW_EXTERNAL, isNoremaDownloadMode:Boolean = true):void
		{
			if(_libraryexisted)
			{
				villaFacadeActionMenuCloseHandler(null);
			}
			
			libraryType = type;
			if(!library)
			{
				library = new VillaFacadeActionMenu();
				_libraryexisted = true;
				library.right = 0;
				library.top = 0;
				library.height = livelyMain.height;
				library.visible = false;
				library.addEventListener(FlexEvent.CREATION_COMPLETE, onCompleteHandler);
				livelyMain.addElement(library);
			}
		}
		
		protected function onCompleteHandler(event:FlexEvent):void
		{
			// TODO Auto-generated method stub
			library.removeEventListener(FlexEvent.CREATION_COMPLETE, onCompleteHandler);
			library.setup(libraryType, true);
			
			//library addEventListener
			//...
			
			library.visible = true;
		}
		
		private function villaFacadeActionMenuCloseHandler(event:DatasEvent):void
		{
			// TODO Auto Generated method stub
			if(!_libraryexisted)
			{
				return;
			}
		}
	}
}