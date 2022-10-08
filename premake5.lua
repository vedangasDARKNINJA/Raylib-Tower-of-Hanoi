workspace "CS5343_001_Assignment3"
   configurations { "Debug", "Release" }
   architecture "x86_64"
   location "build"

include "raylib/"

project "TowerOfHanoi"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++17"

   targetdir "bin/%{prj.name}/%{cfg.buildcfg}"
   debugdir "bin/%{prj.name}/%{cfg.buildcfg}"
   objdir "bin-int/%{prj.name}/%{cfg.buildcfg}"
   location "build/%{prj.name}"

   dependson {"raylib"}
   links{"raylib"}

   libdirs{
      "bin/raylib/%{cfg.buildcfg}"
   }
   files { 
      "%{prj.name}/include/**.h", 
      "%{prj.name}/include/**.hpp", 
      "%{prj.name}/src/**.cpp" 
   }

   includedirs {
      "%{prj.name}/include/",
      "raylib/src/"
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
   
   filter "action:vs*"
      links{"raylib.lib"}