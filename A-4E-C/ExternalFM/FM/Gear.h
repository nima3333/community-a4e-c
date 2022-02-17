#pragma once
#include <Actuator.h>
#include <cstddef>
#include <GearSystem.h>

/*
Logic to implement:
At each update

*/
double DEFAULT_GEAR_TIME = 5.0;
double DEFAULT_NOSE_EXT_TIME = 6.0;
double DEFAULT_NOSE_RET_TIME = 8.0;

class Gear : public BaseComponent
{
public:
	Gear(double gearRetractTime = DEFAULT_GEAR_TIME, double gearExtendTime = DEFAULT_GEAR_TIME);

	virtual void zeroInit();
	virtual void coldInit();
	virtual void hotInit();
	virtual void airborneInit();

	void update(double dt);

	bool nwsEnable;
	bool nwsActivated;

	double gearRetractTime;
	double gearExtendTime;

	Scooter::Actuator& gearActuator;

	void setGearTarget(double target);
	double getGearTarget();
	double gearTarget;

};

