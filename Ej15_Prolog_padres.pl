$ Familia

madre(alicia).
madre(yuli).
madre(abril).
madre(noemi).

madre(tita)
madre(nadia).
madre(yus).

% padres

padre(francisco).
padre(paco).

padre(javier).

padre(moha).

padre(carlos).

% madre de

madrede(alicia, yuli).
madrede(alicia, abril).
madrede(alicia, noemi).
madrede(alicia, paco).

madrede(yuli, naomi).
madrede(yuli, alison).

madrede(abril, regina).

madrede(noemi, venecia).

madrede(tita, nadia).
madrede(tita, yus).
madrede(tita, moha).
madrede(tita, abu).
madrede(tita, salvador).

madrede(nadia, carla).
madrede(nadia, pavel).

madrede(yus, gabi).
madrede(yus, dani).
madrede(yus, alex).
madrede(yus, miguel).

% padre de

padrede(francisco, yuli).
padrede(francisco, abril).
padrede(francisco, noemi).
padrede(francisco, paco).

padrede(paco, nicol).
padrede(paco, nataly).

padrede(javier, naomi).
padrede(javier, alison).

padrede(moha, regina).

padrede(carlos, carla).
padrede(carlos, pavel).


% hermana

hermana(yuli).
hermana(abril).
hermana(noemi).

hermana(nadia).
hermana(yus).

hermana(naomi).
hermana(alison).

hermana(nicol).
hermana(nataly)

hermana(gabi).

hermana(carla).

% hermano








% mascotas :3

mascota(agata).
mascota(bellota).
mascota(morty).
mascota(biscocho).
mascota(cocoa).
mascota(chuby).
mascota(pinky).



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
