lee_archivos1 = dir('C:\Users\Ruth\Desktop\data2\train\label\*.jpg');
archivo = dir('C:\Users\Ruth\Desktop\data2\train\label\*.jpg');
cont = 0;

for i = 1:length(archivo)
        %Obtiene el nombre de los archivos de la carpeta
        archivo1 = archivo(i).name; 
        %Eliminar .jpg y guardar las 3 caracteristicas importantes
        archivo1 = erase(archivo1,".jpg");
        k = strfind(archivo1,['Placa1-imagen' int2str(20) '_']);
        if k == 1
            cont = cont +1;
            if cont > 8
              disp('eliminar');
              write_dir3 = strcat('C:\Users\Ruth\Desktop\data2\train\label\',archivo(i).name);
              delete(write_dir3);
            end
        end
    
   
end

