number=1000;


testx = (0:number-1)*2*pi/number;
testy = (0:number-1)*2*pi/number;
testfun = zeros(number,number);

for ix =1 : number
    for jy = 1 : number
        testfun(ix,jy) = sin(100*testx(ix)-10*testy(jy));
        %testfun(ix,jy) = testfun(ix,jy) + sin(2*testx(ix)-testy(jy));
        %testfun(ix,jy) = testfun(ix,jy) + cos(3*testx(ix)-2*testy(jy));
        %testfun(ix,jy) = testfun(ix,jy) + cos(testy(jy));
        %testfun(ix,jy) = testfun(ix,jy) + 1;
    end
end
