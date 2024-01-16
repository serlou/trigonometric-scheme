clear; close all;

guardar = true;

a1=2;
F{1} = @(t) [-4+cosh(a1*(t-0.5));sinh(a1*(t-0.5))];
F{2} = @(t) [4*cos(2*pi*t);3+sin(2*pi*t)];
F{3} = @(t) [4-cosh(a1*(t-0.5)); -sinh(a1*(t-0.5))];
F{4} = @(t) [-4*(t-0.5);-7.5+(5*(t-0.5)).^2];
ojo1 = @(t) [1.5+1/6*cos(2*pi*t);3.3+1/3*sin(2*pi*t)];
ojo2 = @(t) diag([-1,1])*ojo1(t);
boca = @(t) [(t-0.5);2.3+(t-0.5).^2];

pto(1,:) = F{2}(-1/6+5/6/6*2.5);
pto(2,:) = F{1}(1/6*2.5);
pto(3,:) = F{4}(1/6*3.5);

t = linspace(0,1,1001);
figure; hold all;
for i=1:length(F)
    Ft = F{i}(t);
    plot(Ft(1,:),Ft(2,:),'LineWidth',2);
end
for i=1:3
plot(pto(i,1),pto(i,2),'k*','MarkerSize',10,'LineWidth',2);
end
legend({'Hyperbola','Ellipse','Hyperbola','Parabola'},'Location','NorthEastOutSide');
axis image; axis off;

%%
figure; hold all;
for i=1:length(F)
    Ft = F{i}(t);
    h(1)=plot(Ft(1,:),Ft(2,:),'k--','LineWidth',1);
end

f = [];
f = [f,F{1}(linspace(0,1,7))]; % cosh(a1/6)
f = [f,F{2}(linspace(-1/6,1/2+1/6,7))]; % cos(2*pi*(1/2+1/6+1/6)/6)
f = [f,F{3}(linspace(0,1,7))];
f = [f,F{4}(linspace(0,1,7))];

f=[f,f];

h(5)=plot(f(1,:),f(2,:),'k.','LineWidth',1,'MarkerSize',20);
% axis image; axis off; %axis tight;


f1(1,:)=scheme(f(1,:),7,1);
f1(2,:)=scheme(f(2,:),7,1);

Ft = ojo1(t);
plot(Ft(1,:),Ft(2,:),'k','LineWidth',2);
Ft = ojo2(t);
plot(Ft(1,:),Ft(2,:),'k','LineWidth',2);
Ft = boca(t);
plot(Ft(1,:),Ft(2,:),'k','LineWidth',2);

h(6)=plot(f1(1,:),f1(2,:),'k','LineWidth',2);
legend(h([1,5,6]),{'Conic sections','f^0','S_\epsilon^\infty f^0'},'Location','NorthEastOutSide','FontSize',20);
% axis image; axis off; %axis tight;

axis image; legend off;
% axis([-3.7,-1,3,4]);
axis off;