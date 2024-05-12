extends KinematicBody2D
class_name Jogador

onready var particulas_correr = $ParticulasCorrer
onready var particulas_pulo1 = $ParticulasPulo1
onready var particulas_pulo2 = $ParticulasPulo2
onready var controle_side_scroling_2d = $ControleSideScroling2D
onready var controle_top_down_2d = $ControleTopDown2D
onready var sprites = $sprites
onready var opcoes_top_down = $ControleTopDown2D/OpcoesTopDown
onready var opcoes_side_scrolling = $ControleSideScroling2D/OpcoesSideScrolling
onready var controle_pulo_2d = $ControlePulo2D
onready var opcoes_pulo = $ControlePulo2D/OpcoesPulo

func _on_OptionModo_item_selected(index):
	var topDown = index == 1	
	controle_side_scroling_2d.ativo = not topDown
	controle_pulo_2d.ativo = not topDown
	controle_top_down_2d.ativo = topDown
	if not topDown:
		rotation = 0;
		sprites.rotation = deg2rad(0);
		opcoes_top_down.visible = false
		opcoes_side_scrolling.visible = true
		opcoes_pulo.visible = true
	else:
		sprites.scale.x = 1
		sprites.rotation = deg2rad(90);
		opcoes_top_down.visible = true
		opcoes_side_scrolling.visible = false
		opcoes_pulo.visible = false

func _on_ControleSideScroling2D_chao_atingido():
	particulas_pulo1.emitting = true
	particulas_pulo2.emitting = true


func _on_ControleSideScroling2D_corrida_iniciada():
	particulas_correr.emitting = true


func _on_ControleSideScroling2D_corrida_finalizada():
	particulas_correr.emitting = false
	particulas_correr.emitting = false


func _on_ControleTopDown2D_corrida_iniciada():
	particulas_correr.emitting = true


func _on_ControleTopDown2D_corrida_finalizada():
	particulas_correr.emitting = false

