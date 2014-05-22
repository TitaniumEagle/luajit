project "luajit"
			
	kind ("Makefile")

	configuration {"vs*", "x64"}
		buildcommands { "setenv /release /x64" }
		rebuildcommands { "setenv /release /x64" }
	
	configuration {"vs*"}
	
		buildcommands {
			"cd " ..DIR_THIRDPARTY.."luajit/src/", 
			"msvcbuild.bat",
			"copy lua51.dll \"../../../../Lib/ThirdParty\\luajit_v2.0.3_windows-"..targetPlatform.."-"..toolset.."-"..configurationS..".dll\"",
			"copy lua51.lib \"../../../../Lib/ThirdParty\\luajit_v2.0.3_windows-"..targetPlatform.."-"..toolset.."-"..configurationS..".lib\"",
			"copy lua51.exp \"../../../../Lib/ThirdParty\\luajit_v2.0.3_windows-"..targetPlatform.."-"..toolset.."-"..configurationS..".exp\""
		}
		
		rebuildcommands {
			"cd " ..DIR_THIRDPARTY.."luajit/src/", 
			"msvcbuild.bat"
		}
		
		cleancommands {
			"cd " ..DIR_THIRDPARTY.."luajit/src/",
			"del *.dll",
			"del *.exe",
			"del *.lib"
		}
	
	configuration {}
	
	targetdir( "src/" )
	location( LDIR_THIRDPARTY_BUILD )
	
	buildoutputs { "lua51.lib", "lua51.dll" }
