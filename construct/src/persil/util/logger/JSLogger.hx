package persil.util.logger;

import js.Lib;
import js.Dom;

import persil.util.logger.Logger;

class JSLogger implements Logger 
{
	var filters : Array<LogFilter>;
	var posInfo : haxe.PosInfos;
	var args : Array<Dynamic>;
	var errors : Array<String>;
	var errorDiv : HtmlDom;

	public function new() 
	{
		filters = new Array();
		args = new Array();
		errors = new Array();
	}

	public function debugger()
	{
		untyped __js__("debugger");
	}
		
	public function profile(title : String)
	{
		untyped console.profile(title);
	}
		
	public function profileEnd()
	{
		untyped console.profileEnd();
	}
		
	public function init()
	{
		untyped
		{
			if (!window.console) console = {};
			console.log = console.log || function() {};
			console.info = console.info || function() {};
			console.warn = console.warn || function() {};
			console.error = console.error || function() {};
		}
		
		haxe.Log.trace = infoConsole;
		
	}

	public function addFilter(filter : LogFilter)
	{
		filters.push(filter);
	}
	
	public function info(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		
		posInfo = i;
		if (filter(LogLevel.INFO))
		{
			fetchInput(m0, m1, m2, m3, m4, m5, m6);
			untyped console.info(createMessage());
		}
		
	}
	
	public function warn(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		
		posInfo = i;
		if (filter(LogLevel.WARN))
		{
			fetchInput(m0, m1, m2, m3, m4, m5, m6);
			untyped console.warn(createMessage());
		}
		
	}
	
	public function error(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		
		posInfo = i;
		if (filter(LogLevel.ERROR))
		{
			fetchInput(m0, m1, m2, m3, m4, m5, m6);
			untyped console.error(createErrorMessage() + "\n\tStack:\n\t\t" + haxe.Stack.exceptionStack().join("\n\t\t"));
			displayError(createErrorMessage());
		}
		
	}
	
	public function infoEnabled(i : haxe.PosInfos) : Bool
	{
		posInfo = i;
		return filter(LogLevel.INFO);
	}
	
	public function warnEnabled(i : haxe.PosInfos) : Bool
	{
		posInfo = i;
		return filter(LogLevel.WARN);
	}
	
	public function errorEnabled(i : haxe.PosInfos) : Bool
	{
		posInfo = i;
		return filter(LogLevel.ERROR);
	}
	
	public function groupCollapsed(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic, ?i : haxe.PosInfos)
	{
		
		if (infoEnabled(i))
		{
			fetchInput(m0, m1, m2, m3, m4, m5, m6);		
			untyped console.groupCollapsed(createMessage());
		}
		
	}
	
	public function groupEnd(?i : haxe.PosInfos) : Void
	{
		if (infoEnabled(i))
			untyped console.groupEnd();
	}

	
	 function fetchInput(?m0 : Dynamic, ?m1 : Dynamic, ?m2 : Dynamic, ?m3 : Dynamic, ?m4 : Dynamic, ?m5 : Dynamic, ?m6 : Dynamic)
	{
		args = new Array();
		if (m0 != null)	args.push(m0);
		if (m1 != null) args.push(m1);
		if (m2 != null) args.push(m2);
		if (m3 != null) args.push(m3);
		if (m4 != null) args.push(m4);
		if (m5 != null) args.push(m5);
		if (m6 != null) args.push(m6);		
	}
	
	 function createMessage()
	{
//		if (posInfo == null)
			return args.join(" ");
			
		var from = posInfo.className + "." + posInfo.methodName;
		return "[" + from + "] " + args.join(" ");
	}
		
	 function createErrorMessage()
	{
		if (posInfo == null)
			return args.join(" ");
			
		var from = posInfo.className + "." + posInfo.methodName;
		return "[" + from + "]\n" + args.join(" ");
	}
		
	 function filter(level : LogLevel)
	{
		if (posInfo == null)
			return true;
			
		var result = true;
		
		for (filter in filters)
			result = filter.enabled(result, posInfo, level);
		
		return result;
	}
	
	 function infoConsole(v : Dynamic, ?i : haxe.PosInfos)
	{
		
		posInfo = i;
		fetchInput(v);
		untyped console.log("" + createMessage() + " (trace)");
		
	}
	
	 function displayError(message : String)
	{
		
		if (Lib.document.createElement == null)
			return;
			
		if (errorDiv == null)
		{
			errorDiv = Lib.document.createElement("div");
			errorDiv.className = "Error";
			Lib.document.body.appendChild(errorDiv);
			
			errorDiv.innerHTML = "<h1>Ups!</h1>I could not start!\nPlease use up-to-date hardware and an up-to-date browser for this experience.\n\n\nTechnical Details:\n";
		}
		
		if (!Lambda.has(errors, message))
		{
			errors.push(message);
			errorDiv.innerHTML += message + "\n";
		}
	}
	
	function errorFilter()
	{
		
	}
}