clear all

%Leitura de dados do arquivo
disp('Aguarde processamento...'); 
fileID = fopen('reactor3.csv');
C1 = textscan(fileID,'%d %{dd/MM/yyyy HH:mm:SS}D %f %f %f','Delimiter',',');
fclose(fileID);



fileID = fopen('glicerina.csv');
C2 = textscan(fileID,'%d %{dd/MM/yyyy HH:mm:SS}D %f','Delimiter',',');
fclose(fileID);



disp('1)Leitura do arquivo: ok');

N1 = length(C1{1});
d1=C1{2}
v1=C1{5}

N2 = length(C2{1});
d2=C2{2}
v2=C2{3}



T=3


M=ceil(datenum(d1(end)-d1(1))*24/T);

volume=zeros(M,1);
glicerina=zeros(M,1);

disp('2)Pre-processamento do arquivo fonte: ok');
for i=1:N1
    t=floor(datenum(d1(i)-d1(1))*24/T)+1;
    volume(t)=volume(t)+v1(i);
end
for i=1:N2
    t=floor(datenum(d2(i)-d1(1))*24/T)+1;
    glicerina(t)=glicerina(t)+v2(i);
end




disp('3)Grafico: ok');
figure(1)
stairs(volume)
hold on
stairs(glicerina*30)
hold off


