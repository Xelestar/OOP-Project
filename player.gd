extends CharacterBody2D

@export var speed = 400
@export var push_force = 200.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			var rigid_body = collision.get_collider()
			rigid_body.apply_central_force(velocity.normalized() * push_force)
