--[[ name your own skin in default language (en)
     you can also name the skin in more than one language,
     replace xx with the appropriate country code, e.g.
     ru, cn, cs, de, es, fr, or it ]]
name = "0 Unmarked"
--name_xx = ""

--[[ assign the countries ]]
countries = {
    "ABH",   --Abkhazia
    "DZA",   --Algeria
    "ARG",   --Argentina
    "AUS",   --Australia
    "AUT",   --Austria
    "BLR",   --Belarus
    "BEL",   --Belgium
    "BGR",   --Bulgaria
    "CAN",   --Canada
    "CUB",   --Cuba
    "CHL",   --Chile
    "CHN",   --China
    "HRV",   --Croatia
    "CZE",   --Czech Republic
    "CYP",   --Cyprus
    "DEN",   --Denmark
    "EGY",   --Egypt
    "FIN",   --Finland
    "FRA",   --France
    "GRG",   --Georgia
    "GER",   --Germany
    "GHN",   --Ghana
    "GRC",   --Greece
    "HND",   --Honduras
    "HUN",   --Hungary
    "IND",   --India
    "IDN",   --Indonesia
    "INS",   --Insurgents
    "IRN",   --Iran
    "IRQ",   --Iraq
    "ISR",   --Israel
    "ITA",   --Italy
    "JOR",   --Jordan
    "JPN",   --Japan
    "KAZ",   --Kazakhstan
    "LBN",   --Lebanon
    "LBY",   --Libya
    "MYS",   --Malaysia
    "MAR",   --Moroccoo
    "MEX",   --Mexico
    "NETH",  --Netherlands
    "PRK",   --North Korea
    "NOR",   --Norway
    "NGA",   --Nigeria
    "OMN",   --Oman
    "PAK",   --Pakistan
    "PER",   --Peru
    "PHL",   --Phllipines
    "POL",   --Poland
    "QAT",   --Qatar
    "ROU",   --Romania
    "RUS",   --Russia
    "SAU",   --Saudi Arabia
    "SRB",   --Serbia
    "SVK",   --Slovakia
    "SVN",   --Slovenia
    "RSA",   --South Africa
    "KOR",   --South Korea
    "RSO",   --South Ossetia
    "SPN",   --Spain
    "SDN",   --Sudan
    "SWE",   --Sweden
    "SUI",   --Switzerland
    "SYR",   --Syria
    "THA",   --Thailand
    "TUN",   --Tunisia
    "TUR",   --Turkey
    "UK",    --UK
    "UKR",   --Ukraine
    "ARE",   --United Arab Emirates
    "UN",    --United Nations Peacekeepers
    "USA",   --USA
    "AUSAF", --USAF Aggressors
    "VEN",   --Venezuela
    "VNM",   --Vietnam
    "YEM"    --Yemen
}

livery = {
  --{"Top", DIFFUSE, "a4e_ext_top", true};
  --{"Top", ROUGHNESS_METALLIC, "a4e_ext_top_RoughMet", true};
  --{"Bottom", DIFFUSE, "a4e_ext_bottom", true};
  --{"Bottom", ROUGHNESS_METALLIC, "a4e_ext_bottom_RoughMet", true};
  --{"Gear and metal", DIFFUSE, "a4e_ext_bottom", true};
  --{"Cockpit", DIFFUSE, "a4e_ext_bottom", true};
  --{"Front", 0, "a4e_ext_front", true};
  --{"cockpitWheelHardpoints", DIFFUSE, "a4e_ext_wheels_bays", true};
  --{"Gear Bay", DIFFUSE, "a4e_ext_wheels_bays", true};
  --{"Pilot", DIFFUSE, "a4e_pilot", true};

  -- flaps, used on most liveries
  {"flaps_001", DIFFUSE, "a4e_bort_white", true};
  {"flaps_010", DIFFUSE, "a4e_bort_white", true};
  {"flaps_100", DIFFUSE, "a4e_bort_white", true};

  -- three digit, smaller nose numbers, used on most liveries
  {"nose_001", DIFFUSE, "a4e_bort_black", true};
  {"nose_010", DIFFUSE, "a4e_bort_black", true};
  {"nose_100", DIFFUSE, "a4e_bort_black", true};

  -- two digit top-of-tail, used on most USMC liveries
  {"tail_aggressor_001", DIFFUSE, "empty", true};
  {"tail_aggressor_010", DIFFUSE, "empty", true};

  -- three digit top-of-rudder, used on most USN liveries
  {"rudder_001", DIFFUSE, "a4e_bort_black", true};
  {"rudder_010", DIFFUSE, "a4e_bort_black", true};
  {"rudder_100", DIFFUSE, "a4e_bort_black", true};

  -- wing bort used on most USN liveries
  {"wing_001", DIFFUSE, "a4e_bort_black", true};
  {"wing_010", DIFFUSE, "a4e_bort_black", true};
  {"wing_100", DIFFUSE, "a4e_bort_black", true};

  -- 2-digit large nose numbers, used on USN/USMC aggressors
  {"nose_aggressor_001", DIFFUSE, "empty", true};
  {"nose_aggressor_010", DIFFUSE, "empty", true};

  -- 3-digit large tail numbers, used on some USN/USMC aggressors
  {"tail_001", DIFFUSE, "empty", true};
  {"tail_010", DIFFUSE, "empty", true};
  {"tail_100", DIFFUSE, "empty", true};

  -- custom fuel tanks: 150 gallon
  --{"fuel_150_a4e", DIFFUSE, "uvmapsfueltank_dft150_dft300", true};

  -- custom fuel tank: 300 gallon left/right
  --{"fuel_300lr_a4e", DIFFUSE, "uvmapsfueltank_dft150_dft300", true};

  -- custom fuel tank: 300 gallon center
  --{"fuel_300c_a4e", DIFFUSE, "uvmapsfueltank_dft150_dft300", true};

  -- custom fuel tank: 400 gallon
  --{"fuel_400_a4e", DIFFUSE, "uvmapsfueltank_dft400", true};

  -- custom lau-10 rocket launcher
  --{"LAU_10", DIFFUSE, "a4e_lau10_1967", true};
	--{"LAU_10", ROUGHNESS_METALLIC, "a4e_lau10_1967_RoughMet", true};

}
