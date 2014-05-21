project "luajit"
			
	kind ("Makefile")

	configuration "x32"
		buildcommands {
			"cd " ..BDIR_THIRDPARTY.."luajit-2.0/src/ &msvcbuild.bat"
		}
		
		rebuildcommands {
			"cd " ..BDIR_THIRDPARTY.."luajit-2.0/src/ &msvcbuild.bat"
		}
		
		cleancommands {
			"cd " ..BDIR_THIRDPARTY.."luajit-2.0/src/ &del ?.dll &del ?.exe &del ?.lib"
		}
	
	configuration "x64"
		buildcommands {
			"setenv /release /x64", "cd " ..BDIR_THIRDPARTY.."luajit-2.0/src/ &msvcbuild.bat"
		}
		
		rebuildcommands {
			"setenv /release /x64", "cd " ..BDIR_THIRDPARTY.."luajit-2.0/src/ &msvcbuild.bat"
		}
		
		cleancommands {
			"cd " ..BDIR_THIRDPARTY.."luajit-2.0/src/ &del ?.dll &del ?.exe &del ?.lib"
		}
		
	configuration {}
	
	targetdir( "src/" )
	location( LDIR_THIRDPARTY_BUILD )
	
	buildoutputs { "lua51.lib", "lua51.dll" }
	print(project().location)