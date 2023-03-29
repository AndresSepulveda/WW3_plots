
function [lat,lon,time,mat1,mat2,mat3,var1,var2,var3,unit1,unit2,unit3]=read_WWNC(filename,date1,lon1,lat1)
%
% Reads all or a subsed of a NetCDF file. 
% If date1 is specified: takes only the closest dates in the file
% if lon1 is specificied: takes only the closest longitude ... 

%
% 1. Opens file and gets dimensions of arrays
%
  fid=netcdf.open(filename,'NC_NOWRITE');
  [ndims,nvars,ngatts,unlimdimid]=netcdf.inq(fid);
  [d0,nx]=netcdf.inqDim(fid,ndims-3);
  [d1,ny]=netcdf.inqDim(fid,ndims-2);
  [d2,nt]=netcdf.inqDim(fid,ndims-1);
  v0=netcdf.inqVar(fid,0);
  if (v0=='x') 
      varlon=0
      varlat=1
  else
  varlon = netcdf.inqVarID(fid,'longitude');
  varlat = netcdf.inqVarID(fid,'latitude');
  end
  lon=netcdf.getvar(fid,varlon);
  lat=netcdf.getvar(fid,varlat);
%
% We assume that the date reference is 1 Jan 1990. 
% This is normally written in the time attributes        
%
  time0=datenum(1990,1,1);
  vartime = netcdf.inqVarID(fid,'time');
  time=netcdf.getvar(fid,vartime)+time0;
  varids=[];
%
% Gets all the indices for the variables
%
for I=0:nvars-1
      [varname type vardims]=netcdf.inqVar(fid,I);
      if length(vardims) > 1 & max(vardims)==ndims-1
          varids=[ varids I];
      end
  end
%
% 2.  defines the indices for the data subset 
%
if exist('date1') 
    [timedist,kk]=min(abs(time-date1));
    time=time(kk);
    KK=kk;
    nk=1;
else
    KK=1;
    nk=nt;
end
if exist('lon1') 
    [xdist,ii]=min(abs(lon-lon1));
    lon=lon(ii);
    II=ii;
    ni=1;
else
    II=1;
    ni=nx;
end
if exist('lat1') 
    [ydist,jj]=min(abs(lat-lat1));
    lat=lat(jj);
    JJ=jj;
    nj=1;
else
    JJ=1;
    nj=ny;
end

%
% 3. Extracts data
%
for j=1:min([length(varids),3])
    j1=j
    varid=varids(j);
    eval(['var' num2str(j) '=netcdf.inqVar(fid,varid);']);
    eval(['unit' num2str(j) '=netcdf.getAtt(fid,varid,''units'');']);
    eval(['scale=netcdf.getAtt(fid,varid,''scale_factor'');']);
    eval(['fillv=netcdf.getAtt(fid,varid,''_FillValue'');']);
    eval(['vali=netcdf.getvar(fid,varid,[II-1 JJ-1 KK-1],[ni nj nk]);']);
    %eval(['var' num2str(j) '=netcdf.getAtt(fid,var' num2str(j) 'id,''long_name'');']);
    I=find(vali== fillv);
    val=double(vali).*scale;
    val(I)=NaN;
    eval(['mat'  num2str(j) '=val;']);
end

%
%  Fills other variables with blank 
%
for j=j1+1:3
    eval(['mat'  num2str(j) '=[];']);
    eval(['unit'  num2str(j) '='''';']);
    eval(['var'  num2str(j) '='''';']);
end
netcdf.close(fid);    
%    pcolor(lon1,lat1,squeeze(val1(:,:,1))');shading flat;
    
