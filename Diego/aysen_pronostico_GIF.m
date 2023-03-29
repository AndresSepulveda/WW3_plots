clear all
clc
filename1='ww3.202111.nc';
[tri,lat,lon,time,hs,~,~]=read_WWNC_UG_var(filename1,'hs');
[tri1,lat1,lon1,time1,dir,~,~]=read_WWNC_UG_var(filename1,'dir');

%% GIF hs y dir
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'HS_DIR_LosLagos_Aysen_20211115.gif';
h=figure('color','w');
axes('Units', 'pixels', 'Position', [10, 10, 100, 200]);
kk=0;
for k=1:length(time) % LARGO DE TIME
%figure('color','w','visible','on')
kk=kk+1;
subplot 121
trisurf(tri',lon,lat,hs(:,k))
shading interp
view(0,90);                                   
colormap jet; hcbb=colorbar;
colorTitleHandle = get(hcbb,'Title');
titleString = '[m]';
set(colorTitleHandle ,'String',titleString);
%set(hcbb,'position',[.75 .1 .03 .75])
caxis([min(min(hs)),max(max(hs))]);
axis equal
axis tight
%xlabel('Longitude (°)','FontWeight','bold','FontName','Arial')
xlabel('Longitud [°]','FontWeight','bold','FontName','Arial','FontSize',9)
ylabel('Latitud [°]','FontWeight','bold','FontName','Arial','FontSize',9)
grid off
title({'Altura Significativa de Oleaje'},'fontsize',7);

text(0.01,0.01, datestr(time(k)), ...
     'Units', 'normalized', ...   % Not depending on the data
     'HorizontalAlignment', 'left', ...
     'VerticalAlignment', 'bottom');
%%
subplot 122
trisurf(tri1',lon1,lat1,dir(:,k))
shading interp
view(0,90);                                   
colormap jet; hcbbb=colorbar('Ticks',[45, 90, 135, 180, 225, 270, 315, 359.9926],...
         'TickLabels',{'NE', 'E', 'SE', 'S', 'SO', 'O', 'NO', 'N'});
%set('hcbbb', 'Ticks', [90, 180, 270, 359.9926], 'TickLabels', {'E', 'S', 'O', 'N'}, 'Interpreter', 'tex')
colorTitleHandle = get(hcbbb,'Title');
titleString = '[°]';
set(colorTitleHandle ,'String',titleString);
%set(hcbbb,'position',[.75 .1 .03 .75])
caxis([min(min(dir)),max(max(dir))]);
axis equal
axis tight
%xlabel('Longitude (°)','FontWeight','bold','FontName','Arial')
xlabel('Longitud [°]','FontWeight','bold','FontName','Arial','FontSize',9)
ylabel('Latitud [°]','FontWeight','bold','FontName','Arial','FontSize',9)
grid off
title({'Dirección Media de Oleaje'},'fontsize',7);
sgt = sgtitle({' ',' ',' ',' ',' ',' Pronóstico Región de Los Lagos y Región de Aysén - Chile','Desde 15/11/2021 - 00:00:00 al 20/11/2021 - 00:00:00'},'FontWeight','bold','FontName','Arial','FontSize',8);

text(0.01,0.01, datestr(time(k)), ...
     'Units', 'normalized', ...   % Not depending on the data
     'HorizontalAlignment', 'left', ...
     'VerticalAlignment', 'bottom');
% Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File
if kk == 1
          %[imind, cm] = rgb2ind(im,256);
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',1); 
else 
          %imind = rgb2ind(im, cm);
          imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',1); 
end
end