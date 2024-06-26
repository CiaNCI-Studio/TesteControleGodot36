extends CanvasLayer

onready var parent = get_parent() as ControlePulo2D
onready var tempo_coyote_slider = $Control/VBoxContainer/HBoxContainer6/CoyoteTime
onready var buffer_pulo_slider = $Control/VBoxContainer/HBoxContainer7/BufferPulo
onready var pulo_slider = $Control/VBoxContainer/HBoxContainer8/Pulo
onready var mult_queda_slider = $Control/VBoxContainer/HBoxContainer9/MultQueda
onready var mult_gravidade_slider = $Control/VBoxContainer/HBoxContainer10/MultGravidade
onready var label_pulo = $Control/VBoxContainer/HBoxContainer8/LabelPulo
onready var label_mult_queda = $Control/VBoxContainer/HBoxContainer9/LabelMultQueda
onready var label_mult_gravidade = $Control/VBoxContainer/HBoxContainer10/LabelMultGravidade
onready var label_tempo_coyote = $Control/VBoxContainer/HBoxContainer6/LabelTempoCoyote
onready var label_buffer_pulo = $Control/VBoxContainer/HBoxContainer7/LabelBufferPulo
onready var pulo_variavel = $Control/VBoxContainer/HBoxContainer11/PuloVariavel

func _ready():		
	tempo_coyote_slider.value = parent.tempo_de_coyote
	label_tempo_coyote.text = str(parent.tempo_de_coyote)
	pulo_slider.value = parent.velocidade_pulo
	label_pulo.text = str(parent.velocidade_pulo)
	mult_queda_slider = parent.multiplicador_de_queda
	label_mult_queda.text = str(parent.multiplicador_de_queda)
	mult_gravidade_slider.value = parent.multiplicador_de_gravidade
	label_mult_gravidade.text = str(parent.multiplicador_de_gravidade)
	buffer_pulo_slider.value = parent.tempo_de_buffer_de_pulo
	label_buffer_pulo.text = str(parent.tempo_de_buffer_de_pulo)	
	pulo_variavel.pressed = parent.controle_pulo_variavel
	
func _on_OptionModo_item_selected(index):
	parent.tipo_movimento = index	

func _on_OptionTipo_item_selected(index):
	parent.modo_de_controle = index	


func _on_BufferPulo_value_changed(value):
	parent.tempo_de_buffer_de_pulo = value
	label_buffer_pulo.text = str(value)


func _on_TempoCoyote_value_changed(value):
	parent.tempo_de_coyote = value
	label_tempo_coyote.text = str(value)


func _on_Pulo_value_changed(value):
	parent.velocidade_pulo = value
	label_pulo.text = str(value)


func _on_MultQueda_value_changed(value):
	parent.multiplicador_de_queda = value
	label_mult_queda.text = str(value)


func _on_MultGravidadr_value_changed(value):
	parent.multiplicador_de_gravidade = value
	label_mult_gravidade.text = str(value)


func _on_ControleNoAr_toggled(button_pressed):
	parent.controle_no_ar = button_pressed	


func _on_PuloVariavel_toggled(button_pressed):	
	parent.controle_pulo_variavel = button_pressed
