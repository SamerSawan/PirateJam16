extends Node

#region Teams

## Group relations
var Teams : TeamsLoader = TeamsLoader.new()

## Filter and return all team names that are in the node's groups
func get_teams_of_node(node: Node2D) -> Array[StringName]:
	var node_groups = node.get_groups()
	var map = Teams.map(func(t): t.name)
	return node_groups.filter(func(grp): grp in map)

## Returns the first (front) team name of a node
func get_first_team_of_node(node: Node2D) -> StringName:
	return get_teams_of_node(node).front()

## Sets a node's team safely
func set_team_of_node(node: Node2D, team_name: StringName) -> void:
	if Teams.any(func(t): t.name == team_name):
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
	return Teams.filter(
		func(other_team):
			return team_name in other_team.hostile
	).map(func(t): t.name)

## Returns an array of teams that consider the given team name friendly
func get_teams_friendly_to_team(team_name: StringName) -> Array[StringName]:
	return Teams.filter(
		func(other_team):
			return team_name in other_team.friendly
	).map(func(t): t.name)

## Checks if the user is hostile to the given node
func is_user_hostile_to_node(user: Node2D, node: Node2D) -> bool:
	if user == node: ## If the user is the node, we shouldn't do anything
		return false
	var user_team: StringName = get_first_team_of_node(user)
	var node_teams: Array[StringName] = get_teams_of_node(node)
	if user_team:
		for t in node_teams:
			var team = Teams.find(func(te): te.name == t)
			if team and user_team in team.hostile:
				return true
	return false

## Checks if the user is friendly to the given node
func is_user_friendly_to_node(user: Node2D, node: Node2D) -> bool:
	if user == node: ## If the user is the node, we shouldn't do anything
		return false
	var user_team: StringName = get_first_team_of_node(user)
	var node_teams: Array[StringName] = get_teams_of_node(node)
	if user_team:
		for t in node_teams:
			var team = Teams.find(func(te): te.name == t)
			if team and user_team in team.friendly:
				return true
	return false

#endregion
