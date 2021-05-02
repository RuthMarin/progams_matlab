lee_archivos1 = dir('C:\Users\Ruth\Desktop\test1\*.jpg'); 
lee_archivos2 = dir('C:\Users\Ruth\Desktop\results1\*.jpg'); 

z=0;
for k = 1:length(lee_archivos1)
    z=z+1;
    archivo1 = lee_archivos1(k).name;
    n1= imread(strcat('C:\Users\Ruth\Desktop\test1\',archivo1));
    n1 = imresize(n1,[580 780]);
    archivo2 = lee_archivos2(k).name;
    n2= imread(strcat('C:\Users\Ruth\Desktop\results1\',archivo2));
    n2 = imresize(n2,[580 780]);
    name= num2str(z);
    %DIRECTORIOS
    write_dir = strcat('C:\Users\Ruth\Desktop\', 'test2\', name,'.jpg');
    write_dir0 = strcat('C:\Users\Ruth\Desktop\', 'test\', name,'.jpg');
    imwrite(n1, write_dir0);
    imwrite(n2, write_dir);
end