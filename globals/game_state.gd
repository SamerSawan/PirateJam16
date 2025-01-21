extends Node

#region Teams
## Group relations
const Teams : Dictionary = {
	"Parasite": {
		"Hostile": {"Human": true},
		"Friendly": {},
	},
	"Human": {
		"Hostile": {"Parasite": true, "Goblin": true},
		"Friendly": {},
	},
	"Goblin": {
		"Hostile": {"Parasite": true, "Human": true},
		"Friendly": {},
	}
}

## Removes all existing teams from node
func reset_teams_of_node(node : Node, teams_to_exclude : Array[StringName] = [] ):
	node.get_groups().all(
		func(group_name):
			if group_name in Teams:
				node.remove_from_group(group_name)
	)

## Sets nodes team safely
func set_team_of_node(node : Node, team_name : StringName):
	if team_name in Teams:
		node.add_to_group(team_name)

func get_first_team_of_node(node : Node) -> Dictionary:
	var team = {}
	node.get_groups().any(
		func(group_name : StringName):
			if group_name in Teams: # if node has a team
				team[group_name] = Teams[group_name]
	)
	#print("\n")
	#print("First team of %s: " % node.name)
	#print("Team: %s" % str(team))
	#print("Node: %s" % str(node))
	#print("\n")
	
	return team

## Return dict of teams that a node has
func get_teams_of_node(node : Node) -> Dictionary:
	var teams = {}
	node.get_groups().all(
		func(group_name : StringName):
			if group_name in Teams: # if node has a team
				teams[group_name] = Teams[group_name]
	)
	return teams

## Returns either dict or null containing the factions hostile teams
func get_hostile_to_team(team_name : StringName) -> Dictionary:
	var hostiles = Teams[team_name]["Hostile"]
	if hostiles:
		return hostiles
	else:
		return {}

## Returns either dict or null containing the factions friendly teams
func get_friendly_to_team(team_name : StringName) -> Dictionary:
	var friendlies = Teams[team_name]["Friendly"]
	if friendlies:
		return friendlies
	else:
		return {}
#endregion
