
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
hermanode(X,Y):-padrede(Z,X), padrede(Z,Y); madrede(Z,X), madrede(Z,Y).

% Tios - mi tio es el hermano de mi papa o mama (soy Y)
tiode(X,Y):-padrede(Z,Y), hermanode(Z,X); madrede(Z,Y), hermanode(Z,X).

abuelos(X,Y):-padrede(X,Z), padrede(Z,Y); madrede(X,Z), padrede(Z,Y).

% Tu primo es el hijo del hermano/a de tu papa/mama
primos(X,Y):-padrede(Z,X), hermanode(Z,A), padrede(A,Y).
