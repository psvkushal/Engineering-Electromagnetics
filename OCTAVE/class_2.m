close all;
clear all;
clc;
iter = 0;
vnow = zeros(30,30); #create zero matrix of order 30x30
vprev = vnow;
vnow(30,:) = 10;     #initially keeping every voltage on 30th line as 10
imagesc(vnow);  #prints graph with color var
colorbar;  #prints color bar
error = max(max(abs(vnow - vprev)));   #max(max()) shows max in a 2d matrix
while error > 0.01
  for i = 2:29
    for j = 2:29
      vnow(i,j) = (vnow(i,j+1) + vnow(i+1,j) + vnow(i-1,j) + vnow(i,j-1))/4;  #laplacce condition
    end
  end
  vnow(30,1:9) = vnow(29,1:9);         
  vnow(30,21:30) = vnow(29,21:30);
  vnow(1,1:9) = vnow(2,1:9);
  vnow(1,21:30) = vnow(2,21:30);    
  #the above 4 conditions are for the region aside from plate''' 
    #in line 30 should be continuous to the line 29   and similarly for line 1 and 2'''
  vnow(:,1) = vnow(:,2);     #neumann boundary condition
  vnow(:,30) = vnow(:,29);   #neumann boundary condition
  iter = iter +1;
  imagesc(vnow);
  colorbar;
  colormap('jet')   #choosing the color code of the graph
  title(iter);
  pause(0.01);
  error = max(max(abs(vnow-vprev)));
  vprev = vnow;
end
[ex,ey] = gradient(vnow,1);  #calculates first derivative
ex = -ex; ey = -ey;
hold('on');  #makes the changes on the graph without creating new one
ex = ex./sqrt(ex.^2 + ey.^2); #ex. does operation on entire matrix
ey = ey./sqrt(ex.^2 + ey.^2);
quiver(ex,ey,'k');  #we get arrows 'k' will give black color arrows