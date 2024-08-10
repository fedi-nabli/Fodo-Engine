project "Glad"
  kind "StaticLib"
  language "C"

  targetdir ("bin/" .. outputdir .. "%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "%{prj.name}")

  files
  {
    "src/glad.c",
    "include/glad/glad.h",
    "include/KHR/khrplatform.h"
  }

  includedirs
  {
    "include"
  }

  filter "system:windows"
    systemversion "latest"
    staticruntime "On"

  filter { "system:windows", "configurations:Release" }
    buildoptions "/MT"