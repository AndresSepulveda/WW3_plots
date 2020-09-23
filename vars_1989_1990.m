clc;
clear all;
%path(path,'/home/diego/Escritorio/m_map1.4f');

fre1=ncread('VALPO_wat_36_spec.nc','frequency');
dir1=ncread('VALPO_wat_36_spec.nc','direction');
time=ncread('VALPO_wat_36_spec.nc','time');
E1=ncread('VALPO_wat_36_spec.nc','efth');
E2=permute(squeeze(E1),[2 1 3]); % (freq,theta,time)
clear E1;
Hm0=zeros(length(time),1); Te=zeros(length(time),1); Tm=zeros(length(time),1); Tz=zeros(length(time),1); 
epsi=zeros(length(time),1); ni=zeros(length(time),1); 
for i=1:length(time)
    E=squeeze(E2(:,:,i));
[H,Tmm,Tzz,Tee,epsilon,ny] = waves_variables(E,fre1,dir1);
Hm0(i)=H; Tm(i)=Tmm; Tz(i)=Tzz; Te(i)=Tee; epsi(i)=epsilon; ni(i)=ny;
end
out=[Hm0 Tm Te Tz epsi ni];     % combined matrix of above vectors
savename='wave_parameters_wat_VALPO_36.mat';
save(savename,'out'); % save the combined vector out in test.mat
exit;
