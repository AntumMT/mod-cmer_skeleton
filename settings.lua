
--- Entity lifespan.
--
--  @setting skeleton.lifetime
--  @settype int
--  @default 300
cmer_skeleton.lifetime = tonumber(core.settings:get("skeleton.lifetime")) or 300

--- Spawn rate frequency.
--
--
--  @setting skeleton.spawn_interval
--  @settype int
--  @default 600 (10 minutes)
--  @see [ABM definition](http://minetest.gitlab.io/minetest/definition-tables.html#abm-activeblockmodifier-definition)
cmer_skeleton.spawn_interval = tonumber(core.settings:get("skeleton.spawn_interval")) or 10 * 60

--- Chance of spawn at interval.
--
--  @setting skeleton.spawn_chance
--  @settype int
--  @default 9000
--  @see [ABM definition](http://minetest.gitlab.io/minetest/definition-tables.html#abm-activeblockmodifier-definition)
cmer_skeleton.spawn_chance = tonumber(core.settings:get("skeleton.spawn_chance")) or 9000
