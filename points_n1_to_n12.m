clc
clear all
path(path,'/home/diego/Escritorio/m_map');

%% TIME
time=ncread('ww3.n1_1989_spec.nc','time');
%% POINTS
% frecuency
freq_n=ncread('ww3.n1_1989_spec.nc','frequency');
% direction
dir_n=ncread('ww3.n1_1989_spec.nc','direction');
% directinal-espectral energy
E_n1=ncread('ww3.n1_1989_spec.nc','efth'); E_n1=squeeze(E_n1);
E_n2=ncread('ww3.n2_1989_spec.nc','efth'); E_n2=squeeze(E_n2);
E_n3=ncread('ww3.n3_1989_spec.nc','efth'); E_n3=squeeze(E_n3);
E_n4=ncread('ww3.n4_1989_spec.nc','efth'); E_n4=squeeze(E_n4);
E_n5=ncread('ww3.n5_1989_spec.nc','efth'); E_n5=squeeze(E_n5);
E_n6=ncread('ww3.n6_1989_spec.nc','efth'); E_n6=squeeze(E_n6);
E_n7=ncread('ww3.n7_1989_spec.nc','efth'); E_n7=squeeze(E_n7);
E_n8=ncread('ww3.n8_1989_spec.nc','efth'); E_n8=squeeze(E_n8);
E_n9=ncread('ww3.n9_1989_spec.nc','efth'); E_n9=squeeze(E_n9);
E_n10=ncread('ww3.n10_1989_spec.nc','efth'); E_n10=squeeze(E_n10);
E_n11=ncread('ww3.n11_1989_spec.nc','efth'); E_n11=squeeze(E_n11);
E_n12=ncread('ww3.n12_1989_spec.nc','efth'); E_n12=squeeze(E_n12);
%E112=permute(squeeze(E11),[2 1 3]);

%% Por mes
mes_i={'01-Jan-1989 00:00:00','01-Feb-1989 00:00:00','01-Mar-1989 00:00:00','01-Apr-1989 00:00:00','01-May-1989 00:00:00','01-Jun-1989 00:00:00'};
mes_f={'31-Jan-1989 23:00:00','28-Feb-1989 23:00:00','31-Mar-1989 23:00:00','30-Apr-1989 23:00:00','31-May-1989 23:00:00','30-Jun-1989 23:00:00'};
tt = datetime(1990,1,1,0,0,0.0) + days(time); tt=cellstr(tt);
mes_ii = getnameidx(tt, mes_i); mes_ff = getnameidx(tt, mes_f); pos_mes=[mes_ii; mes_ff];
ENE_pos=pos_mes(1,1):pos_mes(2,1);
FEB_pos=pos_mes(1,2):pos_mes(2,2);
MAR_pos=pos_mes(1,3):pos_mes(2,3);
ABR_pos=pos_mes(1,4):pos_mes(2,4);
MAY_pos=pos_mes(1,5):pos_mes(2,5);
JUN_pos=pos_mes(1,6):pos_mes(2,6);

%% meses para N1
E_n1_ene=squeeze(mean(E_n1(:,:,ENE_pos),3));% (cada 1 horas)
E_n1_feb=squeeze(mean(E_n1(:,:,FEB_pos),3));% (cada 1 horas)
E_n1_mar=squeeze(mean(E_n1(:,:,MAR_pos),3));% (cada 1 horas)
E_n1_abr=squeeze(mean(E_n1(:,:,ABR_pos),3));% (cada 1 horas)
E_n1_may=squeeze(mean(E_n1(:,:,MAY_pos),3));% (cada 1 horas)
E_n1_jun=squeeze(mean(E_n1(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N2
E_n2_ene=squeeze(mean(E_n2(:,:,ENE_pos),3));% (cada 1 horas)
E_n2_feb=squeeze(mean(E_n2(:,:,FEB_pos),3));% (cada 1 horas)
E_n2_mar=squeeze(mean(E_n2(:,:,MAR_pos),3));% (cada 1 horas)
E_n2_abr=squeeze(mean(E_n2(:,:,ABR_pos),3));% (cada 1 horas)
E_n2_may=squeeze(mean(E_n2(:,:,MAY_pos),3));% (cada 1 horas)
E_n2_jun=squeeze(mean(E_n2(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N3
E_n3_ene=squeeze(mean(E_n3(:,:,ENE_pos),3));% (cada 1 horas)
E_n3_feb=squeeze(mean(E_n3(:,:,FEB_pos),3));% (cada 1 horas)
E_n3_mar=squeeze(mean(E_n3(:,:,MAR_pos),3));% (cada 1 horas)
E_n3_abr=squeeze(mean(E_n3(:,:,ABR_pos),3));% (cada 1 horas)
E_n3_may=squeeze(mean(E_n3(:,:,MAY_pos),3));% (cada 1 horas)
E_n3_jun=squeeze(mean(E_n3(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N4
E_n4_ene=squeeze(mean(E_n4(:,:,ENE_pos),3));% (cada 1 horas)
E_n4_feb=squeeze(mean(E_n4(:,:,FEB_pos),3));% (cada 1 horas)
E_n4_mar=squeeze(mean(E_n4(:,:,MAR_pos),3));% (cada 1 horas)
E_n4_abr=squeeze(mean(E_n4(:,:,ABR_pos),3));% (cada 1 horas)
E_n4_may=squeeze(mean(E_n4(:,:,MAY_pos),3));% (cada 1 horas)
E_n4_jun=squeeze(mean(E_n4(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N5
E_n5_ene=squeeze(mean(E_n5(:,:,ENE_pos),3));% (cada 1 horas)
E_n5_feb=squeeze(mean(E_n5(:,:,FEB_pos),3));% (cada 1 horas)
E_n5_mar=squeeze(mean(E_n5(:,:,MAR_pos),3));% (cada 1 horas)
E_n5_abr=squeeze(mean(E_n5(:,:,ABR_pos),3));% (cada 1 horas)
E_n5_may=squeeze(mean(E_n5(:,:,MAY_pos),3));% (cada 1 horas)
E_n5_jun=squeeze(mean(E_n5(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N6
E_n6_ene=squeeze(mean(E_n6(:,:,ENE_pos),3));% (cada 1 horas)
E_n6_feb=squeeze(mean(E_n6(:,:,FEB_pos),3));% (cada 1 horas)
E_n6_mar=squeeze(mean(E_n6(:,:,MAR_pos),3));% (cada 1 horas)
E_n6_abr=squeeze(mean(E_n6(:,:,ABR_pos),3));% (cada 1 horas)
E_n6_may=squeeze(mean(E_n6(:,:,MAY_pos),3));% (cada 1 horas)
E_n6_jun=squeeze(mean(E_n6(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N7
E_n7_ene=squeeze(mean(E_n7(:,:,ENE_pos),3));% (cada 1 horas)
E_n7_feb=squeeze(mean(E_n7(:,:,FEB_pos),3));% (cada 1 horas)
E_n7_mar=squeeze(mean(E_n7(:,:,MAR_pos),3));% (cada 1 horas)
E_n7_abr=squeeze(mean(E_n7(:,:,ABR_pos),3));% (cada 1 horas)
E_n7_may=squeeze(mean(E_n7(:,:,MAY_pos),3));% (cada 1 horas)
E_n7_jun=squeeze(mean(E_n7(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N8
E_n8_ene=squeeze(mean(E_n8(:,:,ENE_pos),3));% (cada 1 horas)
E_n8_feb=squeeze(mean(E_n8(:,:,FEB_pos),3));% (cada 1 horas)
E_n8_mar=squeeze(mean(E_n8(:,:,MAR_pos),3));% (cada 1 horas)
E_n8_abr=squeeze(mean(E_n8(:,:,ABR_pos),3));% (cada 1 horas)
E_n8_may=squeeze(mean(E_n8(:,:,MAY_pos),3));% (cada 1 horas)
E_n8_jun=squeeze(mean(E_n8(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N9
E_n9_ene=squeeze(mean(E_n9(:,:,ENE_pos),3));% (cada 1 horas)
E_n9_feb=squeeze(mean(E_n9(:,:,FEB_pos),3));% (cada 1 horas)
E_n9_mar=squeeze(mean(E_n9(:,:,MAR_pos),3));% (cada 1 horas)
E_n9_abr=squeeze(mean(E_n9(:,:,ABR_pos),3));% (cada 1 horas)
E_n9_may=squeeze(mean(E_n9(:,:,MAY_pos),3));% (cada 1 horas)
E_n9_jun=squeeze(mean(E_n9(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N10
E_n10_ene=squeeze(mean(E_n10(:,:,ENE_pos),3));% (cada 1 horas)
E_n10_feb=squeeze(mean(E_n10(:,:,FEB_pos),3));% (cada 1 horas)
E_n10_mar=squeeze(mean(E_n10(:,:,MAR_pos),3));% (cada 1 horas)
E_n10_abr=squeeze(mean(E_n10(:,:,ABR_pos),3));% (cada 1 horas)
E_n10_may=squeeze(mean(E_n10(:,:,MAY_pos),3));% (cada 1 horas)
E_n10_jun=squeeze(mean(E_n10(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N11
E_n11_ene=squeeze(mean(E_n11(:,:,ENE_pos),3));% (cada 1 horas)
E_n11_feb=squeeze(mean(E_n11(:,:,FEB_pos),3));% (cada 1 horas)
E_n11_mar=squeeze(mean(E_n11(:,:,MAR_pos),3));% (cada 1 horas)
E_n11_abr=squeeze(mean(E_n11(:,:,ABR_pos),3));% (cada 1 horas)
E_n11_may=squeeze(mean(E_n11(:,:,MAY_pos),3));% (cada 1 horas)
E_n11_jun=squeeze(mean(E_n11(:,:,JUN_pos),3));% (cada 1 horas)

%% meses para N12
E_n12_ene=squeeze(mean(E_n12(:,:,ENE_pos),3));% (cada 1 horas)
E_n12_feb=squeeze(mean(E_n12(:,:,FEB_pos),3));% (cada 1 horas)
E_n12_mar=squeeze(mean(E_n12(:,:,MAR_pos),3));% (cada 1 horas)
E_n12_abr=squeeze(mean(E_n12(:,:,ABR_pos),3));% (cada 1 horas)
E_n12_may=squeeze(mean(E_n12(:,:,MAY_pos),3));% (cada 1 horas)
E_n12_jun=squeeze(mean(E_n12(:,:,JUN_pos),3));% (cada 1 horas)

%% FIGURAS DE CADA MES PARA TODOS LOS PUNTOS ESPECTRALES
%% ENERO
%FigH1 = figure('color','w','Position', get(0, 'Screensize'));
figure('color','w','Position', get(0, 'Screensize'));
subplot 341
[xx yy]=PolarContour(E_n1_ene,freq_n,dir_n);
c1=colorbar;
caxis([0 max(max(E_n1_ene))]);
colorTitleHandle = get(c1,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N1 77°W-41.5°S',' '})

subplot 342
[xxx yyy]=PolarContour(E_n2_ene,freq_n,dir_n);
c11=colorbar;
caxis([0 max(max(E_n2_ene))]);
colorTitleHandle = get(c11,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N2 77°W-42°S',' '})

subplot 343
[xxxx yyyy]=PolarContour(E_n3_ene,freq_n,dir_n);
c111=colorbar;
caxis([0 max(max(E_n3_ene))]);
colorTitleHandle = get(c111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N3 77°W-42.5°S',' '})

subplot 344
[xxxxx yyyyy]=PolarContour(E_n4_ene,freq_n,dir_n);
c1111=colorbar;
caxis([0 max(max(E_n4_ene))]);
colorTitleHandle = get(c1111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N4 77°W-43°S',' '})

subplot 345
[xxxxxx yyyyyy]=PolarContour(E_n5_ene,freq_n,dir_n);
c11111=colorbar;
caxis([0 max(max(E_n5_ene))]);
colorTitleHandle = get(c11111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N5 77°W-43.5°S',' '})

subplot 346
[xxxxxxx yyyyyyy]=PolarContour(E_n6_ene,freq_n,dir_n);
c111111=colorbar;
caxis([0 max(max(E_n6_ene))]);
colorTitleHandle = get(c111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N6 77°W-44°S',' '})

subplot 347
[x y]=PolarContour(E_n7_ene,freq_n,dir_n);
c1111111=colorbar;
caxis([0 max(max(E_n7_ene))]);
colorTitleHandle = get(c1111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N7 77°W-44.5°S',' '})

subplot 348
[x1 y1]=PolarContour(E_n8_ene,freq_n,dir_n);
c11111111=colorbar;
caxis([0 max(max(E_n8_ene))]);
colorTitleHandle = get(c11111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N8 77°W-45°S',' '})

subplot 349
[x11 y11]=PolarContour(E_n9_ene,freq_n,dir_n);
c111111111=colorbar;
caxis([0 max(max(E_n9_ene))]);
colorTitleHandle = get(c111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N9 77°W-45.5°S',' '})

subplot(3,4,10)
[x111 y111]=PolarContour(E_n10_ene,freq_n,dir_n);
c1111111111=colorbar;
caxis([0 max(max(E_n10_ene))]);
colorTitleHandle = get(c1111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N10 77°W-46°S',' '})

subplot(3,4,11)
[x1111 y1111]=PolarContour(E_n11_ene,freq_n,dir_n);
c11111111111=colorbar;
caxis([0 max(max(E_n11_ene))]);
colorTitleHandle = get(c11111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N11 77°W-46.5°S',' '});

subplot(3,4,12)
[x11111 y11111]=PolarContour(E_n12_ene,freq_n,dir_n);
c111111111111=colorbar;
caxis([0 max(max(E_n12_ene))]);
colorTitleHandle = get(c111111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N12 77°W-47°S',' '});
%t.FontSize = 8;
subtitle('ENERO - 1989 - PUNTOS ESPECTRALES DEL OCÉANO PACÍFICO')




%% FEBRERO
figure('color','w','Position', get(0, 'Screensize'));
subplot 341
[xx yy]=PolarContour(E_n1_feb,freq_n,dir_n);
c1=colorbar;
caxis([0 max(max(E_n1_feb))]);
colorTitleHandle = get(c1,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N1 77°W-41.5°S',' '})

subplot 342
[xxx yyy]=PolarContour(E_n2_feb,freq_n,dir_n);
c11=colorbar;
caxis([0 max(max(E_n2_feb))]);
colorTitleHandle = get(c11,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N2 77°W-42°S',' '})

subplot 343
[xxxx yyyy]=PolarContour(E_n3_feb,freq_n,dir_n);
c111=colorbar;
caxis([0 max(max(E_n3_feb))]);
colorTitleHandle = get(c111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N3 77°W-42.5°S',' '})

subplot 344
[xxxxx yyyyy]=PolarContour(E_n4_feb,freq_n,dir_n);
c1111=colorbar;
caxis([0 max(max(E_n4_feb))]);
colorTitleHandle = get(c1111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N4 77°W-43°S',' '})

subplot 345
[xxxxxx yyyyyy]=PolarContour(E_n5_feb,freq_n,dir_n);
c11111=colorbar;
caxis([0 max(max(E_n5_feb))]);
colorTitleHandle = get(c11111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N5 77°W-43.5°S',' '})

subplot 346
[xxxxxxx yyyyyyy]=PolarContour(E_n6_feb,freq_n,dir_n);
c111111=colorbar;
caxis([0 max(max(E_n6_feb))]);
colorTitleHandle = get(c111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N6 77°W-44°S',' '})

subplot 347
[x y]=PolarContour(E_n7_feb,freq_n,dir_n);
c1111111=colorbar;
caxis([0 max(max(E_n7_feb))]);
colorTitleHandle = get(c1111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N7 77°W-44.5°S',' '})

subplot 348
[x1 y1]=PolarContour(E_n8_feb,freq_n,dir_n);
c11111111=colorbar;
caxis([0 max(max(E_n8_feb))]);
colorTitleHandle = get(c11111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N8 77°W-45°S',' '})

subplot 349
[x11 y11]=PolarContour(E_n9_feb,freq_n,dir_n);
c111111111=colorbar;
caxis([0 max(max(E_n9_feb))]);
colorTitleHandle = get(c111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N9 77°W-45.5°S',' '})

subplot(3,4,10)
[x111 y111]=PolarContour(E_n10_feb,freq_n,dir_n);
c1111111111=colorbar;
caxis([0 max(max(E_n10_feb))]);
colorTitleHandle = get(c1111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N10 77°W-46°S',' '})

subplot(3,4,11)
[x1111 y1111]=PolarContour(E_n11_feb,freq_n,dir_n);
c11111111111=colorbar;
caxis([0 max(max(E_n11_feb))]);
colorTitleHandle = get(c11111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N11 77°W-46.5°S',' '});

subplot(3,4,12)
[x11111 y11111]=PolarContour(E_n12_feb,freq_n,dir_n);
c111111111111=colorbar;
caxis([0 max(max(E_n12_feb))]);
colorTitleHandle = get(c111111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N12 77°W-47°S',' '});
%t.FontSize = 8;
subtitle('FEBRERO - 1989 - PUNTOS ESPECTRALES DEL OCÉANO PACÍFICO')



%% MARZO
figure('color','w','Position', get(0, 'Screensize'));
subplot 341
[xx yy]=PolarContour(E_n1_mar,freq_n,dir_n);
c1=colorbar;
caxis([0 max(max(E_n1_mar))]);
colorTitleHandle = get(c1,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N1 77°W-41.5°S',' '})

subplot 342
[xxx yyy]=PolarContour(E_n2_mar,freq_n,dir_n);
c11=colorbar;
caxis([0 max(max(E_n2_mar))]);
colorTitleHandle = get(c11,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N2 77°W-42°S',' '})

subplot 343
[xxxx yyyy]=PolarContour(E_n3_mar,freq_n,dir_n);
c111=colorbar;
caxis([0 max(max(E_n3_mar))]);
colorTitleHandle = get(c111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N3 77°W-42.5°S',' '})

subplot 344
[xxxxx yyyyy]=PolarContour(E_n4_mar,freq_n,dir_n);
c1111=colorbar;
caxis([0 max(max(E_n4_mar))]);
colorTitleHandle = get(c1111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N4 77°W-43°S',' '})

subplot 345
[xxxxxx yyyyyy]=PolarContour(E_n5_mar,freq_n,dir_n);
c11111=colorbar;
caxis([0 max(max(E_n5_mar))]);
colorTitleHandle = get(c11111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N5 77°W-43.5°S',' '})

subplot 346
[xxxxxxx yyyyyyy]=PolarContour(E_n6_mar,freq_n,dir_n);
c111111=colorbar;
caxis([0 max(max(E_n6_mar))]);
colorTitleHandle = get(c111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N6 77°W-44°S',' '})

subplot 347
[x y]=PolarContour(E_n7_mar,freq_n,dir_n);
c1111111=colorbar;
caxis([0 max(max(E_n7_mar))]);
colorTitleHandle = get(c1111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N7 77°W-44.5°S',' '})

subplot 348
[x1 y1]=PolarContour(E_n8_mar,freq_n,dir_n);
c11111111=colorbar;
caxis([0 max(max(E_n8_mar))]);
colorTitleHandle = get(c11111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N8 77°W-45°S',' '})

subplot 349
[x11 y11]=PolarContour(E_n9_mar,freq_n,dir_n);
c111111111=colorbar;
caxis([0 max(max(E_n9_mar))]);
colorTitleHandle = get(c111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N9 77°W-45.5°S',' '})

subplot(3,4,10)
[x111 y111]=PolarContour(E_n10_mar,freq_n,dir_n);
c1111111111=colorbar;
caxis([0 max(max(E_n10_mar))]);
colorTitleHandle = get(c1111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N10 77°W-46°S',' '})

subplot(3,4,11)
[x1111 y1111]=PolarContour(E_n11_mar,freq_n,dir_n);
c11111111111=colorbar;
caxis([0 max(max(E_n11_mar))]);
colorTitleHandle = get(c11111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N11 77°W-46.5°S',' '});

subplot(3,4,12)
[x11111 y11111]=PolarContour(E_n12_mar,freq_n,dir_n);
c111111111111=colorbar;
caxis([0 max(max(E_n12_mar))]);
colorTitleHandle = get(c111111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N12 77°W-47°S',' '});
%t.FontSize = 8;
subtitle('MARZO - 1989 - PUNTOS ESPECTRALES DEL OCÉANO PACÍFICO')



%% ABRIL
figure('color','w','Position', get(0, 'Screensize'));
subplot 341
[xx yy]=PolarContour(E_n1_abr,freq_n,dir_n);
c1=colorbar;
caxis([0 max(max(E_n1_abr))]);
colorTitleHandle = get(c1,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N1 77°W-41.5°S',' '})

subplot 342
[xxx yyy]=PolarContour(E_n2_abr,freq_n,dir_n);
c11=colorbar;
caxis([0 max(max(E_n2_abr))]);
colorTitleHandle = get(c11,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N2 77°W-42°S',' '})

subplot 343
[xxxx yyyy]=PolarContour(E_n3_abr,freq_n,dir_n);
c111=colorbar;
caxis([0 max(max(E_n3_abr))]);
colorTitleHandle = get(c111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N3 77°W-42.5°S',' '})

subplot 344
[xxxxx yyyyy]=PolarContour(E_n4_abr,freq_n,dir_n);
c1111=colorbar;
caxis([0 max(max(E_n4_abr))]);
colorTitleHandle = get(c1111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N4 77°W-43°S',' '})

subplot 345
[xxxxxx yyyyyy]=PolarContour(E_n5_abr,freq_n,dir_n);
c11111=colorbar;
caxis([0 max(max(E_n5_abr))]);
colorTitleHandle = get(c11111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N5 77°W-43.5°S',' '})

subplot 346
[xxxxxxx yyyyyyy]=PolarContour(E_n6_abr,freq_n,dir_n);
c111111=colorbar;
caxis([0 max(max(E_n6_abr))]);
colorTitleHandle = get(c111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N6 77°W-44°S',' '})

subplot 347
[x y]=PolarContour(E_n7_abr,freq_n,dir_n);
c1111111=colorbar;
caxis([0 max(max(E_n7_abr))]);
colorTitleHandle = get(c1111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N7 77°W-44.5°S',' '})

subplot 348
[x1 y1]=PolarContour(E_n8_abr,freq_n,dir_n);
c11111111=colorbar;
caxis([0 max(max(E_n8_abr))]);
colorTitleHandle = get(c11111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N8 77°W-45°S',' '})

subplot 349
[x11 y11]=PolarContour(E_n9_abr,freq_n,dir_n);
c111111111=colorbar;
caxis([0 max(max(E_n9_abr))]);
colorTitleHandle = get(c111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N9 77°W-45.5°S',' '})

subplot(3,4,10)
[x111 y111]=PolarContour(E_n10_abr,freq_n,dir_n);
c1111111111=colorbar;
caxis([0 max(max(E_n10_abr))]);
colorTitleHandle = get(c1111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N10 77°W-46°S',' '})

subplot(3,4,11)
[x1111 y1111]=PolarContour(E_n11_abr,freq_n,dir_n);
c11111111111=colorbar;
caxis([0 max(max(E_n11_abr))]);
colorTitleHandle = get(c11111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N11 77°W-46.5°S',' '});

subplot(3,4,12)
[x11111 y11111]=PolarContour(E_n12_abr,freq_n,dir_n);
c111111111111=colorbar;
caxis([0 max(max(E_n12_abr))]);
colorTitleHandle = get(c111111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N12 77°W-47°S',' '});
%t.FontSize = 8;
subtitle('ABRIL - 1989 - PUNTOS ESPECTRALES DEL OCÉANO PACÍFICO')



%% MAYO
figure('color','w','Position', get(0, 'Screensize'));
subplot 341
[xx yy]=PolarContour(E_n1_may,freq_n,dir_n);
c1=colorbar;
caxis([0 max(max(E_n1_may))]);
colorTitleHandle = get(c1,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N1 77°W-41.5°S',' '})

subplot 342
[xxx yyy]=PolarContour(E_n2_may,freq_n,dir_n);
c11=colorbar;
caxis([0 max(max(E_n2_may))]);
colorTitleHandle = get(c11,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N2 77°W-42°S',' '})

subplot 343
[xxxx yyyy]=PolarContour(E_n3_may,freq_n,dir_n);
c111=colorbar;
caxis([0 max(max(E_n3_may))]);
colorTitleHandle = get(c111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N3 77°W-42.5°S',' '})

subplot 344
[xxxxx yyyyy]=PolarContour(E_n4_may,freq_n,dir_n);
c1111=colorbar;
caxis([0 max(max(E_n4_may))]);
colorTitleHandle = get(c1111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N4 77°W-43°S',' '})

subplot 345
[xxxxxx yyyyyy]=PolarContour(E_n5_may,freq_n,dir_n);
c11111=colorbar;
caxis([0 max(max(E_n5_may))]);
colorTitleHandle = get(c11111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N5 77°W-43.5°S',' '})

subplot 346
[xxxxxxx yyyyyyy]=PolarContour(E_n6_may,freq_n,dir_n);
c111111=colorbar;
caxis([0 max(max(E_n6_may))]);
colorTitleHandle = get(c111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N6 77°W-44°S',' '})

subplot 347
[x y]=PolarContour(E_n7_may,freq_n,dir_n);
c1111111=colorbar;
caxis([0 max(max(E_n7_may))]);
colorTitleHandle = get(c1111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N7 77°W-44.5°S',' '})

subplot 348
[x1 y1]=PolarContour(E_n8_may,freq_n,dir_n);
c11111111=colorbar;
caxis([0 max(max(E_n8_may))]);
colorTitleHandle = get(c11111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N8 77°W-45°S',' '})

subplot 349
[x11 y11]=PolarContour(E_n9_may,freq_n,dir_n);
c111111111=colorbar;
caxis([0 max(max(E_n9_may))]);
colorTitleHandle = get(c111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N9 77°W-45.5°S',' '})

subplot(3,4,10)
[x111 y111]=PolarContour(E_n10_may,freq_n,dir_n);
c1111111111=colorbar;
caxis([0 max(max(E_n10_may))]);
colorTitleHandle = get(c1111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N10 77°W-46°S',' '})

subplot(3,4,11)
[x1111 y1111]=PolarContour(E_n11_may,freq_n,dir_n);
c11111111111=colorbar;
caxis([0 max(max(E_n11_may))]);
colorTitleHandle = get(c11111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N11 77°W-46.5°S',' '});

subplot(3,4,12)
[x11111 y11111]=PolarContour(E_n12_may,freq_n,dir_n);
c111111111111=colorbar;
caxis([0 max(max(E_n12_may))]);
colorTitleHandle = get(c111111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N12 77°W-47°S',' '});
%t.FontSize = 8;
subtitle('MAYO - 1989 - PUNTOS ESPECTRALES DEL OCÉANO PACÍFICO')



%% JUNIO
figure('color','w','Position', get(0, 'Screensize'));
subplot 341
[xx yy]=PolarContour(E_n1_jun,freq_n,dir_n);
c1=colorbar;
caxis([0 max(max(E_n1_jun))]);
colorTitleHandle = get(c1,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N1 77°W-41.5°S',' '})

subplot 342
[xxx yyy]=PolarContour(E_n2_jun,freq_n,dir_n);
c11=colorbar;
caxis([0 max(max(E_n2_jun))]);
colorTitleHandle = get(c11,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N2 77°W-42°S',' '})

subplot 343
[xxxx yyyy]=PolarContour(E_n3_jun,freq_n,dir_n);
c111=colorbar;
caxis([0 max(max(E_n3_jun))]);
colorTitleHandle = get(c111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N3 77°W-42.5°S',' '})

subplot 344
[xxxxx yyyyy]=PolarContour(E_n4_jun,freq_n,dir_n);
c1111=colorbar;
caxis([0 max(max(E_n4_jun))]);
colorTitleHandle = get(c1111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N4 77°W-43°S',' '})

subplot 345
[xxxxxx yyyyyy]=PolarContour(E_n5_jun,freq_n,dir_n);
c11111=colorbar;
caxis([0 max(max(E_n5_jun))]);
colorTitleHandle = get(c11111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N5 77°W-43.5°S',' '})

subplot 346
[xxxxxxx yyyyyyy]=PolarContour(E_n6_jun,freq_n,dir_n);
c111111=colorbar;
caxis([0 max(max(E_n6_jun))]);
colorTitleHandle = get(c111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N6 77°W-44°S',' '})

subplot 347
[x y]=PolarContour(E_n7_jun,freq_n,dir_n);
c1111111=colorbar;
caxis([0 max(max(E_n7_jun))]);
colorTitleHandle = get(c1111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N7 77°W-44.5°S',' '})

subplot 348
[x1 y1]=PolarContour(E_n8_jun,freq_n,dir_n);
c11111111=colorbar;
caxis([0 max(max(E_n8_jun))]);
colorTitleHandle = get(c11111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N8 77°W-45°S',' '})

subplot 349
[x11 y11]=PolarContour(E_n9_jun,freq_n,dir_n);
c111111111=colorbar;
caxis([0 max(max(E_n9_jun))]);
colorTitleHandle = get(c111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N9 77°W-45.5°S',' '})

subplot(3,4,10)
[x111 y111]=PolarContour(E_n10_jun,freq_n,dir_n);
c1111111111=colorbar;
caxis([0 max(max(E_n10_jun))]);
colorTitleHandle = get(c1111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N10 77°W-46°S',' '})

subplot(3,4,11)
[x1111 y1111]=PolarContour(E_n11_jun,freq_n,dir_n);
c11111111111=colorbar;
caxis([0 max(max(E_n11_jun))]);
colorTitleHandle = get(c11111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N11 77°W-46.5°S',' '});

subplot(3,4,12)
[x11111 y11111]=PolarContour(E_n12_jun,freq_n,dir_n);
c111111111111=colorbar;
caxis([0 max(max(E_n12_jun))]);
colorTitleHandle = get(c111111111111,'Title');
titleString = 'DEE (m^2s/°)';
set(colorTitleHandle,'String',titleString,'FontWeight','bold','FontName','Arial');
title({'N12 77°W-47°S',' '});
%t.FontSize = 8;
subtitle('JUNIO - 1989 - PUNTOS ESPECTRALES DEL OCÉANO PACÍFICO')