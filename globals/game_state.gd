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

## Return dict of teams that a node has
func get_teams_of_node(node : Node) -> Dictionary:
	var teams = {}
	node.get_groups().all(
		func(group_name : StringName):
			if group_name in Teams: # if node has a team
				teams[group_name] = Teams[group_name]
	)
	return teams

## Hash nodes groups and returns an array of the names of which teams it is in
func get_team_names_of_node(node : Node) -> Array[StringName]:
	const team_names = []
	node.get_groups().all(
		func(group_name : StringName):
			if group_name in Teams:
				team_names.append(group_name) #pass by ref
	)
	return team_names

## Returns either dict or null containing hostile teams
func get_hostile_to_team(team : StringName) -> Dictionary:
	if team in Teams:
		return Teams[team]["Hostile"]
	return {}

## Returns either dict or null containing friendly teams
func get_friendly_to_team(team : StringName) -> Dictionary:
	if team in Teams:
		return Teams[team]["Friendly"]
	return {}

#endregion
