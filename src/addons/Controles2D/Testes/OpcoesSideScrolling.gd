extends CanvasLayer

onready var parent = get_parent() as ControleSideScroling2D
onready var velocidadeSlider = $Control/VBoxContainer/HBoxContainer3/Velocidade
onready var aceleracaoSlider = $Control/VBoxContainer/HBoxContainer4/Aceleracao
onready var desaceleracaoSlider = $Control/VBoxContainer/HBoxContainer5/Desaceleracao
onready var mult_gravidade_slider = $Control/VBoxContainer/HBoxContainer10/MultGravidadr
onready var label_velocidade = $Control/VBoxContainer/HBoxContainer3/LabelVelocidade
onready var label_aceleracao = $Control/VBoxContainer/HBoxContainer4/LabelAceleracao
onready var label_desaceleracao = $Control/VBoxContainer/HBoxContainer5/LabelDesaceleracao
onready var label_mult_gravidade = $Control/VBoxContainer/HBoxContainer10/LabelMultGravidade
onready var controle_no_ar = $Control/VBoxContainer/HBoxContainer12/ControleNoAr
onready var tratar_gravidade = $Control/VBoxContainer/HBoxContainer11/TratarGravidade


func _ready():
	velocidadeSlider.value = parent.velocidade_andar
	label_velocidade.text = str(parent.velocidade_andar)
	aceleracaoSlider.value = parent.aceleracao
	label_aceleracao.text = str(parent.aceleracao)
	desaceleracaoSlider.value = parent.desaceleracao	
	label_desaceleracao.text = str(parent.desaceleracao	)		
	mult_gravidade_slider.value = parent.multiplicador_de_gravidade
	label_mult_gravidade.text = str(parent.multiplicador_de_gravidade)	
	controle_no_ar.pressed = parent.controle_no_ar
	tratar_gravidade.pressed = parent.tratar_gravidade
	
func _on_OptionModo_item_selected(index):
	parent.tipo_movimento = index	

func _on_OptionTipo_item_selected(index):
	parent.modo_de_controle = index	


func _on_Desaceleracao_value_changed(value):
	parent.desaceleracao = value
	label_desaceleracao.text = str(value)


func _on_Aceleracao_value_changed(value):
	parent.aceleracao = value
	label_aceleracao.text = str(value)


func _on_Velocidade_value_changed(value):
	parent.velocidade_andar = value
	label_velocidade.text = str(value)


func _on_MultGravidadr_value_changed(value):
	parent.multiplicador_de_gravidade = value
	label_mult_gravidade.text = str(value)


func _on_ControleNoAr_toggled(button_pressed):
	parent.controle_no_ar = button_pressed	


func _on_TratarGravidade_toggled(button_pressed):
	parent.tratar_gravidade= button_pressed	
