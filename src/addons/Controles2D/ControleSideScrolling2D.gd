extends BaseControle2D
class_name ControleSideScroling2D

#Propriedades de controle
export var controle_no_ar = true
export var controle_pulo_variavel = true

#Propriedades de velocidade
export var velocidade_pulo = 900.0

#Tempo de Buffer do Pulo, para que o pulo possa ser acionado mesmo instantes antes de tocar o chão
export var tempo_de_buffer_de_pulo : float = 0.1
#Tempo de Coyote, para que o pulo possa ser acionado mesmo instantes apos cair de uma plataforma
export var tempo_de_coyote : float = 0.1
#Multiplica o valor global da gravidade, para ajuste fino do pulo
export var multiplicador_de_gravidade : float = 1.0
#Multiplica o valor da gravidade, mas apenas quando estiver caindo (acumulativo com o multiplicador_de_gravidade)
export var multiplicador_de_queda : float = 1.1

#Sinais
signal pulo_iniciado
signal pulo_finalizado
signal chao_atingido

#Variáveis internas
var timer_buffer_pulo: float = 0.0
var timer_coyote: float = 0.0
var pulando = false
var cancelar_pulo = false
var noChao = false


func _input(_event):
	if ativo:
		if Input.is_action_just_pressed(controle_pulo):
			timer_buffer_pulo = tempo_de_buffer_de_pulo	
		if controle_pulo_variavel and Input.is_action_just_released(controle_pulo) and pulando and velocidade.y < 0:
			cancelar_pulo  = true
		if Input.is_action_just_released(controle_correr) and correndo:
			emit_signal("corrida_finalizada")
			correndo = false

func _process(delta):
	if ativo:
		tratar_no_chao()	
		tratar_gravidade()
		tratar_pulo(delta)
		tratar_direcao()
		move()

#Tratamento da gravidade
func tratar_gravidade():
	if not parent.is_on_floor() and not timer_coyote > 0:
		if velocidade.y < 0:
			velocidade.y += gravity * multiplicador_de_gravidade
		else:
			velocidade.y += (gravity * multiplicador_de_gravidade) * multiplicador_de_queda	
	if timer_coyote > 0 and not pulando:
		velocidade.y = 0

#Tratamento das ações tocar o chão
func tratar_no_chao():
	var estava_no_chao = noChao
	noChao = parent.is_on_floor()
	if noChao != estava_no_chao and not pulando:
		emit_signal("chao_atingido")

#Tratamento das ações de direcionamento
func tratar_direcao():
	if not controle_no_ar and not parent.is_on_floor():
		return
	var direction = Input.get_axis(controle_left, controle_right)	
	var velocidade_atual = velocidade_andar
	if Input.is_action_pressed(controle_correr) and not correndo and direction:
			correndo = true
			emit_signal("corrida_iniciada")
			velocidade_atual = velocidade_correr
	if direction:
		velocidade.x = move_toward(velocidade.x, direction * velocidade_andar, aceleracao)
		if direction > 0:
			if grupo_sprites:
				grupo_sprites.scale.x = 1
			direcao_atual = 1
		else:			
			if grupo_sprites:
				grupo_sprites.scale.x = -1
			direcao_atual = -1
	else:
		velocidade.x = move_toward(velocidade.x, 0, desaceleracao)

#Tratamento ações do pulo
func tratar_pulo(delta):
	if parent.is_on_floor():
		timer_coyote = tempo_de_coyote
	
	if pulando and cancelar_pulo:
		velocidade.y = 0
		pulando = false
		cancelar_pulo  = false
	
	timer_buffer_pulo -= delta
	timer_coyote -= delta
	
	if pulando and parent.is_on_floor():
		pulando = false
		emit_signal("pulo_finalizado")
	
	if timer_buffer_pulo > 0 and (parent.is_on_floor() or (timer_coyote > 0 and not pulando)) :
		timer_coyote = 0
		pulando = true
		velocidade.y = (velocidade_pulo	* -1)
		emit_signal("pulo_iniciado")
