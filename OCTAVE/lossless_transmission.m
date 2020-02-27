clear all;
close all;
clc;

numx = 30;
numt = 100;
v = zeros(numx,numt);     #creates matrixof 30x30
#v(1,2) = 1;     #acts as impulse
#v(1,:) = 1;     #acts as a const voltage source kept at 1
v(1,:) = sin([1:numt]*30*pi/180);       
for t = (2:numt-1)      #if we keep numt in the equation it would go for numt+1 out of bounds,similaly if 1 is there we have to keep 0 which is out of bound 
  for x = 2:(numx-1)
    v(x,t+1) = 2*v(x,t)-v(x,t-1)+[v(x+1,t)+v(x-1,t)-2*v(x,t)];
  end
  plot(v(:,t));
 axis([1 numx -2 2]);     #keeps max and min values for x and y axis
  title(["t = ",num2str(t)]);
  pause(0.01);
end