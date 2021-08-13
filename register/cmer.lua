
--- Creatures Revived
--
--  Registration with Creatures Revived mob library.
--
--  @topic cmer


local register = function(def)
	local new_def = {
		name = def.name,
		nametag = creatures.feature_nametags and def.nametag or nil,
		stats = {
			hp = def.hp_max,
			hostile = def.hostile,
			lifetime = skeleton.lifetime,
			can_jump = def.stepheight,
			can_swim = def.floats,
			has_knockback = def.knockback,
			sneaky = def.sneaky,
		},
		modes = {
			idle = {chance=def.mode_chance.idle,},
			walk = {chance=def.mode_chance.walk, moving_speed=def.speed.walk,},
			attack = {moving_speed=def.speed.run,},
		},
		model = {
			mesh = def.mesh,
			textures = def.textures,
			collisionbox = def.collisionbox,
			rotation = def.rotation,
			animations = {
				idle = def.animation.idle,
				walk = def.animation.walk,
				attack = def.animation.attack,
				death = def.animation.death,
			},
		},
		sounds = {
			on_death = def.sounds.death,
			random = {
				idle = {name=def.sounds.random, gain=1.0,},
				walk = {name=def.sounds.random, gain=1.0,},
				attack = {name=def.sounds.random, gain=1.0,},
			},
		},
		drops = {},
		combat = {
			attack_damage = def.combat.damage,
			attack_radius = def.combat.radius,
			search_enemy = true,
			search_type = def.search.target,
			search_radius = def.search.radius,
		},
		spawning = {
			abm_nodes = {
				spawn_on = def.spawn.nodes,
			},
			abm_interval = def.spawn.interval,
			abm_chance = def.spawn.chance,
			max_number = 1,
			number = def.spawn.count,
			time_range = {min=0, max=23999},
			light = def.spawn.light_range,
			height_limit = def.spawn.height_range,
		},
	}

	for _, drop in ipairs(def.drops) do
		table.insert(new_def.drops, {drop.name, {min=drop.min, max=drop.max}, chance=drop.chance})
	end

	creatures.register_mob(new_def)
end

return register
