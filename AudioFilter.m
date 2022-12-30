%Reading Audio File
[x,Fs] = audioread("audio.wav");
N = length(x);
disp(Fs) %to print sample rate
k = 0:N-1;
X = fft(x,N);

%to Plot against Frequency in Hz without shifting
%F = (0:N-1)*Fs/N;
%plot(F,abs(X)/N); 

%Shifting Zero to the center of the spectrum
F = (-N/2:N/2-1)*Fs/N;
plot(F,abs(fftshift(X))/N); title('unfiltered audio spectrum with zero at center'); xlabel('Frequency'); ylabel('Magnitude');
figure(); 


%using the filter designed in filterDesigner
FilteredAudio = filter(Hd,x);
Z = fft(FilteredAudio,N);
plot(F,abs(fftshift(Z))/N); title('filtered audio spectrum'); xlabel('Frequency'); ylabel('Magnitude');
figure(); 

%sound(FilteredAudio,Fs) %to listen to the filtered audio
%audiowrite('filtered.wav',FilteredAudio,Fs) %to save the filtered audio

freqz(Hd) %to plot the frequency response of the filter
impz(Hd)  %to plot the impulse response of the filter

 



