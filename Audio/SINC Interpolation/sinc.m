[AudioSample Fs] = audioread('Super Mario World Music.mp3');
Audio = transpose(AudioSample);
M = 10;

LowPass = fir1(2, pi/(M*22000), 'low');
FiltWave = filter(LowPass, 1, Audio);
DownS = downsample(FiltWave, 10);
%UpS = upsample(DownS, 10);
yp = resampleSINC(DownS, 10);
%xp = resampleSINC(UpS, 10);

figure(1);
subplot(2,2,1);
plot(AudioSample);
title('Sinal de Entrada');
grid on

subplot(2,2,2);
plot(FiltWave);
title('Low-Pass filter');
grid on

subplot(2,2,3);
plot(DownS);
title('Filter -> Downsampling:fator 10');
grid on

subplot(2,2,4);
plot(yp);
title('Downsampling -> Interpolação SINC');
grid on

%subplot(2,2,4);
%plot(xp);
%title('Downsamplig -> Upsampling -> Interpolação SINC');
%grid on
