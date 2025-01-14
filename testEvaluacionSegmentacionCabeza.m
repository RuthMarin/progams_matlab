function [distancia,coeficiente]=testEvaluacionSegmentacionCabeza()%idx,rutaSegmentacion)
% created by Violeta Chang C.

warning off;

for a=1:20
    if a ~= 7
        %idx=0 para evaluar todas las imagenes de la Placa1
        rutaSegmentacion='./acrosome-masknet/';
        rutaMascara='./calculo_precision/ACROSOME/';
        idx=0;
        imagen_comparar= ['Placa1-imagen' num2str(a) '.jpg'];
        disp(imagen_comparar)
        imagen_comparar2 = erase(imagen_comparar,".jpg");

            n=1;
            distancia1=[];
            distancia2=[];
            coeficiente1=[];
            coeficiente2=[];
            idx=1;
            dircontent = dir('C:\Users\Ruth\Desktop\acrosome-masknet\');
            for j=1:12
                imagen= dir(['C:\Users\Ruth\Desktop\acrosome-masknet\' dircontent(j).name '\TDL\IMAGENES\*.jpg']);
                disp('-----------------');
            disp(dircontent(3).name)
                cont = length(dir(['C:\Users\Ruth\Desktop\acrosome-masknet\' dircontent(j).name '\TDL\\IMAGENES\*.jpg']));
                disp(cont);
                for u=1:cont
                    archivo1 = imagen(u).name;
                    disp(archivo1);
                    disp(imagen_comparar)
                    if (string(archivo1)==imagen_comparar)
                        %disp(dircontent(j).name)
                        largo = length(dir(['C:\Users\Ruth\Desktop\calculo_precision\NUCLEOS\' imagen_comparar2 '\masks\*.jpg']));
                         for i=1:largo
                            nombreImagen=[imagen_comparar2 '/masks/' imagen_comparar2 '_mask_' int2str(i) '.jpg'];
                            segmentacion=[rutaSegmentacion dircontent(j).name '/TDL/IMAGENES/' imagen_comparar];
                            disp(segmentacion);
                            imgSeg=imread(segmentacion);
                            imgSeg=im2bw(imgSeg,0.5);
                            %subplot(1,2,1), imshow(imgSeg), title('Segmentacion')


                            mascara=[rutaMascara nombreImagen];
                            imgMas=imread(mascara);
                            imgMas=im2bw(imgMas,0.5);
                            %subplot(1,2,2), imshow(imgMas), title('Mascara')


                            [dist,numM1]=calcularDistanciasGenerales(imgSeg,imgMas);
                            distancia1(idx)=dist(1);
                            coeficiente1(idx)=dist(2);


                            [dist,numM2]=calcularDistanciasGenerales(imgMas,imgSeg);
                            distancia2(idx)=dist(1);
                            coeficiente2(idx)=dist(2);
                            %% para devolver un solo vector por metrica calculada
                            distancia(idx)=max(0,(distancia1(idx)+distancia2(idx))/2);
                            coeficiente(idx)=max(0,(coeficiente1(idx)+coeficiente2(idx))/2);
                            filename = [imagen_comparar '.xlsx'];
                            xlswrite(filename,distancia(idx), dircontent(j).name ,['A' num2str(i)])
                            xlswrite(filename,coeficiente(idx), dircontent(j).name ,['B' num2str(i)])

                            %% ------------
                            idx=idx+1;

                         end



                    end

                end
            end



    end

end
%T = [coeficiente];
%for col=1: length(T)
%filename = 'patientdata.xlsx';
%xlswrite(filename,T(col), dircontent(j).name,['A' num2str(col)])
%end









% %     dPromedio=mean([mean(distancia1) mean(distancia2)]);
% %     cPromedio=mean([mean(coeficiente1) mean(coeficiente2)]);
% %     display('................ Cabeza ...............');
% %     display(['===> DISTANCIA HAUSDORFF PROMEDIO: ' num2str(dPromedio)]);
% %     display(['===> �?NDICE SOLAPAMIENTO PROMEDIO: ' num2str(cPromedio)]);
% else
%     nombreImagen=[nombre int2str(idx) '.bmp'];
%
%     segmentacion=[rutaSegmentacion nombreImagen];
%     imgSeg=imread(segmentacion);
%
%     mascara=[rutaMascara nombreImagen];
%     imgMas=imread(mascara);
%
%     subplot(1,2,1), imshow(imgSeg), title('Segmentacion')
%     subplot(1,2,2), imshow(imgMas), title('Mascara')
%
%     dist=calcularDistanciasGenerales(imgSeg,imgMas);
%     distancia=dist(1);
%     coeficiente=dist(2);
%     display(['--> imagen: ' nombreImagen ...
%              ' --> Hausdorff promedio: ' num2str(distancia) ...
%              ' --> solapamiento promedio: ' num2str(coeficiente)]);
end
