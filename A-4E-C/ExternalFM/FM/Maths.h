#pragma once
#include "Vec3.h"


#define PI 3.14159265359

namespace Skyhawk
{

extern const Vec3 windAxisToBody(const Vec3& force, const double& alpha, const double& beta);
extern const Vec3 directionVector( const double pitch, const double yaw );

}

static inline double toDegrees( double radians )
{
	return radians * 180.0 / PI;
}