% ejemplo para Diego -> batimetría triangular Chile central
% mapa Valpo - Leftraru

% GRILLA
clear all
close all

addpath /home/dernis/USB_WAVES_SCHOOL/TUTORIALS/TUTORIAL3/ %-> acá tengo el programa


it=0;
varname='dpt';
filename='ww3.201001_dpt.nc';               % This example uses a file with
                                                % with only hs in it
[tri,lat,lon,time,mat1,var1,unit1]=read_WWNC_UG_var(filename,varname);


trisurf(tri',lon,lat,mat1(:,100)) 
view(0,90); 
colormap jet; hcb=colorbar;
colorTitleHandle = get(hcb,'Title');
titleString = 'Depth (m)';
set(colorTitleHandle ,'String',titleString);
axis equal
axis tight
xlabel('Longitude','FontWeight','bold','FontName','Arial')
ylabel('Latitude','FontWeight','bold','FontName','Arial')
hold on
grid off
caxis([0 1000])
xlim([-73,-71.25])
ylim([-34.5,-32])
title('Triangular Mesh, central coast of Chile','FontWeight','bold','FontName','Arial')
