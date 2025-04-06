%For archives txt

filename = "Data/electric_potential.txt";
A = importdata(filename,' ',9); %' ' is the delimitator

x = A.data(:,1); %Everything in the first column
y = A.data(:,2); %Everything in the second column
V = A.data(:,3); %Everything in the third column

clear A; % para limpiar A y no usar mucha memoria

%These are the dimensions of the matrix
n = (1:1:20)';
m = (1:1:20)';

%[X,Y] = meshgrid(x,y);
[M,N] = meshgrid(m,n); %'We create a grid'
L = zeros(size(n,1), size(m,1)); %Create the zeros of an 20x20 matrix

p = 1; %initialization of p
for i=1:size(n,1)
    for j=1:size(m,1)
        L(i,j) = V(p);
        p = p+1;
    end
end

%Z = griddata(x,y,V,X,Y); %This is a matrix

figure(1);
h=surf(M,N,L, 'FaceAlpha', 0.7 ); %Plot
colormap("jet")
colorbar;
xlabel('n');
ylabel('m');
zlabel("Potential (V)");

ym = (0.0025:0.0050:0.0975);
xn = (0.005:0.010:0.195);
[X,Y]= meshgrid(xn,ym);

figure(2);
h2=surf(X,Y,L, 'FaceAlpha', 0.7 ); %Plot
colormap("jet")
colorbar;
xlabel('n');
ylabel('m');
zlabel("Potential (V)");
