#include "GearSystem.h"
#include "Commands.h"

Scooter::GearSystem::GearSystem(AircraftState& state, Interface& inter):
m_state(state), m_interface(inter)
{

}

void Scooter::GearSystem::zeroInit()
{

}

void Scooter::GearSystem::coldInit()
{

}

void Scooter::GearSystem::hotInit()
{

}

void Scooter::GearSystem::airborneInit()
{

}

void Scooter::GearSystem::update()
{
	// Get cockpit position
	bool ac_power = m_interface.getElecPrimaryAC();
	bool elecGroundMode = m_interface.getElecGroundMode();

	bool allowRetract = ac_power & elecGroundMode;

	// If on ground, make non-clickable
	// Check what is behind ground mode


	// Overspeed detection
	double ias_knots = m_interface.ADC_getCAS() * 3.6 * 0.539956803456; // Conversion from m/s (to km/h) to knots


	// Nosewheel


	// TODO: sound interface

}

bool Scooter::GearSystem::handleInput(int command, float value)
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
