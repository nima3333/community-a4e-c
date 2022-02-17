#include "Gear.h"

Gear::Gear(double gearRetractTime, double gearExtendTime):
gearActuator(Scooter::Actuator()), gearRetractTime(gearRetractTime), gearExtendTime(gearExtendTime)
{
	gearActuator.setActuatorSpeed(1 / gearExtendTime);
}

void Gear::zeroInit()
{

}

void Gear::coldInit()
{

}

void Gear::hotInit()
{

}

void Gear::airborneInit()
{

}

void Gear::update(double dt)
{
	gearActuator.inputUpdate(gearTarget, dt);
	// switch (state)
	// {
	// case Gear::fsmStateGear::EXTENDED_GEAR:
	// 	if (target == 1) {
	// 		state = Gear::fsmStateGear::MOVING_GEAR;
	// 	}
	// 	break;
	// case Gear::fsmStateGear::MOVING_GEAR:
	// 	break;
	// case Gear::fsmStateGear::RETRACTED_GEAR:
	// 	break;
	// case Gear::fsmStateGear::DAMAGED_GEAR:
	// 	break;
	// default:
	// 	break;
	// }

}
