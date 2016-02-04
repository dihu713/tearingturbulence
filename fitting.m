FitFun = zeros(nkper,1);
FitFun2 = zeros(nkper,1);

iref = 10;
Emk0 = Emkper(iref);

epsilon = 0.0004;

for ik = 1 : nkper
   
    FitFun(ik) = Emkper(iref)*((coordkper(ik)/coordkper(iref))^(-3/2));
    FitFun(ik) = FitFun(ik)*exp(-(10/7)*((0.01*10)^(1/2))*(1.41*((1/10)^(-2/5))*(((1*10^(-4))^(3/5))*(1-0.9)^(2/5)))*(coordkper(ik)^(7/10))*(epsilon^(-1/2)));
    FitFun(ik) = FitFun(ik)/exp(-(10/7)*((0.01*10)^(1/2))*(1.41*((1/10)^(-2/5))*(((1*10^(-4))^(3/5))*(1-0.9)^(2/5)))*(coordkper(iref)^(7/10))*(epsilon^(-1/2)));
    FitFun(ik) = FitFun(ik)*exp(-(2/3)*((0.01*10)^(1/2))*(1.41*((1/10)^(-2/5))*(((1*10^(-4))^(1))*(1-0.9)^(2/5)))*(coordkper(ik)^(3/2))*(epsilon^(-1/2)));
    FitFun(ik) = FitFun(ik)/exp(-(2/3)*((0.01*10)^(1/2))*(1.41*((1/10)^(-2/5))*(((1*10^(-4))^(1))*(1-0.9)^(2/5)))*(coordkper(iref)^(3/2))*(epsilon^(-1/2)));

    
    
    %FitFun(ik) = FitFun(ik)*exp(-(10/7)*((0.01*10)^(1/2))*(1.41*(((3*10^(-5))^(3/5))*(0.2)^(2/5)))*(coordkper(ik)^(7/10))*(epsilon^(-1/2)));
    %FitFun(ik) = FitFun(ik)/exp(-(10/7)*((0.01*10)^(1/2))*(1.41*(((3*10^(-5))^(3/5))*(0.2)^(2/5)))*(coordkper(iref)^(7/10))*(epsilon^(-1/2)));

    
    keta = (0.0003^(1/4))*((3*10^(-5))^(-3/4));
    FitFun2(ik) = Emkper(iref)*((coordkper(ik)/coordkper(iref))^(-13/5))*10;
    
    
end

logFitFun = log10(FitFun);
logFitFun2 = log10(FitFun2);

hold on;
plot(coordkper,logFitFun,'r--','LineWidth',2);
plot(coordkper,logFitFun2,'b--','LineWidth',2);
hold off;