extends Node

#region Teams

## Group relations
var Teams : TeamsLoader = preload("res://resources/teams/TeamsLoader.tscn").instantiate()
var team_names = Teams.teams.map(func(t): return t.name)

func _ready() -> void:
	get_tree().root.add_child.call_deferred(Teams)

## Filter and return all team names that are in the node's groups
func get_teams_of_node(node: Node2D) -> Array[StringName]:
	var node_groups = node.get_groups()
	#print("Node groups: " + str(node_groups))
	
	var teams : Array[StringName] = []
	teams.append_array( node_groups.filter( func(grp): return grp in team_names ) ) 
	#print("Teams of " + str(node) + " : " + str(teams))
	return teams

## Returns the first (front) team name of a node
func get_first_team_of_node(node: Node2D) -> StringName:
	var teams = get_teams_of_node(node)
	#print("teams of node: " + str(teams))
	if teams:
		var filtered_teams = teams.front()
		if filtered_teams:
			return filtered_teams
	return ""

## Sets a node's team safely
func set_team_of_node(node: Node2D, team_name: StringName) -> void:
	if Teams.teams.any(func(t): t.name == team_name):
		node.add_to_group(team_name)

## Removes the first occurrence of a team name
func remove_team_of_node(node: Node2D, team_name: StringName) -> void:
	if node.is_in_group(team_name):
		node.remove_from_group(team_name)

## Removes all existing teams from a node
func reset_teams_of_node(node: Node2D) -> void:
	var teams_of_node: Array[StringName] = get_teams_of_node(node)
	node.get_groups().all(
		func(grp):
			if grp in teams_of_node:
				node.remove_from_group(grp)
	)

## Returns an array of teams that consider the given team name hostile
func get_teams_hostile_to_team(team_name: StringName) -> Array[StringName]:
	var teams = []
	teams.append_array(
		Teams.teams.filter(
			func(other_team): 
				return team_name in other_team.hostile)
				.map(
					func(t): t.name
				)
	)
	return teams

## Returns an array of teams that consider the given team name friendly
func get_teams_friendly_to_team(team_name: StringName) -> Array[StringName]:
	var teams = []
	teams.append_array(
		Teams.teams.filter(
			func(other_team):
				return team_name in other_team.friendly)
				.map(
					func(t): t.name
				)
	) 
	return teams

## Checks if the user is hostile to the given node
func is_user_hostile_to_node(user: Node2D, node: Node2D) -> bool:
	if user == node: ## If the user is the node, we shouldn't do anything
		return false
	var user_team : StringName = get_first_team_of_node(user)
	var node_team : StringName = get_first_team_of_node(node)
	# if user_team.hostiles contains node_team
	if user_team and node_team:
		var team_resource : TeamResource = Teams.team_name_to_team_resource[user_team]
		var is_hostile = team_resource.hostile.has(node_team)
		#if is_hostile:
			#print("User is hostile to node")
		#else:
			#print("User is not hostile to node")
		return is_hostile
	return false

## Checks if the user is friendly to the given node
func is_user_friendly_to_node(user: Node2D, node: Node2D) -> bool:
	if user == node: ## If the user is the node, we shouldn't do anything
		return false
	var user_team: StringName = get_first_team_of_node(user)
	var node_team: StringName = get_first_team_of_node(node)
	# if user_team.hostiles contains node_team
	if user_team and node_team:
		return Teams.team_name_to_team_resource[user_team].friendly.has(node_team)
	return false

#endregion
