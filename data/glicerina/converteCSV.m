clear all

%Leitura de dados do arquivo
disp('Aguarde processamento...'); 
fileID = fopen('reactor3.csv');
C = textscan(fileID,'%d %{dd/MM/yyyy HH:mm:SS}D %f %f %f','Delimiter',',');
fclose(fileID);
disp('1)Leitura do arquivo: ok');

N = length(C{1});

d=C{2}
v=C{5}

T=8


M=ceil(datenum(d(end)-d(1))*24/T);

volume=zeros(M,1);

disp('2)Pre-processamento do arquivo fonte: ok');
for i=1:N
    t=floor(datenum(d(i)-d(1))*24/T)+1;
    volume(t)=volume(t)+v(i);
end

disp('3)Grafico: ok');
figure(1)
stairs(volume)

