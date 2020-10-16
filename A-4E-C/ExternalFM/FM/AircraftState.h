#pragma once
#ifndef AIRCRAFT_MOTION_STATE_H
#define AIRCRAFT_MOTION_STATE_H
#include "BaseComponent.h"
#include <math.h>
#include "Vec3.h"

namespace Skyhawk
{

class AircraftState : public BaseComponent
{
public:
	AircraftState();
	virtual void zeroInit();
	virtual void coldInit();
	virtual void hotInit();
	virtual void airborneInit();

	inline void setCurrentStateBodyAxis(double aoa, double beta, const Vec3& angle, const Vec3& omega, const Vec3& omegaDot, const Vec3& airspeed, const Vec3& acceleration);
	inline void setCurrentStateWorldAxis( const Vec3& worldPosition, const Vec3& worldVelocity );
	inline void setMach( double mach );

	inline const Vec3& getWorldPosition() const;
	inline const Vec3& getWorldVelocity() const;
	inline const Vec3& getAngle() const;
	inline const Vec3& getOmega() const;
	inline const Vec3& getOmegaDot() const;
	inline const Vec3& getLocalAirspeed() const;
	inline const Vec3& getLocalAcceleration() const;
	inline const double getAOA() const;
	inline const double getBeta() const;
	inline const double getMach() const;
	inline const double getAirDensity() const;



private:
	Vec3 m_worldPosition;
	Vec3 m_worldVelocity;
	Vec3 m_angle;
	Vec3 m_omega;
	Vec3 m_omegaDot;
	Vec3 m_localAirspeed;
	Vec3 m_localAcceleration;
	double m_aoa;
	double m_beta;
	double m_mach;
	double m_airDensity;
};

	
void AircraftState::setCurrentStateBodyAxis( 
	double aoa, 
	double beta, 
	const Vec3& angle, 
	const Vec3& omega, 
	const Vec3& omegaDot, 
	const Vec3& airspeed, 
	const Vec3& acceleration 
)
{
	m_aoa = aoa;
	m_beta = beta;
	m_angle = angle;
	m_omega = omega;
	m_omegaDot = omegaDot;
	m_localAirspeed = airspeed;
	m_localAcceleration = acceleration;
}

void AircraftState::setCurrentStateWorldAxis( 
	const Vec3& worldPosition,
	const Vec3& worldVelocity 
)
{
	m_worldPosition = worldPosition;
	m_worldVelocity = worldVelocity;
}

void AircraftState::setMach( double mach )
{
	m_mach = mach;
}

const double AircraftState::getMach() const
{
	return m_mach;
}

const double AircraftState::getAirDensity() const
{
	return m_airDensity;
}

const Vec3& AircraftState::getWorldPosition() const
{
	return m_worldPosition;
}

const Vec3& AircraftState::getWorldVelocity() const
{
	return m_worldVelocity;
}

const Vec3& AircraftState::getAngle() const
{
	return m_angle;
}

const Vec3& AircraftState::getOmega() const
{
	return m_omega;
}

const Vec3& AircraftState::getOmegaDot() const
{
	return m_omegaDot;
}

const Vec3& AircraftState::getLocalAirspeed() const
{
	return m_localAirspeed;
}

const Vec3& AircraftState::getLocalAcceleration() const
{
	return m_localAcceleration;
}

const double AircraftState::getAOA() const
{
	return m_aoa;
}

const double AircraftState::getBeta() const
{
	return m_beta;
}


}




#endif