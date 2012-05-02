import persil.util.logger.Logger;

class Log
{
	static var logger : Logger;

	public static inline function debugger()
	{
		logger.debugger();
	}
		
	public static inline function profile(title : String)
	{
		logger.profile(title);
	}
		
	public static inline function profileEnd()
	{
		logger.profileEnd();
	}
		
	public static function init()
	{
		#if js
			logger = new persil.util.logger.JSLogger();
		#else
			logger = new persil.util.logger.EmptyLogger();
		#end
	}

	public static function addFilter(filter : LogFilter)
	{
		logger.addFilter(filter);
	}
	
	public static inline function info(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		logger.info(m0, m1, m2, m3, m4, m5, m6, i);
	}
	
	public static inline function warn(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		logger.warn(m0, m1, m2, m3, m4, m5, m6, i);
	}
	
	public static inline function error(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		logger.error(m0, m1, m2, m3, m4, m5, m6, i);
	}
	
	public static function infoEnabled(i : haxe.PosInfos)
	{
		return logger.infoEnabled(i);
	}
	
	public static function warnEnabled(i : haxe.PosInfos)
	{
		return logger.warnEnabled(i);
	}
	
	public static function errorEnabled(i : haxe.PosInfos)
	{
		return logger.errorEnabled(i);
	}
	
	public static inline function groupCollapsed(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		logger.groupCollapsed(m0, m1, m2, m3, m4, m5, m6, i);
	}
	
	public static function groupEnd(?i : haxe.PosInfos)
	{
		logger.groupEnd(i);
	}	
}