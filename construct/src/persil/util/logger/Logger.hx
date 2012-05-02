package persil.util.logger;

interface Logger 
{
	function debugger() : Void;
		
	function profile(title : String) : Void;
		
	function profileEnd() : Void;
		
	function init() : Void;

	function addFilter(filter : LogFilter) : Void;
	
	function info(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) : Void;
	
	function warn(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) : Void;
	
	function error(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) : Void;
	
	function infoEnabled(i : haxe.PosInfos) : Bool;

	function warnEnabled(i : haxe.PosInfos) : Bool;

	function errorEnabled(i : haxe.PosInfos) : Bool;
	
	function groupCollapsed(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos) : Void;

	function groupEnd(?i : haxe.PosInfos) : Void;
}