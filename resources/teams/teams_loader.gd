extends Node
class_name TeamsLoader

@export var teams : Array[TeamResource]
var team_name_to_team_resource = {}

func _ready() -> void:
	for team in teams:
		team_name_to_team_resource[team.name] = team
	print("Global Teams to Names: " + str(team_name_to_team_resource))
