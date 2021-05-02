%boxplot(0.1,0.2)
%title('Miles per Gallon by Vehicle Origin')
%xlabel('Country of Origin')
%ylabel('Miles per Gallon (MPG)')

%Y = magic(6);
%disp(Y);
%boxplot(Y);
%xlabel('Column');
%ylabel('Value');

disp('https://in.mathworks.com/help/matlab/ref/boxchart.html')

%load patients 
%Smoker = categorical(Smoker,logical([1 0]),{'U-NET','MASK-RCNN'});

%tiledlayout(1,2)

% Left axes
%ax1 = nexttile;
%boxchart(ax1,Systolic,'GroupByColor',Smoker)
%ylabel(ax1,'Dice')
%legend

tbl = readtable('datos_cabeza.csv');
spermOrder = {'Head','Nucleus','Acrosome'};

tbl.Sperm = categorical(tbl.Sperm,spermOrder);
boxchart(tbl.Sperm,tbl.Dice,'GroupByColor',tbl.Method)
ylabel('Dice Coefficient')
ylim([0.5 1])
legend('Location','southeast')
