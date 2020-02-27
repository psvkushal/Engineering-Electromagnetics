close all;
clear all;
clc;

xdim = 50;
ydim = 50;
time_tot = 10*xdim; %total time taken
xsource = xdim/2;
ysource = ydim/2;
epsilon0 = 1;
mu0 = 1;
c = 1;
%Courant factor
S = 1/(2^0.5);  %for including the travelling along diagonal of square
delta = 1;
deltat = S*delta/c;

Hz = zeros(xdim,ydim);
Ex = zeros(xdim,ydim);
Ey = zeros(xdim,ydim);


epsilon = epsilon0*ones(xdim,ydim);  %epsilon for a medium
epsilon(xsource-2:xsource+2,:) = 4;
epsilon(xsource+4:xsource+8,:) = 4;
epsilon(xsource-8:xsource-4,:) = 4;
mu = mu0*ones(xdim,ydim);   %mu for a medium


for n = 1:1:time_tot % tme steps for code each loop is a time instant 
 for i = 1:1:xdim-1
   for j = 1:1:ydim-1
    Ex(i,j) = Ex(i,j) + (deltat/(delta*mu(i,j)))*(Hz(i+1,j)-Hz(i,j));
    Ey(i,j) = Ey(i,j) - (deltat/(delta*mu(i,j)))*(Hz(i,j+1)-Hz(i,j));
   end
  end
   for i = 2:1:xdim-1
     for j = 2:1:ydim
       Hz(i,j) = Hz(i,j) + (deltat/(delta*epsilon(i,j)))*(Ex(i,j)-Ex(i-1,j)-Ey(i,j)+Ey(i,j-1));
      end
   end
    Hz(xsource-5:xsource+5,1) = sin(10*n*pi/180);
    imagesc(Hz);
    colorbar;
    pause(0.01);
end
