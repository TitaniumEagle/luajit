project "luajit"
			
	kind ("Makefile")

	configuration {"windows", "x32"}
		buildcommands {
			"cd " ..BDIR_THIRDPARTY.."luajit/src/ &msvcbuild.bat"
		}
		
		rebuildcommands {
			"cd " ..BDIR_THIRDPARTY.."luajit/src/ &msvcbuild.bat"
		}
		
		cleancommands {
			"cd " ..BDIR_THIRDPARTY.."luajit/src/ &del ?.dll &del ?.exe &del ?.lib"
		}
	
	configuration {"windows", "x64"}
		buildcommands {
			"setenv /release /x64", "cd " ..BDIR_THIRDPARTY.."luajit/src/ &msvcbuild.bat"
		}
		
		rebuildcommands {
			"setenv /release /x64", "cd " ..BDIR_THIRDPARTY.."luajit/src/ &msvcbuild.bat"
		}
		
		cleancommands {
			"cd " ..BDIR_THIRDPARTY.."luajit/src/ &del ?.dll &del ?.exe &del ?.lib"
		}
		
	configuration {}
	
	targetdir( "src/" )
	location( LDIR_THIRDPARTY_BUILD )
	
	buildoutputs { "lua51.lib", "lua51.dll" }
	print(project().location)
