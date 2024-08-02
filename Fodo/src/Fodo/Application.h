#pragma once

#include "Fodo/Core.h"
#include "Fodo/Window.h"
#include "Fodo/Events/Event.h"
#include "Fodo/Events/ApplicationEvent.h"

namespace Fodo {
	class FODO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}
