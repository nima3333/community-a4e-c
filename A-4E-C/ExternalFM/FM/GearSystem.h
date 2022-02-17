#pragma once
#include <Gear.h>
#include <AircraftState.h>
#include <Interface.h>
#include <Airframe.h>

namespace Scooter
{

	class GearSystem : public BaseComponent
	{
	public:

		GearSystem(AircraftState& state, Interface& inter, Airframe& airframe);
		~GearSystem();

		virtual void zeroInit();
		virtual void coldInit();
		virtual void hotInit();
		virtual void airborneInit();

		void update(double dt);
		bool handleInput(int command, float value);
		// TODO: handle damage

		Gear& leftGear;
		Gear& rightGear;
		Gear& noseGear;

		bool nwsActivated;

		enum class fsmStateGear
		{
			EXTENDED_GEAR,
			MOVING_GEAR,
			RETRACTED_GEAR,
			DAMAGED_GEAR
		};

		enum class gearTarget
		{
			DOWN,
			UP
		};

		void changeState(fsmStateGear new_state);
		fsmStateGear currentState;

		AircraftState& m_state;
		Interface& m_interface;
		Airframe& m_airframe;

	};

}