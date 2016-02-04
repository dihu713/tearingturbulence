number=1000;


testx = linspace(0,2*pi,number);
testfun = zeros(number,1);

for ix =1 : number
    testfun(ix) = exp(90i*testx(ix));
end