workspace "Fodo"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	startproject "Sandbox"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Fodo"
	location "Fodo"
	kind "SharedLib"
	language "C++"
	toolset "v142"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"FD_PLATFORM_WINDOWS",
			"FD_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "FD_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "FD_DEBUG"
		optimize "On"
	
	filter "configurations:Dist"
		defines "FD_DEBUG"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	toolset "v142"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Fodo/vendor/spdlog/include",
		"Fodo/src"
	}

	links
	{
		"Fodo"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"FD_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "FD_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "FD_DEBUG"
		optimize "On"
	
	filter "configurations:Dist"
		defines "FD_DEBUG"
		optimize "On"