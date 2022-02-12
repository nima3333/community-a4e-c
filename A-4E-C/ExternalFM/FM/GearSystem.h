#pragma once
#include <Gear.h>

class GearSystem : public BaseComponent
{
public:

	GearSystem();
	~GearSystem();

	virtual void zeroInit();
	virtual void coldInit();
	virtual void hotInit();
	virtual void airborneInit();

	void update();
	bool handleInput(int command, float value);

	Gear leftGear;
	Gear rightGear;
	Gear noseGear;

}; 

