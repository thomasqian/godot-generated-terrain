extends Camera

var speed = 50
var rotate_speed = 0.02

var rot_x = 0
var rot_y = 0

func _input(event):
    if event is InputEventMouseMotion and event.button_mask & 1:
        # modify accumulated mouse rotation
        rot_x += -event.relative.x * rotate_speed
        rot_y += -event.relative.y * rotate_speed
        transform.basis = Basis() # reset rotation
        rotate_object_local(Vector3(0, 1, 0), rot_x) # first rotate in Y
        rotate_object_local(Vector3(1, 0, 0), rot_y) # then rotate in X


func _process(delta):
  var dir = Vector3()
  if Input.is_action_pressed('move_forward'):
    dir -= get_global_transform().basis[2]
  if Input.is_action_pressed('move_backward'):
    dir += get_global_transform().basis[2]
  if Input.is_action_pressed('move_left'):
    dir -= get_global_transform().basis[0]
  if Input.is_action_pressed('move_right'):
    dir += get_global_transform().basis[0]

  transform.origin += dir.normalized() * delta * speed

  if Input.is_action_pressed("move_up"):
    transform.origin.y += delta * speed
  if Input.is_action_pressed("move_down"):
    transform.origin.y -= delta * speed
