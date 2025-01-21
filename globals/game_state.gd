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
				team = Teams[group_name]
	)
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

## Returns either dict or null containing hostile teams
func get_hostile_to_team(team : Dictionary) -> Dictionary:
	if team in Teams:
		return Teams[team]["Hostile"]
	return {}

## Returns either dict or null containing friendly teams
func get_friendly_to_team(team : Dictionary) -> Dictionary:
	if team in Teams:
		return Teams[team]["Friendly"]
	return {}

#endregion
