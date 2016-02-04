Pi = 3.141592653589793;

comfft = fft2(testfun);
comfft = comfft*(2/number)*(2/number);
comfft(1,:) = comfft(1,:)/2;
comfft(:,1) = comfft(:,1)/2;
%comfft = comfft';
%absfft =abs(comfft);
tmptest = comfft;

for ix = 1 : number
    if (ix<=ceil(number/2))
        tmptest(ix+floor((number/2)),:) = comfft(ix,:);
        %fprintf('%d to %d\r\n',i,i+floor((number/2)));
    else
        tmptest(ix+floor((number/2)-number),:) = comfft(ix,:);
        %fprintf('%d to %d\r\n',i,i+floor((number/2)-number));
    end
end

comfft = tmptest;
%}
for jy = 1 : number
    if (jy<=ceil(number/2))
        tmptest(:,jy+floor((number/2))) = comfft(:,jy);
        %fprintf('%d to %d\r\n',j,j+floor((number/2)));
    else
        tmptest(:,jy+floor((number/2)-number)) = comfft(:,jy);
        %fprintf('%d to %d\r\n',j,j+floor((number/2)-number));
    end
end


comfft = tmptest';

refft = abs(real(comfft))+1e-20;
imfft = abs(imag(comfft))+1e-20;
logrefft = log10(refft);
logimfft = log10(imfft);

testkx = linspace(floor(-(number-1)/2),floor((number-1)/2),number);
testky = linspace(floor(-(number-1)/2),floor((number-1)/2),number);