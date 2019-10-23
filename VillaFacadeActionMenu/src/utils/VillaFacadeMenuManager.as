package utils
{
	import flash.events.EventDispatcher;
	
	import spark.components.HGroup;
	import spark.components.VGroup;
	
	import extension.wl.views.LineHorizontal;
	import extension.wl.views.LineVertical;
	
	import views.VillaFacadeActionBodyView;
	import views.VillaFacadeActionFootView;
	import views.VillaFacadeActionHeadView;
	import views.VillaFacadeActionMenu;
	import views.VillaFacadeActionNavigationView;

	/**
	 * 别墅外挂model 
	 * @author leeman
	 * 
	 */	
	public class VillaFacadeMenuManager extends EventDispatcher
	{
		public var main:VillaFacadeActionMenu = null;
		private var headHeight:Number = 90;
		private var footHeight:Number = 90;
		
		/**
		 * 创建完成 
		 */		
		public static const CREATION_COMPLETE:String = "creationComplete";
		
		public static const LIST:String = "view_list";
//		public static const NAVIGATION:String = "view_navigation";
//		public static const HEAD:String = "view_head";
//		public static const BODY:String = "view_body";
//		public static const FOOT:String = "view_foot";
		
		public function VillaFacadeMenuManager()
		{
		}
		
		public function buildList():void
		{
			// TODO Auto Generated method stub
			buildData();
			
			buildNavigation();
			buildHead();
			buildBody();
			buildFoot();
			
			this.dispatchEvent(new DatasEvent(CREATION_COMPLETE, LIST));
		}
		
		private function buildData():void
		{
			// TODO Auto Generated method stub
			VillaFacadeMenuScene.getRootJson();
		}
		
		private function buildNavigation():void
		{
			// TODO Auto Generated method stub
			if(!main.listNavigation)
			{
				main.listNavigation = new VillaFacadeActionNavigationView();
				main.rightBox.addElement(main.listNavigation);
			}
			
			main.listNavigation.right = 0;
			main.listNavigation.height = main.height;
			main.listNavigation.width = main.rightBox.width;
			main.listNavigation.initView();
		}
		
		private function buildHead():void
		{
			// TODO Auto Generated method stub
			if(!main.listHead)
			{
				main.listHead = new VillaFacadeActionHeadView();
				main.leftBox.addElement(main.listHead);
			}
			
//			main.listHead.top = 0;
			main.listHead.height = headHeight;
			main.listHead.width = main.leftBox.width;
			main.listHead.initView();
		}
		
		private function buildBody():void
		{
			// TODO Auto Generated method stub
			if(!main.listBody)
			{
				main.listBody = new VillaFacadeActionBodyView();
				main.leftBox.addElement(main.listBody);
			}
			
//			main.listBody.top = headHeight;
			main.listBody.height = main.height - headHeight - footHeight;
			main.listBody.width = main.leftBox.width;
			main.listBody.initView();
		}
		
		private function buildFoot():void
		{
			// TODO Auto Generated method stub
			if(!main.listFoot)
			{
				main.listFoot = new VillaFacadeActionFootView();
				main.leftBox.addElement(main.listFoot);
			}
			
//			main.listFoot.bottom = 0;
			main.listFoot.height = footHeight;
			main.listFoot.width = main.leftBox.width;
			main.listFoot.initView();
		}
		
		/**
		 * 创建一条横线对象
		 * @param color 线条颜色
		 * @return 
		 * 
		 */		
		public static function buildHorizontalLine(color:uint):LineHorizontal
		{
			var line:LineHorizontal = new LineHorizontal();
			line.color = color;
			return line;
		}
		
		/**
		 * 创建一条竖线对象
		 * @param color 线条颜色
		 * @return 
		 * 
		 */		
		public static function buildVerticalLine(color:uint):LineVertical
		{
			var line:LineVertical = new LineVertical();
			line.color = color;
			return line;
		}
		
		/**
		 * 创建一个横向布局容器
		 * @param width 宽度
		 * @param height 高度
		 * @param horizontalAlign 横向布局
		 * @param verticalAlign 纵向布局
		 * @param gap 间距
		 * @return HGroup
		 * 
		 */		
		public static function buildHgroup(width:Number,height:Number,horizontalAlign:String,verticalAlign:String,gap:int = 5):HGroup
		{
			var group:HGroup = new HGroup();
			group.width = width;
			group.height = height;
			group.horizontalAlign = horizontalAlign;
			group.verticalAlign = verticalAlign;
			group.gap = gap;
			return group;
		}
		
		/**
		 * 创建一个纵向布局容器
		 * @param width 宽度
		 * @param height 高度
		 * @param horizontalAlign 横向布局
		 * @param verticalAlign 纵向布局
		 * @param gap 间距
		 * @return VGroup
		 * 
		 */		
		public static function buildVgroup(width:Number,height:Number,horizontalAlign:String,verticalAlign:String,gap:int = 5):VGroup
		{
			var group:VGroup = new VGroup();
			group.width = width;
			group.height = height;
			group.horizontalAlign = horizontalAlign;
			group.verticalAlign = verticalAlign;
			group.gap = gap;
			return group;
		}
	}
}