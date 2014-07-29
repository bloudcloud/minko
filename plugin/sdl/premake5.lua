if minko.platform.supports { "android" } then
	include "lib/android"
end

PROJECT_NAME = path.getname(os.getcwd())

minko.project.library("minko-plugin-" .. PROJECT_NAME)

	files {
		"include/**.hpp",
		"src/**.cpp",
		"src/**.hpp"
	}

	includedirs {
		"include",
		"lib/sdl/include"
	}

	configuration { "android" }
		minko.plugin.enable { "android" }

	configuration { "html5" }
		removeincludedirs { "lib/sdl/include" }
		includedirs { EMSCRIPTEN .. "/system/include/SDL" }
		minko.plugin.enable { "webgl" }
