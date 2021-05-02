function d=distanciaHausdorff(segmentacion, mascara)
% created by Violeta Chang C.

% h(mascara,segmentacion)
dt=bwdist(mascara);
[filas,columnas]=find(segmentacion > 0);
numE=numel(filas);
valor=[];

for i=1:numE
    valor(i)=dt(filas(i),columnas(i));
end

hAB=max(valor);


% h(segmentacion,mascara)
dt=bwdist(segmentacion);
[filas,columnas]=find(mascara > 0);
numE=numel(filas);
valor=[];

for i=1:numE
    valor(i)=dt(filas(i),columnas(i));
end

hBA=max(valor);


% valor final
d=max([hAB hBA]);
