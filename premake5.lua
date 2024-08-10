workspace "Fodo"
  architecture "x64"
  startproject "Sandbox"

  configurations
  {
    "Debug",
    "Release",
    "Dist"
  }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Fodo/vendor/GLFW/include"
IncludeDir["Glad"] = "Fodo/vendor/Glad/include"

include "Fodo/vendor/GLFW"
include "Fodo/vendor/Glad"

project "Fodo"
  location "Fodo"
  kind "SharedLib"
  language "C++"
  toolset "v143"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  pchheader "fdpch.h"
  pchsource "Fodo/src/fdpch.cpp"

  files
  {
    "%{prj.name}/src/**.h",
    "%{prj.name}/src/**.cpp"
  }

  includedirs
  {
    "%{prj.name}/src",
    "%{prj.name}/vendor/spdlog/include",
    "%{IncludeDir.GLFW}",
    "%{IncludeDir.Glad}"
  }

  links
  {
    "GLFW",
    "Glad",
    "opengl32.lib"
  }

  filter "system:windows"
    cppdialect "C++17"
    staticruntime "On"
    systemversion "latest"

    defines
    {
      "FD_PLATFORM_WINDOWS",
      "FD_BUILD_DLL",
      "GLFW_INCLUDE_NONE"
    }

    postbuildcommands
    {
      ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
    }

  filter "configurations:Debug"
    defines "FD_DEBUG"
    buildoptions "/MDd"
    symbols "On"

  filter "configurations:Release"
    defines "FD_RELEASE"
    buildoptions "/MD"
    optimize "On"

  filter "configurations:Dist"
    defines "FD_DIST"
    buildoptions "/MD"
    optimize "On"

project "Sandbox"
  location "Sandbox"
  kind "ConsoleApp"
  language "C++"
  toolset "v143"

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
    buildoptions "/MDd"
    symbols "On"

  filter "configurations:Release"
    defines "FD_RELEASE"
    buildoptions "/MD"
    optimize "On"

  filter "configurations:Dist"
    defines "FD_DIST"
    buildoptions "/MD"
    optimize "On"