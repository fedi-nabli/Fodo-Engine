#include "Application.h"

#include "Fodo/Log.h"
#include "Fodo/Events/MouseEvent.h"
#include "Fodo/Events/ApplicationEvent.h"

namespace Fodo {
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			FD_TRACE("{}", e.ToString());
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			FD_TRACE("{}", e.ToString());
		}

		MouseScrolledEvent e2(20, 30);
		if (e2.IsInCategory(EventCategoryMouse))
		{
			FD_TRACE("{}", e2.ToString());
		}
		if (e2.IsInCategory(EventCategoryInput))
		{
			FD_TRACE("{}", e2.ToString());
		}

		while (true);
	}
}
