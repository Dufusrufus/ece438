close all
clear
clc
%2.3.1
RGB = imread('girl.tif');
subplot(2,2,1)
image(RGB)
axis('image')
title('original image')
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
subplot(2,2,2)
image(R)
colormap(gray(256))
axis('image')
title('R image')
subplot(2,2,3)
image(G)
colormap(gray(256))
axis('image')
title('G image')
subplot(2,2,4)
image(B)
colormap(gray(256))
axis('image')
title('B image')

%2.3.2
load ycbcr
figure
subplot(2,2,1)
image(ycbcr)
title('original image')
Y = ycbcr(:,:,1);
Cb = ycbcr(:,:,2);
Cr = ycbcr(:,:,3);
subplot(2,2,2)
image(Y)
colormap(gray(256))
axis('image')
title('Y image')
subplot(2,2,3)
image(Cb)
colormap(gray(256))
axis('image')
title('Cb image')
subplot(2,2,4)
image(Cr)
colormap(gray(256))
axis('image')
title('Cr image')
%2.3.3
trans = ycbcr2RGB(ycbcr);
figure
subplot(2,2,1)
image(trans)
axis('image')
title('original image')
R = trans(:,:,1);
G = trans(:,:,2);
B = trans(:,:,3);
subplot(2,2,2)
image(R)
colormap(gray(256))
axis('image')
title('R image')
subplot(2,2,3)
image(G)
colormap(gray(256))
axis('image')
title('G image')
subplot(2,2,4)
image(B)
colormap(gray(256))
axis('image')
title('B image')

%4
figure
subplot(3,1,1)
image(ycbcr)
axis('image')
title('original image')
f1 = double(ycbcr);
f1(:,:,1) = filter2(h,ycbcr(:,:,1));
f1 = ycbcr2RGB(f1);
subplot(3,1,2)
image(uint8(f1))
axis('image')
title('luminance filtered image')
f2 = double(ycbcr);
f2(:,:,2) = filter2(h,ycbcr(:,:,2));
f2(:,:,3) = filter2(h,ycbcr(:,:,3));
f2 = ycbcr2RGB(f2);
subplot(3,1,3)
image(uint8(f2))
axis('image')
title('chrominance filtered image')

%the lunminance filtered image looks blurred because human is more
%sensitive to the distortion in luminance component

%3
figure
house = double(imread('house.tif'));
image(house)
colormap(gray(256))
axis('image')
title('original image')

%1
T = 108;
[r,c] = size(house);
NM = r * c;
image1 = house;
image1 = (image1 > T) * 255;
figure
image(uint8(image1))
colormap(gray(256))
axis('image')
title('1st binary image')
MSE_1 = 1/NM*(sum(sum((house-image1).^2)))

figure
image(uint8(abs(house-image1)))
colormap(gray(256))
axis('image')
title('1st error image')

I = [12,8,10,6;4,16,2,14;9,5,11,7;1,13,3,15];

T = 255 * (I - 0.5) / 4 ^ 2;
dim = 4;
while (dim < max(r,c))
    T = [T,T;T,T];
    dim = dim * 2;
end
T = T(1:r,1:c);
image2 = 255*(house>T);
figure
image(uint8(image2))
colormap(gray(256))
axis('image')
title('2nd binary image')
MSE_2 = 1/NM*(sum(sum((house-image2).^2)))

figure
image(uint8(abs(house-image2)))
colormap(gray(256))
axis('image')
title('2nd error image')

T = 108;
image3 = zeros(r,c);
house = double(imread('house.tif'));
for i = 1:r
    for j = 1:c
        image3(i,j) = 255*(house(i,j)>T);
        error(i,j) = house(i,j) - image3(i,j);
        if(j<c)
            house(i,j+1) = house(i,j+1) + 7/16*error(i,j);
        end
        if(i<r && j>1)
            house(i+1,j-1) = house(i+1,j-1) + 3/16*error(i,j);
        end
        if(i<r)
            house(i+1,j) = house(i+1,j) + 5/16*error(i,j);
        end
        if(i<r && j<c)
            house(i+1,j+1) = house(i+1,j+1) + 1/16*error(i,j);
        end
            
    end
end
figure
image(uint8(image3))
colormap(gray(256))
axis('image')
title('3rd binary image')
house = double(imread('house.tif'));
MSE_3 = 1/NM*(sum(sum((house-image3).^2)))


figure
image(uint8(abs(house-image3)))
colormap(gray(256))
axis('image')
title('3rd error image')

image_f1 = filter2(h,image1);
image_f2 = filter2(h,image2);
image_f3 = filter2(h,image3);

MSE_f1 = 1/NM*(sum(sum((house-image_f1).^2)))
MSE_f2 = 1/NM*(sum(sum((house-image_f2).^2)))
MSE_f3 = 1/NM*(sum(sum((house-image_f3).^2)))

figure
image(image_f1)
colormap(gray(256))
title('1st filtered binary image')

figure
image(image_f2)
colormap(gray(256))
title('2nd filtered binary image')

figure
image(image_f3)
colormap(gray(256))
title('3rd filtered binary image')
