clc
close all
%3.3

y = imread('fountainbw.tif');
image(y);
colormap(gray(256));
axis('image')
title('original')
X = double(y);

for i = [7,4,2,1]
    N = 2^i;
    Y = Uquant(X,N);
    figure
    image(Y);
    colormap(gray(256));
    axis('image')
    title([num2str(i), 'b/pel']);
end

%3.4
[speech,Fs] = audioread('speech.au');
[music,Fs] = audioread('music.au');

figure
i = 1;
for n = [7,4,2,1]
    N = 2^n;
    Y = Uquant(speech,N);
    Y1(:,i) = Y; 
    subplot(2,2,i)
    i = i+1;
    plot(Y(7201:7400))
    orient tall
    title(['speech ',num2str(n), 'b/sample']);
end

figure
i = 1;
for n = [7,4,2,1]
    N = 2^n;
    Y = Uquant(music,N);
    Y2(:,i) = Y; 
    subplot(2,2,i)
    i = i+1;
    plot(Y(7201:7400))
    orient tall
    title(['music ',num2str(n), 'b/sample']);
end

%3.4.1
i = 1;
figure
for n = [7,4,2,1]
    subplot(2,2,i)
    Error1(:,i) = Y1(:,i)-speech;
    hist(Error1(:,i),20)
    title(['Error of speech, ',num2str(n), 'b/sample'])
    i = i + 1;
end

i = 1;
figure
for n = [7,4,2,1]
    subplot(2,2,i)
    Error2(:,i) = Y2(:,i)-music;
    hist(Error2(:,i),20)
    title(['Error of music, ',num2str(n), 'b/sample'])
    i = i + 1;
end


for i = 1:4
    figure
    [r,lags] = xcorr(Error1(:,i),200,'unbiased');
    plot(lags,r)
    title(['autocorrelation error signal ', num2str(i),' of speech'])
    i = i + 1;
end


% for i = 1:4
%     figure
%     [r,lags] = xcorr(Error2(:,i),200,'unbiased');
%     plot(lags,r)
%     title(['autocorrelation error signal ', num2str(i),' of music'])
%     i = i + 1;
% end


for i = 1:4
    figure
    [c,lags] = xcorr(Error1(:,i),Y1(:,i),200,'unbiased');
    plot(lags,c)
    title(['cross-correlation ', num2str(i),' of error and speech'])
    i = i + 1;
end

% for i = 1:4
%     figure
%     [c,lags] = xcorr(Error2(:,i),Y2(:,i),200,'unbiased');
%     plot(lags,c)
%     title(['cross-correlation ', num2str(i),' of error and music'])
%     i = i + 1;
% end

%3.4.2
figure
for i = 1:4
    PY = sum(Y1(:,i).^2);
    PE = sum(Error1(:,i).^2);
    PSNR(i) = PY/PE;
end
n = [7,4,2,1];
PSNR
plot(n*8,1./PSNR,'o-')
ylabel('distortion of speech')
xlabel('bit rate (kbps)')
title('rate-distortion')

% figure
% for i = 1:4
%     PY = sum(Y2(:,i).^2);
%     PE = sum(Error2(:,i).^2);
%     PSNR(i) = PY/PE;
% end
% n = [7,4,2,1];
% PSNR
% plot(n*8,1./PSNR,'o-')
% ylabel('distortion of music')
% xlabel('bit rate (kbps)')

%3.5
figure
hist(speech,40)
[partition, codebook] = lloyds(speech,[-0.35,-0.01,0.01,0.3]);
for i = 1:length(speech)
    e1 = abs(speech(i) - codebook(1));
    e2 = abs(speech(i) - codebook(2));
    e3 = abs(speech(i) - codebook(3));
    e4 = abs(speech(i) - codebook(4));
    e = [e1,e2,e3,e4];
    if (min(e) == e1)
        speech_q(i) = codebook(1);
    elseif (min(e) == e2)
        speech_q(i) = codebook(2);
    elseif (min(e) == e3)
        speech_q(i) = codebook(3);
    else
        speech_q(i) = codebook(4);
    end
        
end
%sound(speech)
Error3 = speech_q'-speech;
PSNR2 = sum(speech_q.^2)/sum(Error3.^2)
figure
hist(speech_q')
figure
subplot(3,1,1)
plot(speech_q')
subplot(3,1,2)
plot(speech)
subplot(3,1,3)
plot(Y1(:,3))
%sound(speech_q)
sound(Y1(:,3))
