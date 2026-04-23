extends CharacterBody2D

const SPEED = 200.0

signal interacted

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO
	if Input.is_key_pressed(KEY_D):
		direction.x += 1.0
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1.0
	if Input.is_key_pressed(KEY_S):
		direction.y += 1.0
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1.0
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_ENTER:
		interacted.emit()
