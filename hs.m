[X,Y]=meshgrid(-100:0.1:100);
Z=X.^2+Y.^2;
mesh(X,Y,Z)
hold on;
plot3(-5,-5,50,'r*')
plot3(1,1,1,'r*')
plot3(-5,-5,50,'r*')
plot3(-5,-5,50,'r*')