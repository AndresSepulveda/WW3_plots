%% ESPECTROS DIRECIONALES
%%=========================================================================
clc
close all
clear all
%%=========================================================================
% lectura de espectro
FILE = 'ww3.SHOA_20230610_spec.nc';
%nc_dump(FILE)
Spec= ncread(FILE,'efth');
Spec = squeeze(Spec(:,:,1,:));
% aux = Spec(:,:,g)';
frec = ncread(FILE,'frequency');
dir = ncread(FILE,'direction');
ifm = length(frec); 
dir0=dir;
% [B,I] = sort(dir0);;
% dir = dir0(I);
dir=dir*2*3.1416/360; 
per=1./(flip(frec)); %periodo
%set plot
szf=12;      %fuente de las letras
vc1=[0 0 0]; %color lineas segmentadas
vc2=[0 0 0]; %color texto periodos
%%=========================================================================
figure('color','w')
for g = 1:48
spec = Spec(:,:,g)'; 
dir_corr=[dir;dir(1)]; %empieza y termina en dir(1)
num_dir=length(dir_corr);
angulo=dir_corr*-1+pi/2;
vmax=max(per);
spec_corr=[spec spec(:,1)];
spec0=spec_corr(1:ifm,:);
spec1=[zeros(1,num_dir);spec0];
frec_corr=[0;frec]/vmax;
per_corr=[0;per]/vmax; 
rmax=1;
dang=deg2rad(22.5);

x1=rmax*cos(dang);
y1=rmax*sin(dang);
rmed=rmax/sqrt(2);

clf
[theta,r]=meshgrid(angulo,per_corr);
[px,py,pz]=pol2cart(theta,r,flip(spec1)); 
contourf(px,py,pz,[0.01 0.02 0.05:0.05:2],'linestyle','none');hold on%) %,'linecolor','w') %'linestyle','none');
caxis([0 1]);
colormap(jet);
cb=colorbar;
title(cb,['[m2 s rad-1]'],'fontsize',szf)

p1=plot([-x1 x1],[-y1 y1],'k:',[-y1 y1],[-x1 x1],'k:',[y1 -y1],[-x1 x1],'k:',[x1 -x1],[-y1 y1],'k:');
set(p1,'color',vc1)
hold on

t=linspace(0,2*pi);
dr=(2:4:30)/30;
div=length(dr);
for f=1:div-1
    plot(dr(f)*cos(t),dr(f)*sin(t),':','color',vc1)
    hold on
end
plot(dr(div)*cos(t),dr(div)*sin(t),'k')
hold on

% valores radiales
plot([0 rmax],[0 0],'-','LineWidth',2,'color',vc2)
a=dr(2:div)';
for i=1:length(a)
    plot([a(i) a(i)],[0 0.025],'-','LineWidth',2,'color',vc2)
    text(a(i)-0.18,0.09,num2str(dr(i)*30),'fontsize',szf,'color',vc2);
    hold on
end
text(0.2,-0.1,'Periodo [s]','fontsize',szf,'color',vc2);

%asignacion direcciones geograficas
text(-0.005,1.05*rmax,'N','FontSize',szf)
text(1.05*rmed,1.05*rmed,'NE','FontSize',szf)
text(1.02*rmax,0,'E','FontSize',szf)
text(1.05*rmed,-1.05*rmed,'SE','FontSize',szf)
text(-0.01,-1.05*rmax,'S','FontSize',szf)
text(-1.2*rmed,-1.05*rmed,'SO','FontSize',szf)
text(-1.1*rmax,0,'O','FontSize',szf)
text(-1.25*rmed,1.05*rmed,'NO','FontSize',szf)

box off
axis off
axis image

set(gca,'fontsize',szf)
pause(0.00001)
end

