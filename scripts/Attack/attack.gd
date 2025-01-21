extends Node2D
class_name Attack

signal trigger ## use trigger to send whatever data you need for the attack, direction, etc.

@export var user : Creature
@export var attack_range : AttackRange # Holds an area that defines where attack can be triggered
