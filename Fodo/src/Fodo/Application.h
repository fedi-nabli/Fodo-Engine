#pragma once

#include "Fodo/Core.h"
#include "Fodo/Window.h"
#include "Fodo/Events/Event.h"

namespace Fodo {
	class FODO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}
