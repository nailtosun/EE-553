%% 
syms x y
b = (1-x)^2 + (y-x^2)^2;
gradient(b)
%% 
clear;
b = @(x,y) (1-x).^2 + (y-x.^2).^2;
dbdx = @(x,y) 2*x - 4*x*(- x^2 + y) - 2; 
dbdy = @(x,y) - 2*x^2 + 2*y;

subplot 211
%%
fcontour(b,[-4 4 -2 20],'LevelStep',10)
x0 = 2; y0 = 2;
hold on;grid on;
plot(x0,y0,'o')
% Search direction
s1 = -dbdx(x0,y0);
s2 = -dbdy(x0,y0);
xd = @(d) x0+d*s1;
yd = @(d) y0+d*s2;

bd = @(d) b(xd(d),yd(d))
%%
subplot 212
ezplot(bd,[0 0.1]); grid on;
dstar = goldenSearch(bd,0.1,0,'min',1e-7,1);
x1 = xd(dstar);
y1 = yd(dstar);
%%
subplot 211; hold on
plot(x1,y1,'o')
%% New search direction 
% Gradient Calculation 
s1 = -dbdx(x1,y1);
s2 = -dbdy(x1,y1);
%%
xd = @(d) x1+d*s1;
yd = @(d) y1+d*s2;
% Search Direction
bd = @(d) b(xd(d),yd(d))
subplot 212
ezplot(bd,[0 5]);grid on;
%%
dstar = goldenSearch(bd,5,0,'min',1e-7,1);
x2 = xd(dstar);
y2 = yd(dstar);

subplot 211; hold on
plot(x2,y2,'o')
%%
for i = 1:5
    % GRADIENT CALCULATION
    s1 = -dbdx(x2,y2);
    s2 = -dbdy(x2,y2);
    % SEARCH DIRECTION
    xd = @(d) x2+d*s1;
    yd = @(d) y2+d*s2;
    bd = @(d) b(x(d),y(d));
    
end
