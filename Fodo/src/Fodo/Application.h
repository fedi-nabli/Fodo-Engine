#pragma once

#include "Fodo/Core.h"
#include "Fodo/Window.h"
#include "Fodo/LayerStack.h"
#include "Fodo/Events/Event.h"
#include "Fodo/Events/ApplicationEvent.h"

namespace Fodo {
	class FODO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* overlay);

		void OnEvent(Event& e);

	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}
