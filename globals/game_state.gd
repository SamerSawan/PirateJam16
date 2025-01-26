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

## Sets nodes team safely
func set_team_of_node(node : Node2D, team_name : StringName) -> void:
	if team_name in Teams:
		node.add_to_group(team_name)

## Removes first occurance of team_name
func remove_team_of_node(node : Node2D, team_name : StringName) -> void:
	if team_name in Teams:
		node.remove_from_group(team_name)

## Removes all existing teams from node
func reset_teams_of_node(node : Node2D):
	node.get_groups().all(
		func(group_name):
			remove_team_of_node(node, group_name)
	)

## Returns all teams of node
func get_teams_of_node(node : Node2D) -> Dictionary:
	var teams : Dictionary = {}
	node.get_groups().all(
		func(group):
			if group in Teams: # if node has a team
				teams[group] = Teams[group]
	)
	return teams

## Returns first team of node
func get_first_team_of_node(node : Node2D) -> Dictionary:
	var teams : Dictionary = get_teams_of_node(node)
	
	if teams and not teams.keys().is_empty():
		var front = teams.keys().front()
		var team : Dictionary = {front: Teams[front]}
		#print("Team: " + str(team))
		return team
	return {}

## Returns either dict or null containing the factions hostile teams
func get_hostile_to_team(team : Dictionary) -> Dictionary:
	var hostiles = team[team.keys().front()]["Hostile"]
	#print("Hostiles: " + str(hostiles))
	if hostiles:
		return hostiles
	else:
		return {}

## Returns either dict or null containing the factions friendly teams
func get_friendly_to_team(team : Dictionary) -> Dictionary:
	var friendlies = team[team.keys().front()]["Friendly"]
	#print("Friendlies: " + str(friendlies))
	if friendlies:
		return friendlies
	else:
		return {}

## Is user hostile to node
func is_user_hostile_to_node(user : Node2D, node : Node2D):
	if !(user == node):
		var user_team : Dictionary = GameState.get_first_team_of_node(user)
		var hostiles : Dictionary = GameState.get_hostile_to_team(user_team)
		var node_teams : Dictionary = GameState.get_first_team_of_node(node)
		for node_team in node_teams:
			if node_team in hostiles:
				#print("is hostile")
				return true
		#print("is not hostile")
	return false

## Is user friendly to node
func is_user_friendly_to_node(user : Node2D, node : Node2D):
	var user_team = GameState.get_first_team_of_node(user)
	var friendlies = GameState.get_friendly_to_team(user_team)
	var node_team = GameState.get_first_team_of_node(node)
	if node_team in friendlies:
		return true
	return false
#endregion
