# Snake 2D

Jogo 2D inspirado no clássico Snake, desenvolvido em Ruby com a biblioteca Gosu.

## Requisitos

- Ruby instalado
- Biblioteca Gosu

## Instalação

Instale a dependência Gosu:

```bash
gem install gosu
```

## Como executar

Na pasta raiz do projeto, execute:

```bash
ruby main.rb
```

## Controles

Durante a partida:

- Seta para cima: movimenta a cobra para cima
- Seta para baixo: movimenta a cobra para baixo
- Seta para esquerda: movimenta a cobra para a esquerda
- Seta para direita: movimenta a cobra para a direita

No menu:

- Seta para cima/baixo: seleciona uma opção
- Enter: confirma a opção

Na tela de fim de jogo:

- Enter: inicia uma nova partida
- Esc: encerra o jogo

## Como jogar

O objetivo é controlar a cobra, coletar as maçãs e aumentar sua pontuação.

A cada maçã coletada, a cobra cresce e a pontuação aumenta. A partida termina quando a cobra colide com as bordas do tabuleiro ou com o próprio corpo.

O recorde é armazenado localmente no arquivo `save/highscore.txt`.

## Estrutura do projeto

```text
Snake 2D/
├── assets/
│   ├── fonts/
│   ├── images/
│   │   ├── backgrounds/
│   │   ├── food/
│   │   ├── tiles/
│   │   └── ui/
│   └── sounds/
├── entities/
│   ├── food.rb
│   └── snake.rb
├── graphics/
│   ├── assets.rb
│   └── sprites.rb
├── renderer/
│   └── snake_renderer.rb
├── save/
│   └── highscore.txt
├── services/
│   └── high_score.rb
├── states/
│   ├── game_over_state.rb
│   ├── menu_state.rb
│   └── play_state.rb
├── ui/
│   ├── button.rb
│   └── hud.rb
├── board.rb
├── config.rb
├── game.rb
└── main.rb
```

## Organização dos arquivos

- `main.rb`: ponto de entrada da aplicação.
- `game.rb`: inicializa a janela e controla a troca entre os estados do jogo.
- `config.rb`: reúne as configurações da janela, do tabuleiro e da velocidade.
- `board.rb`: desenha o cenário, a área de jogo e suas bordas.
- `entities/`: contém as entidades principais, como cobra e comida.
- `states/`: implementa os estados de menu, partida e fim de jogo.
- `graphics/`: carrega e mantém os recursos gráficos.
- `renderer/`: desenha a cobra na tela.
- `ui/`: contém elementos da interface, como o HUD.
- `services/high_score.rb`: carrega e salva o recorde.
- `assets/`: armazena imagens, fontes e sons.

## Tecnologias

- Ruby
- Gosu
