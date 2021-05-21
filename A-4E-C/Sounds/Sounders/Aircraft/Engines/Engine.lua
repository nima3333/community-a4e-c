dofile("Tools.lua")
dofile("Curve.lua")

offsets = {
	core   = 0,
	core2  = 0,
	fan    = 0,
	turb   = 0,
	jet    = 0,
	around = 0
}

--SOUND_CORE_RPM = 0 -- This is normalised 0.0 -> 1.0
SOUND_FAN_RPM = 1  -- This is normalised 0.0 -> 1.0
SOUND_TURBINE_POWER = 2 --No idea
SOUND_THRUST = 3 -- I assume this is in Newtons
SOUND_TRUE_AIRSPEED = 4 --Airspeed I think is in m/s

engine = {number = 0}

function engine:new()
	o = {}
	setmetatable(o, self)
	self.__index = self
	o.number = 1
	return o
end

function engine:init(number_, host)

	--[[
	Format:

	{
		sound = nil,
		type_pitch = <what is the x axis for the pitch curve>,
		type_gain = <what is the x axis for the gain curve>,
		sdef_name = <which sound sdef>,
		pitch_curve = Curve(<curve data>, <min>, <max>)
		gain_curve = Curve(<curve data>, <min>, <max>)
	}

	]]


	self.sounds = {
		--[[
			= = = = = = = = = = = = = = = = = = = = = = = = =
			SOUND DEFINITION FILES AND ASSETS
			= = = = = = = = = = = = = = = = = = = = = = = = =

			Localiztion, audible distance, and other imporant variables are set in the sdefs, see:
			/Sounds/sdef/Aircrafts/Engines/A-4E-C

			External sound assets are placed in 
			/Sounds/Effects/Aircrafts/Engines/A-4E-C
		
			= = = = = = = = = = = = = = = = = = = = = = = = =
			WARNING! WARNING! WARNING! WARNING! WARNING! 
			= = = = = = = = = = = = = = = = = = = = = = = = =
			DO NOT COPY OR USE THESE SOUNDS
			= = = = = = = = = = = = = = = = = = = = = = = = =

			Some assets used in the creation of these sounds 
			were made with purchased and licensed assets. 
			While many parts of this project are open source, 
			these sounds are not. 

			While they are significantly transformed 
			from their original sources, taking these sounds 
			for use in your own project is theft: 
			not from the Community A-4E-C project, 
			but from the original licensors of the source material.

			Distributing these sounds puts YOU in legal jeopardy 
			should the licensors of the original assets find out,
			and rest assured, there are entire teams of people 
			whose entire livelihood is chasing theives down
			and making them pay (in spades). 

			The Community A-4E-C project is not reponsible 
			for your copyright infringement.

			= = = = = = = = = = = = = = = = = = = = = = = = =
			ENGINE SOUNDS
			= = = = = = = = = = = = = = = = = = = = = = = = =

			Loud, large-frequency spectrum sounds can easily damage your hearing.
			Be mindful of how loud you set sounds like this.
			Be mindful of how loud you set your volume in DCS World.
			Take regular breaks to give your ears and your brain a break.

			The engine has two signature tones, with a baseline curve across RPM.
			
			a LOW tone: 
			curve = {0.30, 0.61, 0.85, 1.00, 1.04, 1.09, 1.13},
			
			and a HIGH tone:
			curve = {0.30, 0.61, 0.85, 0.99, 1.10, 1.21, 1.33},
		
			In order to maintain consistency when the pilot opens the canopy, 
			changes to pitch curves should be replicated on the interior sound set, see: 
			/Cockpit/Scripts/Systems/sound_system.lua

			= = = = = = = = = = = = = = = = = = = = = = = = =
		]]

		-- These sounds are organized by aircraft orientation:
		-- The main groups are FRONT, AROUND and REAR.
		-- Each includes a low-operation tone, a high-operation tone, and a distant sound.

		-- FRONT
		-- It's the sound of air being sucked into the turbine.
		-- It has a swirling phasing sound, and a grinding signature tone.
		-- It lacks the lower frequencies present in other engine sounds.
		-- At higher speeds, a dramatic screaming ROAR is heard from a distance.
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_front_lo",
			pitch_curve = Curve({0.30, 0.61, 0.85, 1.00, 1.04, 1.09, 1.13}, 0.01, 1.0),
			gain_curve = Curve({0.00, 3.6, 4.2, 5.8, 5.9, 6.0, 7}, 0.01, 1.0),
		},
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_front_hi",
			pitch_curve = Curve({0.30, 0.61, 0.85, 0.99, 1.10, 1.21, 1.33}, 0.01, 1.0),
			gain_curve = Curve({0.00, 0.60, 2.7, 3.9, 4.2, 5.9, 6}, 0.47, 1.0),
		},
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_TRUE_AIRSPEED,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_far_roar",
			pitch_curve = Curve({0.66, 1.00, 1.33}, 0.01, 1.0),
			gain_curve = Curve({0.00, 0.31, 2.4, 5.9, 6.0, 6.5, 1}, 80.0, 340.0),
		},
		-- AROUND
		-- It's a full spectrum jet engine sound.
		-- It has elements of the front and rear sounds, with the full signatures of neither.
		-- It projects in a sphere, not in a cone, filling in missing frequenies from any direction.
		-- At high RPM, a WHINE is heard from a distance.
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_around_lo",
			pitch_curve = Curve({0.30, 0.61, 0.85, 1.00, 1.05, 1.08, 1.13}, 0.01, 1.0),
			gain_curve = Curve({0.00, 3.6, 4.2, 5.8, 5.9, 6.0, 7}, 0.01, 1.0),
		},
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_around_hi",
			pitch_curve = Curve({0.30, 0.61, 0.85, 0.99, 1.10, 1.21, 1.33}, 0.01, 1.0),
			gain_curve = Curve({0.00, 0.60, 2.7, 3.9, 4.2, 5.9, 6}, 0.43, 1.0),
		},
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_far_whine",
			gain_curve = Curve({0.00, 3.6, 4.2, 5.2, 5.8, 5.9, 6.0}, 0.01, 1.0),
			gain_curve = Curve({0.00, 0.11, 2.82, 6.0, 6.3, 6.6, 7}, 80.0, 340.0),
		},
		-- BACK
		-- It's the sound of air thrust out of the turbine.
		-- It has a loud, low roar.
		-- It lacks the higher frequencies present in other engine sounds.
		-- At higher speeds, a dramatic screaming RIP is heard from a distance.
		{
			sound = nil,
			type_pitch = SOUND_TURBINE_POWER,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_back_lo",
			pitch_curve = Curve({0.30, 0.61, 0.85, 1.00, 1.04, 1.09, 1.13}, 0.01, 1.0),
			gain_curve = Curve({0.00, 3.6, 4.2, 5.8, 5.9, 6.0, 7}, 0.01, 1.0),
		},
		{
			sound = nil,
			type_pitch = SOUND_TURBINE_POWER,
			type_gain = SOUND_FAN_RPM,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_back_hi",
			pitch_curve = Curve({0.30, 0.61, 0.85, 0.99, 1.10, 1.21, 1.33}, 0.01, 1.0),
			gain_curve = Curve({0.00, 0.60, 2.7, 3.9, 4.2, 5.9, 6}, 0.43, 1.0),
		},
		{
			sound = nil,
			type_pitch = SOUND_FAN_RPM,
			type_gain = SOUND_TRUE_AIRSPEED,
			sdef_name = "Aircrafts/Engines/A-4E-C/a-4e_engine_ext_far_rip",
			pitch_curve = Curve({0.66, 1.00, 1.33}, 0.5, 1.0),
			gain_curve = Curve({0.00, 0.11, 2.82, 6.0, 6.3, 6.6, 7}, 80.0, 340.0),
		},

	}



	self:createSounds(number_, host)
end

function engine:createSounds(number_, host)
	self.number = number_

	for i,v in pairs(self.sounds) do
		self.sounds[i].sound = ED_AudioAPI.createSource(host, v.sdef_name)
	end
end

function engine:initCptNames()
	self.engine_l_name  = "Aircrafts/A-4E-C/a4e-debugtest05"
	self.engine_r_name  = "Aircrafts/A-4E-C/a4e-debugtest05"
	self.heAmb_l_name   = "Aircrafts/A-4E-C/a4e-debugtest05"
	self.heAmb_r_name   = "Aircrafts/A-4E-C/a4e-debugtest05"
end

function engine:createSoundsCpt(hostCpt)
	if self.number == 1 then
		if self.engine_l_name ~= nil then
			self.sndCpt = ED_AudioAPI.createSource(hostCpt, self.engine_l_name)
		end
		
		if self.engine_l2_name ~= nil then
			self.sndCpt2 = ED_AudioAPI.createSource(hostCpt, self.engine_l2_name)
		end
		
		if self.heAmb_l_name ~= nil then
			self.sndCptAmb = ED_AudioAPI.createSource(hostCpt, self.heAmb_l_name)
		end
	elseif self.number == 2 then
		if self.engine_r_name ~= nil then
			self.sndCpt = ED_AudioAPI.createSource(hostCpt, self.engine_r_name)
		end
		
		if self.engine_r2_name ~= nil then
			self.sndCpt2 = ED_AudioAPI.createSource(hostCpt, self.engine_r2_name)
		end
		
		if self.heAmb_r_name ~= nil then
			self.sndCptAmb = ED_AudioAPI.createSource(hostCpt, self.heAmb_r_name)
		end
	end
end

function engine:destroySoundsCpt()
	if self.sndCpt ~= nil then
		ED_AudioAPI.destroySource(self.sndCpt)
		self.sndCpt = nil
	end
	
	if self.sndCpt2 ~= nil then
		ED_AudioAPI.destroySource(self.sndCpt2)
		self.sndCpt2 = nil
	end
	
	if self.sndCptAmb ~= nil then
		ED_AudioAPI.destroySource(self.sndCptAmb)
		self.sndCptAmb = nil
	end
end

function engine:DBGstop()
	stopSRC = function(src)
		if src ~= nil then
			if ED_AudioAPI.isSourcePlaying(src) then
				dbgPrint("src: " .. src)
				ED_AudioAPI.stopSource(src)
			end
		end
	end
end

function engine:controlSound(snd, pitch, gain, offsetKey)
	if gain < 0.01 then
		ED_AudioAPI.stopSource(snd)
	elseif gain >= 0.01 then
		dbgPrint("pitch: " .. pitch)
		dbgPrint("gain: " .. gain)
	
		ED_AudioAPI.setSourcePitch(snd, pitch)
		ED_AudioAPI.setSourceGain(snd, gain)
		
		if not ED_AudioAPI.isSourcePlaying(snd) then
			if offsetKey ~= nil then
				if offsets[offsetKey] ~= nil then
					ED_AudioAPI.playSourceLooped(snd, offsets[offsetKey])
					offsets[offsetKey] = offsets[offsetKey] + 0.5
				end
			else
				ED_AudioAPI.playSourceLooped(snd)
			end
		end
	end
end

function engine:update(coreRPM, fanRPM, turbPower, thrust, flame, vTrue)

	sound_param = {
		--[SOUND_CORE_RPM] = coreRPM,
		[SOUND_FAN_RPM] = fanRPM,
		[SOUND_TURBINE_POWER] = turbPower,
		--[SOUND_THRUST] = thrust,
		[SOUND_TRUE_AIRSPEED] = vTrue,
	}

	for i, v in pairs(self.sounds) do
		local param_gain = sound_param[v.type_gain]
		local param_pitch = sound_param[v.type_pitch]
		self:controlSound(v.sound, v.pitch_curve:value(param_pitch), v.gain_curve:value(param_gain), nil)
	end
	
end
