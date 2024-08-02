#pragma once

#include "Fodo/Application.h"

#ifdef FD_PLATFORM_WINDOWS

extern Fodo::Application* Fodo::CreateApplication();

int main(int argc, char** argv)
{
	Fodo::Log::Init();
	FD_CORE_WARN("Initialized Log!");
	int a = 5;
	FD_INFO("Hello, Var={0}", a);

	auto app = Fodo::CreateApplication();
	app->Run();
	delete app;
}

#endif