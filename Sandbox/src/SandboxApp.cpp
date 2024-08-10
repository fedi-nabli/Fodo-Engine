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
		FD_INFO("ExampleLayer::Update");
	}

	void OnEvent(Fodo::Event& event) override
	{
		FD_TRACE("{0}", event);
	}
};

class Sandbox : public Fodo::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{
	}
};

Fodo::Application* Fodo::CreateApplication()
{
	return new Sandbox();
}