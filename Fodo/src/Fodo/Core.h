#pragma once

#ifdef FD_PLATFORM_WINDOWS
	#ifdef FD_BUILD_DLL
		#define FODO_API __declspec(dllexport)
	#else
		#define FODO_API __declspec(dllimport)
	#endif
#else
	#error Fodo Engine only support Windows!
#endif

#define BIT(x) (1 << x)