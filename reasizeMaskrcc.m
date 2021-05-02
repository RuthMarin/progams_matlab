carpeta = 'exp10.1';
lee_archivos1 = dir(['C:\Users\Ruth\Desktop\acrosoma-tdl-hela\' carpeta '\*.jpg']);
archivos_unet = dir(['C:\Users\Ruth\Desktop\acrosoma-tdl-hela\' carpeta '\']);
for i = 1:length(lee_archivos1)
    %Obtiene el nombre de los archivos de la carpeta
    archivo1 = lee_archivos1(i).name; 
    imagen= imread(strcat(['C:\Users\Ruth\Desktop\acrosoma-tdl-hela\' carpeta '\'],archivo1));
    res=imagen(358:358+899,215:215+1209,:);
    resultado=imresize(res,[580 780]);
    collages=uint8(zeros(580,780));
    collages(:,:,1)=0;
    collages(:,:,2)=0;
    collages(:,:,3)=0;

    for c = 1:780
        for r = 1:580
            if resultado(r,c,1) <= 40
                collages(r,c,1)=255;
                collages(r,c,2)=255;
                collages(r,c,3)=255; 
           end 
           end
    end
    
    write_dir1 = strcat(['C:\Users\Ruth\Desktop\acrosoma-tdl-hela\' carpeta '\'],archivo1);
    imwrite(collages,write_dir1,'jpg')
    


end

all_files = dir('C:\Users\Ruth\Desktop\SCIAN-SpermSegGS\');
numfolders = sum([all_files.isdir]);
disp(numfolders-2)
