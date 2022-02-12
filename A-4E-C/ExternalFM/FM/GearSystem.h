#pragma once
#include <Gear.h>
#include <AircraftState.h>
#include <Interface.h>

namespace Scooter
{

	class GearSystem : public BaseComponent
	{
	public:

		GearSystem(AircraftState& state, Interface& inter);
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

	private:
		AircraftState& m_state;
		Interface& m_interface;
	};

}