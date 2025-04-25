# Project New Horizon

*Game Design Document* (GDD) versão Portguês do Brasil

## 1. Informações Gerais

### 1.1. Título do jogo

* Orcs vs Soldiers

### 1.2. Plataforma(s)

O jogo esta sendo desenvolvido no modo compatibilidade da Godot engine 4.4.1, ou seja, pode ser compilado em todas as plataformas dispiníveis, mas está recebendo uma atenção especial para as seguintes plataformas:

* Raspberry Pi OS (arm64)
* Linux
* Android

### 1.3. Gênero

RPG de ação, Top-Down, Arcade.

### 1.4. Público-Alvo

N/a

### 1.5. Visão geral do jogo

Orcs e soldados batalham para se tornarem vitoriosos em uma gerra sem fim. Escolha qual lado você quer jogar e tente chegar o mais loge que puder.

## 2. Conclusão

### 2.1. Sumário

Esse é um projeto pessoal com fins de didaticos, meu objetivo é desenvolver um jogo para meu portifólio utilizando a famosa Godot Engine. O resultado final esperado para esse jogo será utilizado para entrar no mundo de desenvolvimento de jogos.

*"Orcs vs Soldiers"* é um mini protótipo de jogo RPG de ação top-down. Minha inspiração é o mini jogo arcade do **Stardew Valley** chamado **Rei da Pradaria**, no nosso jogo o jogador poderá escolher entre um personagem orc ou soldado e enfrentar ordas de inimigos visando a maior pontuação dentro do jogo, cada personagem possui suas peculiaridades em animação, estatus e gameplay.

### 2.2. O que ja temos pronto

* Diagrama de classes para ajudar na organização do código e desenvolvimento do projeto
* Joystick virtual para versões sensiveis ao toque (Android/ Mobile)
* Sistema de seleção de personagens e instânciação dinâmica do *player* e *enemy*
* Lógica basica para acionar a movimentação e o ataque dos personagens Orcs e Soldados
* O jogador consegue controlar o personagem escolhido
* O inimigo instanciado ataca e segue o jogador

### 2.3. Próximos passos
* Fazer o *special_attack* do personagem soldado.
* Fazer o sistema de dano e morte
* Fazer o sistema de experiência (exp)
* Fazer o *level design*
* Construir o menu principal
* Construir o menu de opções
* Fazer a Hud do jogo com a pontuação, vida e experiência do *player*
* Traduzir a interface do jogo para os idiomas como: Português(Brasileiro), Inglês e Espanhol Americano

## Recursos utilizados:

### Feramentas de desenvolvimento:

* Git e Github
* [Godot Engine v4.4.1](https://godotengine.org/)
* [Inkscape v1.2](https://inkscape.org/pt-br/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Raspberry Pi 4 Model B (8GB RAM)](https://www.raspberrypi.com/)

### Assets:

* [Tiny RPG Character Asset Pack v1.03](https://zerie.itch.io/tiny-rpg-character-asset-pack)