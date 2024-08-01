#pragma once

#include "Core.h"

namespace Fodo {
	class FODO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}
