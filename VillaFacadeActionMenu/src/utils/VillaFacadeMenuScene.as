package utils
{
	import com.adobe.serialization.json.JSON;
	
	import flash.utils.Dictionary;
	
	import datas.NavigationData;
	
	import extension.wl.globalData.allStaticTypes.SvgType;
	import extension.wl.utils.ObjectUtils;

	public class VillaFacadeMenuScene
	{
		/**
		 * 默认值为外挂 
		 */		
		public static var sceneType:String= "villaFacade_view_external";
		
		/**
		 * 显示节点是否使用默认加载模式 
		 */		
		public static var isNormalDisplayDataDownloadType:Boolean = true;
		
		/**
		 * 当前类型 外挂 
		 */		
		public static const VILLAFACADE_VIEW_EXTERNAL:String = "villaFacade_view_external";
		
		/**
		 * 当前类型 造型 
		 */		
		public static const VILLAFACADE_VIEW_MODELING:String = "villaFacade_view_modeling";
		
		/**
		 * 当前类型 门廊 
		 */		
		public static const VILLAFACADE_VIEW_PORCH:String = "villaFacade_view_proch";
		
		/**
		 * 当前类型 台阶
		 */		
		public static const VILLAFACADE_VIEW_STAIR:String = "villaFacede_view_stair";
		
		/**
		 * 当前类型 顶面 
		 */		
		public static const VILLAFACADE_VIEW_TOP:String = "villaFacade_view_top";
		
		/**
		 * 界面配置数据 
		 */		
		public static var configJson:Object = null;
		
		/**
		 * 导航配置数据 
		 */		
		public static var navigationJson:Object = null;
		
		/**
		 * 显示节点数据 
		 */		
		public static var rootJson:Object = null; 
		
		/**
		 * 当前界面数据 
		 */		
		public static var currentViewData:Dictionary = null;
		
		/**
		 * 获取显示列表节点数据
		 *  
		 */		
		public static function getRootJson():void
		{
			// TODO Auto Generated method stub
			var arg:Array = ["乐家", "产品", "模型", "室外", "室外模型"];
//			暂时数据为空
//			var rootJson:Object = L3DRootNode.instance.lejiaLibraryJson;
//			rootJson = ObjectUtils.jsonSearchNode(ObjectUtils.clone(rootJson), arg);
		}
		
		public static function setConfigJson(originData:Object):void
		{
			var len:int = (originData.config as Array).length;
			for(var i:int = 0; i < len; i++)
			{
				if(originData.config[i].configtype == "view")
				{
					configJson = originData.config[i].configdata;
					continue;
				}
				
				if(originData.config[i].configtype == "navigation")
				{
					navigationJson = originData.config[i].configdata;
					continue;
				}
				
			}
		}
		
		/**
		 * 获取当前界面配置数据
		 * @param type 工具界面类型
		 * @return 
		 * 
		 */		
		public static function getCurrentConfigJson(configJsonType:String):Array
		{
			var currentConfigJson:Array = null;
			var result:Array = null;
			if(configJson)
			{
				var len:int = configJson.length;
				for(var i:int = 0; i < len; i++)
				{
					if(configJson[i].facadetype == sceneType) //
					{
						currentConfigJson = ObjectUtils.clone(configJson[i].children as Array);
						break;
					}
				}
			}
			
			if(currentConfigJson)
			{
				var currentLen:int = currentConfigJson.length;
				for(var j:int = 0; j < len; j++)
				{
					if(currentConfigJson[j].toolname == configJsonType) //
					{
						result = ObjectUtils.clone(currentConfigJson[j].children as Array);
						break;
					}
				}
			}
			
			return result != null ? result : null;
		}
		
		public static function decodeJson(data:String):Object
		{
			return com.adobe.serialization.json.JSON.decode(data);
		}
		
		/**
		 * 导航栏 svg按钮模式 
		 * @return 
		 * 
		 */		
		public static function navigationSVGList():Array
		{
			var list:Array = [SvgType.BOTTOMBAR_VILLAEXTERNAL_EVENT, SvgType.BOTTOMBAR_VILLASTAIRS_EVENT, SvgType.BOTTOMBAR_VILLAPORCH_EVENT, SvgType.BOTTOMBAR_VILLATOP_EVENT, SvgType.BOTTOMBAR_VILLAMODELLING_EVENT];	
			return list;
		}
		
		/**
		 *  
		 * @return 
		 * 
		 */		
		public static function navigationLabelList():Array
		{
			var list:Array = ["外挂", "造型", "台阶", "门廊", "顶面"];
			return list;
		}
		
		/**
		 *  
		 * @return 
		 * 
		 */		
		public static function navigationTypeList():Vector.<NavigationData>
		{
			var vector:Vector.<NavigationData> = new Vector.<NavigationData>();
			var len:int = (navigationJson as Array).length;
			for(var i:int = 0; i < len; i++)
			{
				var data:NavigationData = NavigationData.buildNavigationData(navigationJson[i].label, navigationJson[i].type);
				vector.push(data);
			}
			return vector;
		}
	}
}