
local S = core.get_translator(cmer_skeleton.modname)


local zombie_model = nil
local zombie_sounds = {}
local anim_walk = {start=102, stop=122, speed=15.5}
local anim_attack = {start=102, stop=122, speed=25}

if core.get_modpath("cmer_zombie") or core.get_modpath("zombie") then
	zombie_model = "creatures_zombie.b3d"
	zombie_sounds.on_death = {name="creatures_zombie_death", gain=0.7, distance=10}
end

-- use player model if zombie not installed
if not zombie_model then
	if not core.get_modpath("player_api") then
		error("Compatible model not found (requires one of the following mods: \"cmer_zombie\", \"zombie\", \"player_api\")")
	end

	zombie_model = "character.b3d"
	-- I don't know what the correct animations for default player model are
	--anim_walk = {start=102, stop=122, speed=15.5}
	--anim_attack = {start=102, stop=122, speed=25}

	cmer_skeleton.log("warning", "using \"" .. zombie_model .. "\" model, may not look right")
end


local mob_name = "creatures:skeleton"

local base_def = {
	name = mob_name,
	nametag = S("Skeleton"),
	hp_min = 55,
	hp_max = 55,
	hostile = true,
	knockback = true,
	sneaky = false,
	floats = true,
	stepheight = 1,
	collisionbox = {-0.25, -0.01, -0.25, 0.25, 1.65, 0.25},
	rotation = -90.0,
	mesh = zombie_model,
	textures = {"cmer_skeleton_mesh.png"},
	drops = {
		--{"creatures:bone", 1, chance=1},
		{name="creatures:bone", min=1, max=1, chance=1},
	},
	spawn = {
		interval = cmer_skeleton.spawn_interval,
		chance = cmer_skeleton.spawn_chance,
		nodes = {
			"group:sand",
			"group:stone",
			"nether:rack",
			"nether:rack_deep",
		},
		light_range = {min=0, max=8},
		height_range = {min=-31000, max=31000},
		count = {min=1, max=2},
	},
	combat = {
		radius = 2.0,
		damage = 13,
		chance = 100,
	},
	speed = {
		walk = 1,
		run = 3,
	},
	search = {
		radius = 20,
		target = "player",
	},
	mode_chance = {
		idle = 0.3,
		walk = 0.7,
	},
	sounds = {
		random = "cmer_skeleton_bones",
		death = zombie_sounds.on_death,
		war_cry = nil,
		attack = nil,
		damage = nil,
	},
	animation = {
		idle = {start=0, stop=80, speed=15},
		walk = anim_walk,
		run = {},
		attack = anim_attack,
		death = {start=81, stop=101, speed=28, loop=false, rotate=false, duration=2.12},
	},
}

dofile(cmer_skeleton.modpath .. "/register/" .. cmer_skeleton.lib .. ".lua")(base_def)


if core.global_exists("asm") then
	asm.addEgg({
		name = "skeleton",
		title = S("Skeleton"),
		inventory_image = "cmer_skeleton_inv.png",
		spawn = mob_name,
		ingredients = "creatures:bone",
	})
end
if not core.registered_items["creatures:skeleton"] then
	core.register_alias("creatures:skeleton", "spawneggs:skeleton")
end


core.register_craftitem(":creatures:bone", {
	description = S("Bone"),
	inventory_image = "cmer_skeleton_bone.png",
	stack_max = 99,
})
if not core.registered_items["cmer:bone"] then
	core.register_alias("cmer:bone", "creatures:bone")
end
