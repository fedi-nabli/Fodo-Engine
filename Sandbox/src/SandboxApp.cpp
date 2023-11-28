#include <Fodo.h>

class Sandbox : public Fodo::Application
{
public:
	Sandbox()
	{
	}

	~Sandbox()
	{
	}
};

Fodo::Application* Fodo::CreateApplication()
{
	return new Sandbox();
}