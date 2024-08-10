#include "fdpch.h"

#include "Layer.h"

namespace Fodo {
	Layer::Layer(const std::string& debugName)
		: m_DebugName(debugName) {}

	Layer::~Layer()
	{}
}