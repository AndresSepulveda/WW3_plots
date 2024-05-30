close all
clear all
win_start
nc=netcdf('oleaje.nc','r');

tiempo=squeeze(nc{'time'}(:,1,1));
Tp=squeeze(nc{'VTPK'}(:,1,1));
Dp=squeeze(nc{'VPED'}(:,1,1));
Hm0=squeeze(nc{'VHM0'}(:,1,1));
close(nc)

tiempo=(tiempo-tiempo(1))./(24*3600);

figure(1)
subplot(2,1,1)
plot(tiempo,Hm0)
title('Hm0')
xlabel('Time')
ylabel('[m]')

subplot(2,1,2)
plot(tiempo,Tp)
title('Tp')
xlabel('Time')
ylabel('[s]')


ene=length(Hm0);
heigths=0:1:6;   % [m]
periods=0:1:30;   % [s]

casillas=[];
for i=1:length(heigths)-1     % Per
    for j=1:length(periods)-1 % Hei
       indx1=find(Hm0 > heigths(i) & Hm0 < heigths(i+1)); 
       tot  =find(Tp(indx1) > periods(j) & Tp(indx1) < periods(j+1));
       casillas(i,j)=length(tot);
    end
end
casillas;
casillas2=casillas./ene;

sum(sum(casillas2,1))*100
sum(sum(casillas2,2))*100

figure(2)
pcolor(casillas2)
xlabel('Tp [s]')
ylabel('Hm0 [m]')
colorbar

