extends Area2D

signal player_entered_zone(zone: Area2D)
signal player_exited_zone(zone: Area2D)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered_zone.emit(self)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_exited_zone.emit(self)
