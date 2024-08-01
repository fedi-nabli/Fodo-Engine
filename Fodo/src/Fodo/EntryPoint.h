#pragma once

#include "Application.h"

#ifdef FD_PLATFORM_WINDOWS

extern Fodo::Application* Fodo::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Fodo::CreateApplication();
	app->Run();
	delete app;
}

#endif