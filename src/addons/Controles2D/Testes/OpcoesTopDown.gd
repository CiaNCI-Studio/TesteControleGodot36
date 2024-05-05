extends CanvasLayer

onready var parent = get_parent() as ControleTopDown2D
onready var velocidadeSlider = $Control/VBoxContainer/HBoxContainer3/Velocidade
onready var aceleracaoSlider = $Control/VBoxContainer/HBoxContainer4/Aceleracao
onready var desaceleracaoSlider = $Control/VBoxContainer/HBoxContainer5/Desaceleracao
onready var rotacaoSlider = $Control/VBoxContainer/HBoxContainer6/Rotacao
onready var trava_rotacao = $Control/VBoxContainer/HBoxContainer7/TravaRotacao
onready var label_velocidade = $Control/VBoxContainer/HBoxContainer3/LabelVelocidade
onready var label_aceleracao = $Control/VBoxContainer/HBoxContainer4/LabelAceleracao
onready var label_desaceleracao = $Control/VBoxContainer/HBoxContainer5/LabelDesaceleracao
onready var label_rotacao = $Control/VBoxContainer/HBoxContainer6/LabelRotacao


func _ready():
	velocidadeSlider.value = parent.velocidade_andar
	label_velocidade.text = str(parent.velocidade_andar)
	aceleracaoSlider.value = parent.aceleracao
	label_aceleracao.text = str(parent.aceleracao)
	desaceleracaoSlider.value = parent.desaceleracao
	label_desaceleracao.text = str(parent.desaceleracao)
	rotacaoSlider.value = parent.velocidade_rotacao
	label_rotacao.text = str(parent.velocidade_rotacao)
	trava_rotacao.pressed = parent.rotacao_travada_no_mouse

func _on_OptionModo_item_selected(index):
	parent.tipo_movimento = index	

func _on_OptionTipo_item_selected(index):
	parent.modo_de_controle = index	

func _on_Rotacao_drag_ended(value_changed):
	if value_changed:
		parent.velocidade_rotacao = rotacaoSlider.value

func _on_TravaRotacao_toggled(button_pressed):
	parent.rotacao_travada_no_mouse = button_pressed


func _on_Velocidade_value_changed(value):
	parent.velocidade_andar = value
	label_velocidade.text = str(value)


func _on_Aceleracao_value_changed(value):
	parent.velocidade_rotacao = value
	label_aceleracao.text = str(value)


func _on_Desaceleracao_value_changed(value):
	parent.desaceleracao = value
	label_desaceleracao.text = str(value)


func _on_Rotacao_value_changed(value):
	parent.velocidade_rotacao = value
	label_rotacao.text = str(value)
