#include <Fodo.h>

class ExampleLayer : public Fodo::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		if (Fodo::Input::IsKeyPressed(FD_KEY_TAB))
			FD_TRACE("Tab key is pressed (poll)!");
	}

	void OnEvent(Fodo::Event& event) override
	{
		if (event.GetEventType() == Fodo::EventType::KeyPressed)
		{
			Fodo::KeyPressedEvent& e = (Fodo::KeyPressedEvent&)event;
			if (e.GetKeyCode() == FD_KEY_TAB)
				FD_TRACE("Tab is pressed (event)!");
			FD_TRACE("{0}", (char)e.GetKeyCode());
		}
	}
};

class Sandbox : public Fodo::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Fodo::ImGuiLayer());
	}

	~Sandbox()
	{
	}
};

Fodo::Application* Fodo::CreateApplication()
{
	return new Sandbox();
}