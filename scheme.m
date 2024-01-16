function [ f1 ] = scheme( f,lvl,epsi )
delta = 1e-14;

if lvl>=1
    frac=1+(f(1:end-3)-f(4:end))./(f(2:end-2)-f(3:end-1));
    gamma=0.5./((1+sqrt(frac)).^2-1);
    gamma(frac<epsi^2 | abs(f(2:end-2)-f(3:end-1))<delta )=1/16;
    
    gamma(abs(f(2:end-2)-f(3:end-1))<delta & f(1:end-3)<=f(2:end-2) & f(3:end-1)<=f(4:end))=0;
    gamma(abs(f(2:end-2)-f(3:end-1))<delta & f(1:end-3)>=f(2:end-2) & f(3:end-1)>=f(4:end))=0;
    
    f1=zeros(1,2*(length(f)-2)-1);
    f1(1:2:end)=f(2:end-1);
    f1(2:2:end-1)=2\(f(2:end-2)+f(3:end-1)) - gamma.*(f(4:end)-f(3:end-1)-f(2:end-2)+f(1:end-3));
    f1 = scheme( f1, lvl-1,epsi);
else
    f1=f;
end