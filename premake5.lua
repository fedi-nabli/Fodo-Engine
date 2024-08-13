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
IncludeDir["ImGui"] = "Fodo/vendor/imgui"
IncludeDir["glm"] = "Fodo/vendor/glm"

group "Dependecies"
  include "Fodo/vendor/GLFW"
  include "Fodo/vendor/Glad"
  include "Fodo/vendor/imgui"
group ""

project "Fodo"
  location "Fodo"
  kind "SharedLib"
  language "C++"
  toolset "v143"
  staticruntime "off"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  pchheader "fdpch.h"
  pchsource "Fodo/src/fdpch.cpp"

  files
  {
    "%{prj.name}/src/**.h",
    "%{prj.name}/src/**.cpp",
    "%{prj.name}/vendor/glm/glm/**.hpp",
    "%{prj.name}/vendor/glm/glm/**.inl"
  }

  includedirs
  {
    "%{prj.name}/src",
    "%{prj.name}/vendor/spdlog/include",
    "%{IncludeDir.GLFW}",
    "%{IncludeDir.Glad}",
    "%{IncludeDir.ImGui}",
    "%{IncludeDir.glm}"
  }

  links
  {
    "GLFW",
    "Glad",
    "ImGui",
    "opengl32.lib"
  }

  filter "system:windows"
    cppdialect "C++17"
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
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    defines "FD_RELEASE"
    runtime "Release"
    optimize "On"

  filter "configurations:Dist"
    defines "FD_DIST"
    runtime "Release"
    optimize "On"

project "Sandbox"
  location "Sandbox"
  kind "ConsoleApp"
  language "C++"
  toolset "v143"
  staticruntime "off"

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
    "Fodo/src",
    "%{IncludeDir.glm}"
  }

  links
  {
    "Fodo"
  }

  filter "system:windows"
    cppdialect "C++17"
    systemversion "latest"

    defines
    {
      "FD_PLATFORM_WINDOWS"
    }

  filter "configurations:Debug"
    defines "FD_DEBUG"
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    defines "FD_RELEASE"
    runtime "Release"
    optimize "On"

  filter "configurations:Dist"
    defines "FD_DIST"
    runtime "Release"
    optimize "On"