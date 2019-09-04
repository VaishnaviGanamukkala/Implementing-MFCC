% Audio File taken from https://www.pacdv.com/sounds/voices-1.html

% Reading voice file
[y, fs] = audioread('voice1.wav');

% Plotting voice file, both left and right channels
t = 0:1/fs:(length(y)-1)/fs;
subplot(2,1,1);
plot(t, y(:,1));
title('Input voice signal (channel 1)');
xlabel('Time -->');
ylabel('Amplitude -->');
grid;
subplot(2,1,2);
plot(t, y(:,2));
title('Input voice signal (channel 2)');
xlabel('Time -->');
ylabel('Amplitude -->');
grid;

a = 1;
b = [1 -0.95];

x = filter(b, a, y);
figure;
plot(t, x(:,1));
title('Normalized signal');
xlabel('Time -->');
ylabel('Amplitude -->');
grid;

hw = hamming(64);
figure;
wvtool(hw);