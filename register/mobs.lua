
--- Mobs Redo
--
--  Registration with Mobs Redo mob library.
--
--  @topic mobs


local register = function(def)
	local new_def = {
		nametag = def.nametag,
		type = "monster",
		hp_min = def.hp_min,
		hp_max = def.hp_max,
		passive = not def.hostile,
		walk_velocity = def.speed.walk,
		run_velocity = def.speed.run,
		stand_chance = def.mode_chance.idle * 100,
		walk_chance = def.mode_chance.walk * 100,
		jump = type(def.stepheight) == "number" and def.stepheight > 0,
		jump_height = def.stepheight,
		stepheight = def.stepheight,
		view_range = def.search.radius,
		damage = def.combat.damage,
		knock_back = def.knockback,
		floats = def.floats,
		reach = def.combat.radius,
		attack_chance = def.combat.chance,
		attack_players = def.search.target == "player",
		attack_type = "dogfight",
		blood_amount = 0,
		makes_footstep_sound = not def.sneaky,
		sounds = {
			distance = def.sounds.distance,
			random = def.sounds.random,
			war_cry = def.sounds.war_cry,
			attack = def.sounds.war_cry,
			damage = def.sounds.damage,
			death = def.sounds.death,
			jump = def.sounds.jump,
		},
		drops = {},
		visual = "mesh",
		collisionbox = def.collisionbox,
		textures = def.textures,
		mesh = def.mesh,
		animation = {
			stand_start = def.animation.idle.start,
			stand_end = def.animation.idle.stop,
			stand_speed = def.animation.idle.speed,
			walk_start = def.animation.walk.start,
			walk_end = def.animation.walk.stop,
			walk_speed = def.animation.walk.speed,
			run_start = def.animation.run.start,
			run_end = def.animation.run.stop,
			run_speed = def.animation.run.speed,
			punch_start = def.animation.attack.start,
			punch_end = def.animation.attack.stop,
			punch_speed = def.animation.attack.speed,
			die_start = def.animation.death.start,
			die_end = def.animation.death.stop,
			die_speed = def.animation.death.speed,
			die_loop = def.animation.death.loop,
			die_rotate = def.animation.death.rotate,
		},
	}

	for _, drop in ipairs(def.drops) do
		table.insert(new_def.drops, {name=drop.name, min=drop.min, max=drop.max, chance=1/drop.chance})
	end

	mobs:register_mob(def.name, new_def)

	mobs:spawn({
		name = def.name,
		nodes = def.spawn.nodes,
		interval = def.spawn.interval,
		chance = def.spawn.chance,
		min_light = def.spawn.light_range.min,
		max_light = def.spawn.light_range.max,
		min_height = def.spawn.height_range.min,
		max_height = def.spawn.height_range.max,
		active_object_count = def.spawn.count.max,
	})
end

return register
