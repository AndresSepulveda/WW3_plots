%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Create and fill WW3 files with GFS data.
% for a forecast run simulations using WW3TOOLS
% 
%  This file is part of WW3TOOLS
%
%  WW3TOOLS is free software; you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published
%  by the Free Software Foundation; either version 2 of the License,
%  or (at your option) any later version.
%
%  WW3TOOLS is distributed in the hope that it will be useful, but
%  WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program; if not, write to the Free Software
%  Foundation, Inc., 59 Temple Place, Suite 330, Boston,
%  MA  02111-1307  USA
%
%  The on-line reference to GFS is at
%  http://nomad3.ncep.noaa.gov/
%
%  Copyright (c) 2011-2012 by Patrick Marchesiello 
%  e-mail:patrick.marchesiello@ird.fr  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Common parameters
%
start
%
Roa=0;
%
tic
%
it = 1; % increment time index (it=1 --> 3h; it=2 --> 6h)
%
FRCST_dir= [pwd,'/'];
Yorig=0000; % 0000 -> matlab time
%
% model limits
lonmin=-120; lonmax=-68; latmin=-65; latmax=-15;
res=0.5;
%
makeplot = 0;
%
%
% Get the GFS grid 
% 
%gfs_name
nc=netcdf('GFS.nc','r');
lon1=nc{'longitude'}(:)-360.;
lat1=nc{'latitude'}(:);
time=nc{'time'}(:)/24+datenum(2011,5,6,0,0,0);;
tlen=length(time);
%
% Make WW3 grid
%
[lon,lat]=meshgrid(lonmin:res:lonmax,latmin:res:latmax);
%
% Loop on time
%
missval=nan;
default=nan;
nx=size(lon);
ny=size(lat);
fid=fopen('GFS_WW3.ascii','w');

for l=1:tlen
  disp(['time index: ',num2str(l),' of total: ',num2str(tlen)])
  
  var=squeeze(nc{'ugrd10m'}(l,:,:));
  if mean(mean(isnan(var)~=1))
    var=get_missing_val(lon1,lat1,var,missval,Roa,default);
    u10=interp2(lon1,lat1,var,lon,lat);
  else
    var=squeeze(nc{'ugrd10m'}(l-1,:,:));
    var=get_missing_val(lon1,lat1,var,missval,Roa,default);
    u10=interp2(lon1,lat1,var,lon,lat);
  end
  var=squeeze(nc{'vgrd10m'}(l,:,:));
  if mean(mean(isnan(var)~=1))
    var=get_missing_val(lon1,lat1,var,missval,Roa,default);
    v10=interp2(lon1,lat1,var,lon,lat);
  else
    var=squeeze(nc{'vgrd10m'}(l-1,:,:));
    var=get_missing_val(lon1,lat1,var,missval,Roa,default);
    v10=interp2(lon1,lat1,var,lon,lat);
  end

%
% Write ascii wind file for WAVEWATCH III
%
  yyyymmddTHHMMSS=datestr(time(l),30);
  yyyymmdd=yyyymmddTHHMMSS(1:8);
  hhmmss=yyyymmddTHHMMSS(10:15);
  fprintf(fid, '%s %s\n',yyyymmdd,hhmmss);
  [Ny,Nx] = size(u10);
  for j = 1:Ny
      a = u10(j,:);
      fprintf(fid,' %8.4f ',a);
      fprintf(fid,'\n');
  end;
  for j = 1:Ny
      a = v10(j,:);
      fprintf(fid,' %8.4f ',a);
      fprintf(fid,'\n');
  end;

end
% 
fclose(fid);
close(nc)

%---------------------------------------------------------------
% Make a few plots
%---------------------------------------------------------------
makeplot=0;
if makeplot==1
  disp(' ')
  disp(' Make a few plots...')
  slides=[10 12 14 16]; 
  test_forcing(gfs_name,grdname,'u10',slides,3,coastfileplot)
  figure
  test_forcing(gfs_name,grdname,'v10',slides,3,coastfileplot)
  figure
  test_forcing(gfs_name,grdname,'tair',slides,3,coastfileplot)
  figure
  test_forcing(gfs_name,grdname,'skt',slides,3,coastfileplot)
end


toc








