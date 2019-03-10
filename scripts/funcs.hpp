class Replacer{
	tag="replacer";
	class functions{
		file = "scripts\replacer";
		class opfor{};
		class civilian{};
		class validate{};
	};
};
class Ai{
	tag="ai";
	class functions{
		file = "scripts\ai";
		class suppressEH{};
		class taskSuppress{};
		class taskHunt{};
		class taskAssault{};
	};
};
class Spawner{
	tag="spawner";
	class functions{
		file="scripts\spawner";
		class spawnGroup{};
		class spawnHunter{};
		class patrol{};
		class setPatrolWPs{};
		class spawnPatrol{};
		class spawnJet{};
		class isSpawner{};
		class spawnQrf{};
	};
};
class Misc{
	tag="misc";
	class functions{
		file="scripts\misc";
		class cough{};
		class replaceSuppContents{};
		class jipChooseTarget {};
		class jipEmptySeat {};
		class respawnVic {};
	};
};