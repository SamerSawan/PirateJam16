extends Node

#region Teams

## Group relations
const teams_resource : TeamsResource = preload("res://resources/teams/GlobalTeams.tres")
const Teams = teams_resource.teams

## Filter and return all team names that are in the nodes groups
func get_teams_of_node(node: Node2D) -> Array[TeamResource]:
	var node_groups = node.get_groups()
	return Teams.filter(func(t): t.name in node_groups)

## Returns the first (front) team of a node
func get_first_team_of_node(node: Node2D) -> TeamResource:
	return get_teams_of_node(node).front()

## Sets nodes team safely
func set_team_of_node(node: Node2D, team: TeamResource) -> void:
	if team in Teams:
		node.add_to_group(team.name)

## Removes the first occurrence of team_name
func remove_team_of_node(node: Node2D, team: TeamResource) -> void:
	if node.is_in_group(team.name):
		node.remove_from_group(team.name)

## Removes all existing teams from node
func reset_teams_of_node(node: Node2D) -> void:
	var teams_of_node : Array[TeamResource] = get_teams_of_node(node)
	node.get_groups().all(
		func(grp):
			if grp in teams_of_node:
				node.remove_from_group(grp)
	)

## Returns an array of teams that consider the given team hostile
func get_teams_hostile_to_team(team: TeamResource) -> Array[TeamResource]:
	return Teams.filter( ## filter all other_team that have team as hostile
		func(other_team):
			return team in other_team.hostile
	)
## Returns an array of teams that consider the given team friendly
func get_teams_friendly_to_team(team: TeamResource) -> Array[TeamResource]:
	return Teams.filter( ## filter all other_team that have team as friendly
		func(other_team):
			return team in other_team.friendly
	)

## Checks if the user is hostile to the given node
func is_user_hostile_to_node(user: Node2D, node: Node2D) -> bool:
	if user == node: ## If user is the node then we shouldnt do anything
		return false
	var user_team: TeamResource = get_first_team_of_node(user)
	var node_teams: Array[TeamResource] = get_teams_of_node(node)
	if user_team:
		for t in node_teams:
			if t in user_team.hostile:
				return true
	return false
## Checks if the user is friendly to the given node
func is_user_friendly_to_node(user: Node2D, node: Node2D) -> bool:
	if user == node: ## If user is the node then we shouldnt do anything
		return false
	var user_team: TeamResource = get_first_team_of_node(user)
	var node_teams: Array[TeamResource] = get_teams_of_node(node)
	if user_team:
		for t in node_teams:
			if t in user_team.friendly:
				return true
	return false

#endregion
