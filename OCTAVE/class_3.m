close all;
clear all;
clc;
length = 100;
time = 400;
dz = 1;
epsilon = ones(1,length);  #creates a 1D array of ones epsilon varying with position
mu = epsilon;   #similarly as epsilon
#epsilon(1,length/2:2*length/3) = 9;
c = 1/sqrt((min(epsilon))*(min(mu))); #velocity of EM wave
dt = dz/c;

ex = zeros(1,length);    
hy = ex;

for t = 1:dt:time
ex(1) = sin(10*pi*t/180);
#    if t == 1
#        ex(1) = 1;
#    else
#        ex(1) = 0;
#    end
    for i =1:dz:length-1
        hy(i) = hy(i) - dt/(mu(i)*dz)*(ex(i+1)-ex(i));   #calculation of hy in future instant
    end
    #ex(length) = ex(length-1);  #absorbing boundary condition,makes use of neumann boundary condition
    #ex(length/2) = 0;
    for  i = 1:dz:length-1    
        ex(i) = ex(i) - dt/(epsilon(i)*dz)*(hy(i+1)-hy(i));  #calculation of ex in future instant
    end
    #we cant calculate electric field and magnetic field simulataneously coupled things cant be calculated simultaneosly
    plot(ex);
    axis([0 length -3 3]);
    pause(0.001);
end 