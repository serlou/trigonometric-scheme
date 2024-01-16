t=linspace(0,4*pi,49);
x=16*sin(t).^3;
y=13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);

hold off; plot(x,y,'*'); hold all;
x1=scheme(x,7,1);
y1=scheme(y,7,1);

%%

plot(x1,y1,'k','LineWidth',1); hold all; plot(x,y,'k.','LineWidth',1,'MarkerSize',20);
axis image; axis off;
hold off;