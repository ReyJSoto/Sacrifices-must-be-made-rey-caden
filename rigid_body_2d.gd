extends RigidBody2D

@export var throw_force: float = 1000.0
@onready var label: Label = $"../Player/Camera2D/Label"

func throw_in_direction(direction: Vector2) -> void:
	linear_velocity = direction.normalized() * throw_force



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("ball"):
		label.visible = true
		print('ball is in me')
	print("area is in me")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		label.visible = true
		print('ball is in me')
	print("area is in me")
