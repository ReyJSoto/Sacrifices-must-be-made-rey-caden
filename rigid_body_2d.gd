extends RigidBody2D

@export var throw_force: float = 1000.0

func throw_in_direction(direction: Vector2) -> void:
	linear_velocity = direction.normalized() * throw_force
