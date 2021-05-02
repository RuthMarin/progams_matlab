function [distancia,numMatch]=calcularDistanciasGenerales(segmentacion,mascara)
% created by Violeta Chang C.
% distancia es un vector de 2 x numMatch
% cada fila corresponde a una tupla=(distancia de hausdorff, coeficiente de dice)

[nrS ncS]=size(segmentacion);
[nrM ncM]=size(mascara);

if (nrS~=nrM) || (ncS~=ncM)
    display('error!!');
    return;
end

estSeg=regionprops(segmentacion,'all');
numObjSeg=numel(estSeg);

estMas=regionprops(mascara,'all');
numObjMas=numel(estMas);

% calculamos la distancia de Hausdorff y el coeficiente de solapamiento 
% para todos los objetos de la Mascara
dh=zeros(1,numObjMas);
dc=zeros(1,numObjMas);
vacios=[];

for i=1:numObjMas
    
        % i=indice en mascara
        
        centroideM=round(estMas(i).Centroid);

        j=1;    % indice en segmentacion
        centroideS=[];
        while (isempty(centroideS) && (j <= numObjSeg))
            centroideS=round(estSeg(j).Centroid);
            if (mascara(centroideS(2),centroideS(1)) == 0) || ...
               (abs(centroideS(1)-centroideM(1))>=5 || ...
                abs(centroideS(2)-centroideM(2))>=5)
                centroideS=[];
                j=j+1;
            end 
        end

        if (j <= numObjSeg)  % hay correspondencia en segmentación

            areaM=estMas(i).Area;
            areaS=estSeg(j).Area;

            if (areaM > areaS)
                box=round(estMas(i).BoundingBox);
            else
                box=round(estSeg(j).BoundingBox);
            end
            
            subSeg=segmentacion(box(2):min(size(segmentacion,1),box(2)+box(4)),box(1):min(size(segmentacion,2),box(1)+box(3)));
            bordesSeg=bwperim(subSeg);
            %subplot(1,2,1), imshow(subSeg), title('Segmentacion')

            subMas=mascara(box(2):min(size(mascara,1),box(2)+box(4)),box(1):min(size(mascara,2),box(1)+box(3)));
            bordesMas=bwperim(subMas);
            %subplot(1,2,2), imshow(subMas), title('Mascara')
            

            ejeMayor=estMas(i).MajorAxisLength;
            dh(i)=distanciaHausdorff(bordesMas,bordesSeg)/ejeMayor;
            dc(i)=coeficienteSolapamiento(subSeg,subMas);
        else
            vacios=[vacios; i];
        end
        %pause
end

numVacios=numel(vacios);
for x=numVacios:-1:1
    dh(vacios(x))=[];
    dc(vacios(x))=[];
end
numMatch=numObjMas-numVacios;

% primeros elementos corresponden a hausdorff, luego viene dice y luego se
% indica el numero de matches
distancia=[dh; dc]; %; numMatch]

% [nrS ncS]=size(segmentacion);
% [nrM ncM]=size(mascara);
% 
% if (nrS~=nrM) || (ncS~=ncM)
%     display('error!!');
%     return;
% end
% 
% estSeg=regionprops(segmentacion,'all');
% numObjSeg=numel(estSeg);
% 
% estMas=regionprops(mascara,'all');
% numObjMas=numel(estMas);
% 
% % calculamos la distancia de Hausdorff y el coeficiente de solapamiento 
% % para todos los objetos de la Mascara
% dh=[];
% dc=[];
% 
% 
% for i=1:numObjMas
%     
%         % i=indice en mascara
%         
%         centroideM=round(estMas(i).Centroid);
% 
%         j=1;    % indice en segmentacion
%         centroideS=[];
%         while (isempty(centroideS) && (j <= numObjSeg))
%             centroideS=round(estSeg(j).Centroid);
%             if (mascara(centroideS(2),centroideS(1)) == 0) || ...
%                (abs(centroideS(1)-centroideM(1))>=5 || ...
%                 abs(centroideS(2)-centroideM(2))>=5)
%                 centroideS=[];
%                 j=j+1;
%             end 
%         end
% 
%         if (j <= numObjSeg)  % hay correspondencia en segmentación
% 
%             areaM=estMas(i).Area;
%             areaS=estSeg(j).Area;
% 
%             if (areaM > areaS)
%                 box=round(estMas(i).BoundingBox);
%             else
%                 box=round(estSeg(j).BoundingBox);
%             end
% 
%             subSeg=segmentacion(box(2):box(2)+box(4),box(1):box(1)+box(3));
%             bordesSeg=bwperim(subSeg);
% 
%             subMas=mascara(box(2):box(2)+box(4),box(1):box(1)+box(3));
%             bordesMas=bwperim(subMas);
% 
%             ejeMayor=estMas(i).MajorAxisLength;
%             dh(i)=distanciaHausdorff(bordesMas,bordesSeg)/ejeMayor;
%             dc(i)=coeficienteSolapamiento(subSeg,subMas);
%         else
%             dh(i)=1;
%             dc(i)=0.000000001;
%         end
% end
%         
distancia=[mean(dh(dh>0)) mean(dc(dc>0))]; 


