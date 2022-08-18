% 20220629
% 把小万的函数复制过来自己写了一下

x(1) = 1;x(2) = 639;
y(1) = 1;y(2) = 479;
F = fftshift(fft2(IM(y(1):y(2),x(1):x(2))));
[center_raw,center_col,R,~] = findcircle(log(abs(F)),5,0,1);
peaks = [center_col,center_raw,R];
mask = EwaldMask(F,peaks,0.1,'G',1);
Irec = abs(ifft2(ifftshift(mask.*squeeze(F))));
figure;
subplot(2,2,1);imagesc(IM);
subplot(2,2,2);imagesc(abs(F).^2);
subplot(2,2,3);imagesc(Irec);
subplot(2,2,4);imagesc(mask);