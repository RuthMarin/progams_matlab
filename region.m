%Lectura Sperm 0 y 1
lee_archivos1 = dir('C:\Users\Ruth\Desktop\train\label\*.jpg');
for i = 1:length(lee_archivos1)
    %Obtiene el nombre de los archivos de la carpeta
    archivo1 = lee_archivos1(i).name; 
    A = erase(archivo1,".jpg");
    Im= imread(strcat('C:\Users\Ruth\Desktop\train\label\',archivo1));
    Im = imresize(Im,[512 512]);
    bw=im2bw(Im);
    [L, num] = bwlabel(bw);
    for k = 1 : num
        chr = int2str(k);
        archivo =strcat(A , '_mask_',chr);
        thisBlob = ismember(L, k);
        image8bit = uint8 (255 * mat2gray (thisBlob));
        file = strcat('C:\Users\Ruth\Desktop\DATA\',A,'\masks\',archivo,'.jpg');
        imwrite(image8bit,file, 'JPG');   
    end
  
       
end


