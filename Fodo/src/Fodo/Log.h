#pragma once

#include "Fodo/Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

#include <memory>

namespace Fodo {
	class FODO_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core Log macros
#define FD_CORE_TRACE(...)		::Fodo::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define FD_CORE_INFO(...)		::Fodo::Log::GetCoreLogger()->info(__VA_ARGS__)
#define FD_CORE_WARN(...)		::Fodo::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define FD_CORE_ERROR(...)		::Fodo::Log::GetCoreLogger()->error(__VA_ARGS__)
#define FD_CORE_FATAL(...)		::Fodo::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client Log macros
#define FD_TRACE(...)		::Fodo::Log::GetClientLogger()->trace(__VA_ARGS__)
#define FD_INFO(...)		::Fodo::Log::GetClientLogger()->info(__VA_ARGS__)
#define FD_WARN(...)		::Fodo::Log::GetClientLogger()->warn(__VA_ARGS__)
#define FD_ERROR(...)		::Fodo::Log::GetClientLogger()->error(__VA_ARGS__)
#define FD_FATAL(...)		::Fodo::Log::GetClientLogger()->critical(__VA_ARGS__)

