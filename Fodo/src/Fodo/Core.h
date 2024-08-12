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

#ifdef FD_DEBUG
	#define FD_ENABLE_ASSERTS
#endif

#ifdef FD_ENABLE_ASSERTS
	#define FD_ASSERT(x, ...) { if (!(x)) { FD_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define FD_CORE_ASSERT(x, ...) { if (!(x)) { FD_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define FD_ASSERT(x, ...)
	#define FD_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define FD_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)