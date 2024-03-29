//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

//? damage types

// todo: refactor damage types

//? damage_mode bitfield

#define DAMAGE_MODE_SHARP (1<<0)      //! sharp weapons like knives, spears, etc
#define DAMAGE_MODE_EDGE (1<<1)       //! weapons with an edge, like knives, being used as such. without this, sharp = pierce
#define DAMAGE_MODE_ABLATING (1<<2)   //! pulse lasers, etc, basically blows a crater
#define DAMAGE_MODE_PIERCE (1<<3)     //! specifically highly-piercing weapons like bullets, even worse than sharp.
#define DAMAGE_MODE_SHRED (1<<4)      //! messy, shredded wounds instead of a clean cut / pierce. strong.
#define DAMAGE_MODE_GRADUAL (1<<5)    //! disallow bone breaks, ablation, etc; used for gradual sources like depressurization
#define DAMAGE_MODE_INTERNAL (1<<6)   //! coming from internal; used to flag that something isn't coming through the skin. certain defenses don't work if this is set.
#define DAMAGE_MODE_REDIRECT (1<<7)   //! if zone doesn't exist / etc, allow redirection
#define DAMAGE_MODE_NO_OVERFLOW (1<<8)//! temporary - re-evaluate when health is reworked. prevents damage from overflowing caps.
