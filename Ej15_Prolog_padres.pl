
% padres

padre(ramiro).
padre(julio).
padre(pedro).
padre(luis).
padre(fernando).
padre(ricardo).
padre(antonio).
padre(miguel).

% madres

madre(maria).
madre(julia).
madre(guadalupe).
madre(liz).
madre(ana).
madre(laura).
madre(sofia).
madre(carmen).

% padre de

padrede(ramiro, julio).
padrede(ramiro, fernando).
padrede(ramiro, ricardo).
padrede(julio, pedro).
padrede(julio, ana).
padrede(pedro, luis).
padrede(pedro, sofia).
padrede(fernando, antonio).
padrede(ricardo, miguel).

% madre de

madrede(maria, julio).
madrede(maria, fernando).
madrede(maria, ricardo).
madrede(julia, pedro).
madrede(julia, ana).
madrede(guadalupe, luis).
madrede(guadalupe, sofia).
madrede(liz, antonio).
madrede(liz, miguel).


% Preguntas chidas sjdsjdh

% Hermano - mi hermano es el hijo de mi papa y mama (soy X)
hermanode(X,Y):-padrede(Z,X), padrede(Z,Y), madrede(Z,X), madrede(Z,Y).

% Tio - mi tio es el hermano de mi papa o mama (soy Y)
tiode(X,Y):-padrede(Z,Y), hermanode(X,Z); madrede(Z,Y), hermanode(X,Z).

% Abuelo - mi abuelo es el papa de mi mama o papa (soy Y)
abuelode(X,Y):-padrede(X,Z), padrede(Z,Y); madrede(X,Z), padrede(Z,Y).

% Abuela - mi abuela es la mama de mi mama o papa (soy Y)
abuelade(X,Y):-padrede(X,Z), madrede(Z,Y); madrede(X,Z), madrede(Z,Y).

% Primo - mi primo es el hijo del hermano/a de mi papa/mama
primode(X,Y):-padrede(Z,X), hermanode(Z,A), padrede(A,Y), X \= Y.
