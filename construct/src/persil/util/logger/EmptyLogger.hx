package persil.util.logger;

import persil.util.logger.Logger;

class EmptyLogger implements Logger 
{
	public function new() {}

	public function debugger() {}
		
	public function profile(title : String) {}
		
	public function profileEnd() {}
		
	public function init() {}
	
	public function addFilter(filter : LogFilter) {}
	
	public function info(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) {}
	
	public function warn(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) {}
	
	public function error(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) {}
	
	public function infoEnabled(i : haxe.PosInfos) : Bool 
	{
		return false;
	}
	
	public function warnEnabled(i : haxe.PosInfos) : Bool 
	{
		return false;
	}
	
	public function errorEnabled(i : haxe.PosInfos) : Bool 
	{
		return false;
	}
	
	public function groupCollapsed(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) {}
	
	public function groupEnd(?i : haxe.PosInfos) : Void {}
}