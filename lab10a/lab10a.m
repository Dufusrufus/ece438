clear
clc
close all
%2,1
A = imread('yacht.tif');
B = double(A);
image(B)
colormap(gray(256));
axis('image')
title('original image')
%1
[r,c]=size(B);

for i = 1:c
    Bh(:,i) = B(:,c+1-i);
end
figure
image(Bh)
colormap(gray(256));
axis('image')
title('horizontally flipped image')

for i = 1:r
    Bv(i,:) = B(r+1-i,:);
end
figure
image(Bv)
colormap(gray(256));
axis('image')
title('vertically flipped image')

%2
Bn = ones(r,c) * 255 - B;
figure
image(Bn)
colormap(gray(256));
axis('image')
title('negative image')

%3
Bm = B * 1.5;
figure
image(Bm);
colormap(gray(256));
axis('image')
title('image multiplied 1.5')

%3.1
house = imread('house.tif');
house = double(house);
figure
Hist(house);
title('histogram of house')

%3.2
%1
%2
narrow = imread('narrow.tif');
narrow = double(narrow);
figure
image(narrow);
colormap(gray(256));
axis('image')
title('original image')
figure;
Hist(narrow);
title('histogram of original image')
%3
[r,c] = size(narrow);
T1 = min(min(narrow));
T2 = max(max(narrow));
for i = 1: r
    for j = 1: c
        trans(i,j) = pointTrans(narrow(i,j),T1,T2);
    end
end
figure
image(trans);
colormap(gray(256));
axis('image')
title('transformed image')
figure;
Hist(trans);
title('histogram of transformed image')
%4 The new image has wider intensity of colour, but there are more obvious
%quantized effect
%5 the histogram is spread out. because there are multiple pixels as min.

%4
%1
%2
dark = imread('dark.tif');
dark = double(dark);
correct = gammCorr(dark,2.2);
figure
image(correct)
colormap(gray(256));
axis('image')
title('corrected image')
%3 image is brighter, it appear to be the correct value for gamma

%5.2
h = gaussFilter(7,1);
H = fftshift(fft2(h,32,32));
w1 = -pi:2*pi/31:pi;
w2 = -pi:2*pi/31:pi;
figure
mesh(w1,w2,abs(H))
xlabel('w1')
ylabel('w2')
zlabel('H_Guass')

race = imread('race.tif');
race = double(race);
race_gauss = filter2(race,h);
figure
image(race)
colormap(gray(256));
axis('image')
title('original image')
figure
image(race_gauss)
colormap(gray(256));
axis('image')
title('image after gaussian filter')

noise1 = imread('noise1.tif');
noise1 = double(noise1);
noise2 = imread('noise2.tif');
noise2 = double(noise2);

figure
image(noise1)
colormap(gray(256));
axis('image')
title('noise1')

noise1_g = filter2(h,noise1);
figure
image(noise1_g)
colormap(gray(256));
axis('image')
title('noise1 after gaussian filter')

noise1_m = medianFilter(noise1);
figure
image(noise1_m)
colormap(gray(256));
axis('image')
title('noise1 after median filter')

figure
image(noise2)
colormap(gray(256));
axis('image')
title('noise2')


noise2_g = filter2(h,noise2);
figure
image(noise2_g)
colormap(gray(256));
axis('image')
title('noise2 after gaussian filter')

noise2_m = medianFilter(noise2);
figure
image(noise2_m)
colormap(gray(256));
axis('image')
title('noise2 after median filter')

%5.3
blur = imread('blur.tif');
blur = double(blur);
h = gaussFilter(5,1);
g = 5*blur-4*(filter2(h,blur));
G = fftshift(fft2(g,32,32));
F = fftshift(fft2(blur,32,32));
w1 = -pi:2*pi/31:pi;
w2 = -pi:2*pi/31:pi;
H = G./F;
figure
mesh(w1,w2,abs(H))
xlabel('w1')
ylabel('w2')
zlabel('H')
title('unsharp mask filter');

figure
image(blur);
colormap(gray(256));
axis('image')
title('original image')

figure
blur_1 = 5*blur-4*(filter2(h,blur));
image(blur_1);
colormap(gray(256));
axis('image')
title('image after unsharped mask filter 1')

figure
blur_2 = 10*blur-9*(filter2(h,blur));
image(blur_2);
colormap(gray(256));
axis('image')
title('image after unsharped mask filter 2')



