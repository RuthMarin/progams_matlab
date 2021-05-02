for j = 1:10
    archivo = dir(['C:\Users\Ruth\Desktop\unet-hela-head\exp' num2str(j) '\*.jpg']);
    disp(['C:\Users\Ruth\Desktop\unet-hela-head\exp' num2str(j) '\*.jpg']);
    disp(length(archivo));
    for i = 1:length(archivo)
        archivo1 = archivo(i).name;
        disp(['C:\Users\Ruth\Desktop\unet-hela-head\exp' num2str(j) '\' archivo1]);
        Im= imread(['C:\Users\Ruth\Desktop\unet-hela-head\exp' num2str(j) '\' archivo1]);
        %Imm= imread(strcat('C:\Users\Ruth\Desktop\Acrosome-Masks\',archivo1));
        write_dir = ['C:\Users\Ruth\Desktop\unet-hela-head\exp' num2str(j) '\' archivo1];
        %write_dir0 = strcat('C:\Users\Ruth\Desktop\Acrosome-Masks\',archivo1);
        Im=imresize(Im,[580 780]);
        %Imm=imresize(Imm,[512 512]);
        %imwrite(Imm, write_dir0);
        imwrite(Im, write_dir);

    end
end