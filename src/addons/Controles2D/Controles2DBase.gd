extends Node2D
class_name BaseControle2D

# Classe base do componente de movimentação 2D

#Sinais
signal corrida_iniciada
signal corrida_finalizada

#Variavel de ativação do componente
export var ativo = true

#Propriedades de controle
export var controle_up = "up"
export var controle_down = "down"
export var controle_left = "left"
export var controle_right = "right"
export var controle_pulo = "jump"
export var controle_correr = "sprint"
export var controle_click = "click"

#Propriedades de velocidade
export var velocidade_andar = 300.0
export var velocidade_correr = 600.0
export var aceleracao = 50.0
export var desaceleracao = 50.0

#Referencia do grupo de sprites para ter a direção invertida
export var referencia_sprites = "sprites"

#Se utiliza move_and_slide ou move_and_collide
export(int, "Move And Slide", "Move And Collide") var tipo_movimento = 0

#Váriaveis internas
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var correndo = false
var direcao_atual = 1
var velocidade : Vector2 = Vector2.ZERO
var grupo_sprites : Node2D

#Captura o parent que deve ser do tipo KinematicBody2D
onready var parent = get_parent() as KinematicBody2D

func _ready():
	grupo_sprites = parent.get_node(referencia_sprites)

func move():
	if(ativo):
		if tipo_movimento == 0:
			parent.move_and_slide(velocidade, Vector2.UP)
		else:
			parent.move_and_collide(velocidade)
