function valor=coeficienteSolapamiento(segmentacion, mascara)
% created by Violeta Chang C.

[nr nc]=size(segmentacion);
nn=max([nr nc]);

aux=magic(nn);
magica=aux(1:nr,1:nc);

segmentacion=segmentacion.*magica;
mascara=mascara.*magica;

idxS=find(segmentacion > 0);
tamSeg=numel(idxS);

idxM=find(mascara > 0);
tamMas=numel(idxM);

interseccion= intersect(segmentacion(idxS),mascara(idxM));
tamInt=numel(interseccion);

valor=2*tamInt/(tamSeg+tamMas);


