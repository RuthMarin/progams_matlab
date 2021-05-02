dircontent = dir('C:\Users\Ruth\Desktop\stage\');
cont = length(dir('C:\Users\Ruth\Desktop\stage\'));
for j = 3:length(dircontent)
    A = erase(num2str(dircontent(j).name),".png");
    write = strcat(['C:\Users\Ruth\Desktop\stage\' A '\images\'],'*.png');
    archivo = dir(write );
    archivo1 = archivo(1).name;
    imagen=  strcat(['C:\Users\Ruth\Desktop\stage\' A '\images\'],[ A '.png']);
    Im2= imread(imagen);
    Im = imresize(Im2,[580 780]);
    imwrite(Im, strcat(['C:\Users\Ruth\Desktop\stage\' A '\images\'],[ A '.png']));
    archivo = dir(write );
    disp(archivo(1).name);

    for i = 3:length(archivo)
        archivo2 = archivo(i).name; 
        chr = int2str(i);
        archivo3 =strcat(A , '_mask_',chr);
        Im= imread(strcat(['C:\Users\Ruth\Desktop\stage\' A '\masks\'],archivo2));
        write_dir = strcat('C:\Users\Ruth\Desktop\stage\', A, '\masks\',archivo3, '.png');
        Im=imresize(Im,[580 780]);
        imwrite(Im, write_dir, 'PNG');
        write_dir3 = strcat(['C:\Users\Ruth\Desktop\stage\' A '\masks\'],archivo1);
        delete(write_dir3);
    end    
end

 

