extends Node2D

var current_zone: Area2D = null

func _ready() -> void:
	$Player.interacted.connect(_on_player_interacted)
	$ActivityZone1.player_entered_zone.connect(_on_zone_entered)
	$ActivityZone1.player_exited_zone.connect(_on_zone_exited)
	$ActivityZone2.player_entered_zone.connect(_on_zone_entered)
	$ActivityZone2.player_exited_zone.connect(_on_zone_exited)

func _on_player_interacted() -> void:
	if current_zone != null and not $UILayer/PopupPanel.visible:
		$UILayer/PopupPanel.show()

func _on_zone_entered(zone: Area2D) -> void:
	current_zone = zone

func _on_zone_exited(zone: Area2D) -> void:
	if current_zone == zone:
		current_zone = null

func _on_yes_pressed() -> void:
	$UILayer/PopupPanel.hide()

func _on_no_pressed() -> void:
	$UILayer/PopupPanel.hide()
