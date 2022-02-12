#pragma once
#include <Actuator.h>

/*
Logic to implement:
At each update

*/
class Gear
{
public:

	bool nwsEnable;
	bool nwsActivated;

	Scooter::Actuator gearAct;

	double gearRetractTime;
	double gearExtendTime;
	double gearMaineTime;

	bool gearError;
};

