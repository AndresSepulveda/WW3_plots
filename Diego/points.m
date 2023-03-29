clear all
clc
hs=ncread('ww3.sur_tant_20211115.nc','hs');
dir=ncread('ww3.sur_tant_20211115.nc','th1m');
fp=ncread('ww3.sur_tant_20211115.nc','fp');
tp=1./fp;
time=ncread('ww3.sur_tant_20211115.nc','tr');

%% ROSAS DE PARÁMETROS DE OLEAJE
%axes1 = subplot(1, 2, 1); 
Options_hs = {'anglenorth', 0, 'angleeast', 90, 'labels', {'Norte', 'Este', 'Sur', 'Oeste'},...
    'freqlabelangle', 'ruler', 'ndirections', 24,'vwinds',[0.5 1 1.5 2],'titlestring',...
    'Rosa de Altura Significativa','lablegend','H_{m0} [m]','legendvariable','H_{m0}',...
    'scalefactor', 0.9,'figColor', 'w'};
%Options.AngleNorth = 0;
%Options.AngleEast = 90;
%Options.Labels = {'Norte','Este','Sur','Oeste'};
%Options.FreqLabelAngle = 'ruler';
%Options.ndirections = 24;
%Options.nSpeeds = 5;
%Options.vWinds=[0.5 1 1.5 1.5];
%Options.TitleString = {'Rosa de Altura Significativa de Oleaje en 43.71°S-73.92°W ';'Desde 15/11/2021 - 00:00:00 al 20/11/2021 - 00:00:00'};
%Options.LabLegend = 'H_{m0} [m]';
%Options.LegendVariable = 'H_{m0}';
%Options1=struct2cell(Options);
Options2_hs = [Options_hs, {'axes', subplot(1, 2, 1)}];
[figure_handle1,count1,speeds1,ndirections1,Table1] = WindRose(dir,hs,Options2_hs);

Options_tp = {'anglenorth', 0, 'angleeast', 90, 'labels', {'Norte', 'Este', 'Sur', 'Oeste'},...
    'freqlabelangle', 'ruler', 'ndirections', 24,'vwinds',[11 11.5 12 12.5 13],'titlestring',...
    'Rosa de Periodo Peak','lablegend','T_{p} [m]','legendvariable','T_{p}','scalefactor', 0.9,'figColor', 'w'};
% Options.Options2 = [Options, {'axes', subplot(1, 2, 2), 'cmap', 'parula'}];
% Options.AngleNorth = 0;
% Options.AngleEast = 90;
% Options.Labels = {'Norte','Este','Sur','Oeste'};
% Options.FreqLabelAngle = 'ruler';
% Options.ndirections = 24;
% %Options.nSpeeds = 4;
% Options.vWinds=[11 11.5 12 12.5 13];
% Options.TitleString = {'Rosa de Altura Significativa de Oleaje en 43.71°S-73.92°W ';'Desde 15/11/2021 - 00:00:00 al 20/11/2021 - 00:00:00'};
% Options.LabLegend = 'T_{p} [s]';
% Options.LegendVariable = 'T_{p}';
Options2_tp = [Options_tp, {'axes', subplot(1, 2, 2)}];
[figure_handle1,count2,speeds2,ndirections2,Table2] = WindRose(dir,tp,Options2_tp);

%exportgraphics(gcf,'Rosa_Hm0_Tp_4371S7392W.png','Resolution',600);