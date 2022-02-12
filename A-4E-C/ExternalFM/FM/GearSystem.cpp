#include "GearSystem.h"
#include "Commands.h"

void GearSystem::zeroInit()
{

}

void GearSystem::coldInit()
{

}

void GearSystem::hotInit()
{

}

void GearSystem::airborneInit()
{

}

void GearSystem::update()
{
}

bool GearSystem::handleInput(int command, float value)
{
	switch (command)
	{
	case KEYS_PLANEGEAR:
		return true;

	case KEYS_PLANEGEARUP:
		return true;

	case KEYS_PLANEGEARDOWN:
		return true;

	case DEVICE_COMMANDS_GEAR:  // Gear Handle
		return true;

	case DEVICE_COMMANDS_EMER_GEAR_RELEASE:
		return true;

	case KEYS_NWS_ENGAGE:
		return true;

	case KEYS_NWS_DISENGAGE:
		return true;
	}

	return false;
}
