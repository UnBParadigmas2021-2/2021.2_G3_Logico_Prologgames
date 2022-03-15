# Steam Seeker

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO <br>
**Nro do Grupo**: 03<br>
**Paradigma**: Lógico<br>

## Alunos

| Matrícula  | Aluno                           |
| ---------- | ------------------------------- |
| 19/0063441 | Ana Carolina Carvalho da Silva  |
| 18/0113151 | Eduardo Nunes Picolo            |
| 18/0113861 | Kleidson Alves Corrêa           |
| 18/0125770 | Lucas Gabriel Bezerra           |
| 18/0114077 | Lucas Rodrigues Fonseca         |
| 18/0106970 | Matheus Gabriel Alves Rodrigues |
| 18/0129058 | Paulo Victor da Silva           |
| 18/0129287 | Pedro Henrique Vieira Lima      |
| 18/0130722 | Samuel Nogueira                 |

## Sobre 
A fim de ajudar milhares de jogadores ao redor do mundo, foi desenvolvido o Steam Seeker. O Steam Seeker é um sistema de recomendações de jogos que estão registrados na plataforma da Steam. O sistema faz não apenas recomendação, mas também organiza a listagem dos jogos.
Utilizando uma base de dados pública, é possível saber quais jogos o sistema deve recomendar. 

## Requisitos


| ID    | Requisito           | Descrição                                                                                                                                                                   |
| ----- | ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| RF001 | Recomendar por preferência | Baseado nas escolhas do usuário em Categoria, Gênero, Desenvolvedora, Editora recomendar um jogo |
| RF002 | Recomendar aleatoriamente    | Recomendar um jogo de forma aleatória sem preferências |
| RF003 | Listar por desenvolvedor | Listar os jogos organizando por desenvolvedor |
| RF004 | Listar todos os jogos      | Listar todos os jogos disponíveis |
| RF005 | Listar por gênero  | Listar os jogos organizando por gênero |

## Screenshots

Tela do menu principal da aplicação

![Menu principal](media/menuprincipal.jpeg) 

Tela do menu de recomendação

![Menu recomendacao](media/menuindicacao.jpeg) 

Tela da recomendação

![Recomendacao](media/recomendacao.jpeg) 

## Instalação 
**Linguagem**: Prolog <br>
**Tecnologia**: SWI-Prolog v7.6.4 <br>

**Pré-requisitos** para rodar o Steam Seeker:
- SWI-Prolog v7.6.4

**Instalando SWI-Prolog**

- No Ubuntu e similares:

``` shell
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install swi-prolog
```

- Para instalar nos demais Sistemas Operacionais consulte: https://www.swi-prolog.org/download/stable

**Instalando Steam Seeker**
``` shell
git clone https://github.com/UnBParadigmas2021-2/2021.2_G3_Logico_SteamSeeker.git
cd 2021.2_G3_Logico_SteamSeeker
```
## Uso 
No terminal, vá para o diretório 2021.2_G3_Logico_SteamSeeker:
``` shell
swipl main.pl
```
Dentro do console:

```prolog
start.
```
Para navegar pelo programa basta escolher o número conforme a sua opção indicada em texto.

## Video

[![SteamSeeker](https://img.youtube.com/vi/owjsSymbKQ0/0.jpg)](https://youtu.be/owjsSymbKQ0)
[Link](https://youtu.be/owjsSymbKQ0)


## Fontes
- Fonte da base de dados utilizada
https://www.kaggle.com/nikdavis/steam-store-games

- Fonte para aprendizagem de prolog https://www.swi-prolog.org/

- Projetos que nos inpiraram:
    - https://github.com/UnBParadigmas2020-2/2020.2_G1_Logico_Prologfy
    -  https://github.com/Ranim1997/Movie-Recommendation-System-Prolog/blob/master/movielovers.pl
