#pragma once
//=========================================================================//
//
//		FILE NAME	: Actuator.h
//		AUTHOR		: TerjeTL
//		DATE		: October 2020
//
//		This file falls under the licence found in the root ExternalFM directory.
//
//		DESCRIPTION	:	Actuator class to provide realistic movement for the
//						controls.
//
//================================ Includes ===============================//
#include "BaseComponent.h"
//=========================================================================//

namespace Scooter
{

class Actuator : public BaseComponent
{
public:
	Actuator();
	Actuator(double speed);
	~Actuator();

	virtual void Actuator::zeroInit();
	virtual void Actuator::coldInit();
	virtual void Actuator::hotInit();
	virtual void Actuator::airborneInit();


	double inputUpdate(double targetPosition, double dt);
	void physicsUpdate(double dt);
	double getPosition();
	void setActuatorSpeed(double factor);
	void setPosition(double pos);
private:
	double m_actuatorFactor;
	double m_actuatorSpeed;
	double m_actuatorPos;
	double m_actuatorTargetPos;
};

}

