  close all;
  clear all;
  clc;
  iter = 0;
  vnow = zeros(30,30); #create zero matrix of order 30x30
  vprev = vnow;
  vnow(30,:) = 10;
  imagesc(vnow);  #prints graph with color var
  colorbar;  #prints color bar1
  error = max(max(abs(vnow - vprev)));   #max(max()) shows max in a 2d matrix
  while error > 0.001
    for i = 2:29
      for j = 2:29
        vnow(i,j) = (vnow(i,j+1) + vnow(i+1,j) + vnow(i-1,j) + vnow(i,j-1))/4;  #laplacce condition
      end
    end
    vnow(:,1) = vnow(:,2);
    vnow(:,30) = vnow(:,29);   #neuman boundary condition    
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