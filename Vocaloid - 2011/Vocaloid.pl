vocaloid(megurineLuka).
vocaloid(hatsuneMiku).
vocaloid(gumi).
vocaloid(seeU).
vocaloid(kaito).

canta(megurineLuka, nightFever(4)).
canta(megurineLuka, tellYourWorld(5)).
canta(hatsuneMiku, tellYourWorld(4)).
canta(gumi, foreverYoung(4)).
canta(gumi, tellYourWorld(5)).
canta(seeU, novemberRain(6)).
canta(seeU, nightFever(5)).

esNovedoso(Vocaloid):-
    vocaloid(Vocaloid),
    canta(Vocaloid, Cancion),