function [Hm0,Tm,Tz,Te,epsilon,ni] = waves_variables(dirSpec,freq,dir)
% dimention(dirSpec) = (size(freq),size(dir)) [m^(2)Hz^(-1)rad^(-1)]
% dimention(freq) = (1,size(freq)) [Hz]

spec1(:,:)=dirSpec(:,:).*(freq); % function for m1
spec2(:,:)=dirSpec(:,:).*(freq.^(2)); % function for m2
spec4(:,:)=dirSpec(:,:).*(freq.^(4)); % function for m4
spec_1(:,:)=dirSpec(:,:).*(freq.^(-1)); % function for m-1
                                        
dirs=deg2rad(dir); % radians [rad]

[df,ddir]=meshgrid(freq,dirs);
% dim(df) = (y,x)
% dim(ddir) = (y,x)

F=reshape(df',[size(df(1,:),2)*size(df(:,1),1),1]); % 1 dimention vector
D=reshape(ddir',[size(ddir(1,:),2)*size(ddir(:,1),1),1]); % 1 dimention vector
E=reshape(dirSpec,[size(dirSpec(1,:),2)*size(dirSpec(:,1),1),1]); % 1 dimention vector
E1=reshape(spec1,[size(spec1(1,:),2)*size(spec1(:,1),1),1]); % 1 dimention vector
E2=reshape(spec2,[size(spec2(1,:),2)*size(spec2(:,1),1),1]); % 1 dimention vector
E4=reshape(spec4,[size(spec4(1,:),2)*size(spec4(:,1),1),1]); % 1 dimention vector
E_1=reshape(spec_1,[size(spec_1(1,:),2)*size(spec_1(:,1),1),1]); % 1 dimention vector
F=double(F); D=double(D); E=double(E); E1=double(E1); E2=double(E2); E4=double(E4); E_1=double(E_1);

interpZ = @(xi,yi) griddata(F,D,E,xi,yi); % define spectrum function
interpZ1 = @(xi,yi) griddata(F,D,E1,xi,yi);
interpZ2 = @(xi,yi) griddata(F,D,E2,xi,yi);
interpZ4 = @(xi,yi) griddata(F,D,E4,xi,yi);
interpZ_1 = @(xi,yi) griddata(F,D,E_1,xi,yi);

m0=quad2d(interpZ,min(double(freq)),max(double(freq)),min(double(dirs)),max(double(dirs))); % m0 value
m1=quad2d(interpZ1,min(double(freq)),max(double(freq)),min(double(dirs)),max(double(dirs))); % m1 value
m2=quad2d(interpZ2,min(double(freq)),max(double(freq)),min(double(dirs)),max(double(dirs))); % m2 value
m4=quad2d(interpZ4,min(double(freq)),max(double(freq)),min(double(dirs)),max(double(dirs))); % m4 value
m_1=quad2d(interpZ_1,min(double(freq)),max(double(freq)),min(double(dirs)),max(double(dirs))); % m-1 value

Hm0=4*sqrt(m0); % atlas de oleaje chile
Tz=sqrt(m0/m2); % atlas de oleaje chile
Te=m_1/m0; % atlas de oleaje chile
Tm=m0/m1; % atlas de oleaje chile
epsilon=sqrt(1-(m2^(2)/(m0*m4))); % parámetro de ancho espectral e (épsilon) - atlas de oleaje chile
ni=sqrt(((m0*m2)/m1^(2))-1); % ancho de banda espectral ni - atlas de oleaje

end
