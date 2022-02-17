#include "GearSystem.h"
#include "Commands.h"

Scooter::GearSystem::GearSystem(AircraftState& state, Interface& inter, Airframe& frame):
m_state(state), m_interface(inter), m_airframe(frame), 
leftGear(Gear()), rightGear(Gear()), noseGear(Gear(DEFAULT_NOSE_RET_TIME, DEFAULT_NOSE_EXT_TIME))
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

void Scooter::GearSystem::update(double dt)
{
	// Get cockpit position
	bool ac_power = m_interface.getElecPrimaryAC();
	bool elecGroundMode = m_interface.getElecGroundMode();

	bool allowRetract = ac_power & elecGroundMode;

	// Overspeed detection
	double ias_knots = m_interface.ADC_getCAS() * 3.6 * 0.539956803456; // Conversion from m/s (to km/h) to knots
	if(ias_knots > 280 && (currentState==fsmStateGear::MOVING_GEAR || currentState==fsmStateGear::EXTENDED_GEAR) ){
		// TODO: maybe per gear state ?
	}

	// Nosewheel


	// TODO: sound interface
	leftGear.update(dt);
	rightGear.update(dt);
	noseGear.update(dt);

	// get hydrolic HYD_UTILITY_OK


}

bool Scooter::GearSystem::handleInput(int command, float value)
{
	switch (command)
	{
	case KEYS_PLANEGEAR:
		if(value )
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

void Scooter::GearSystem::changeState(fsmStateGear new_state){
	// When transitioning state
	// TODO: for the sound system
}