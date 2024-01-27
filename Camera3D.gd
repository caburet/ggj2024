extends Camera3D


# La referencia al nodo del jugador
var player 

# Propiedad para ajustar la distancia de la cámara al jugador
var distance = Vector3(0, 5, 4)

func _ready():
	# Buscar el nodo del jugador al inicio
	player = $"../Player" # Ajusta la ruta al nodo del jugador en tu escena

func _process(delta):
	if player:
		# Obtener la posición del jugador y agregar la distancia
		var target_position = player.global_transform.origin + distance
		target_position.y = 5
		
		# Utilizar el método look_at para que la cámara apunte hacia el jugador
		look_at(player.global_transform.origin, Vector3.UP)
		
		# Establecer la posición de la cámara igual a la posición del jugador más la distancia
		transform.origin = target_position
