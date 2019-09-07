% Audio File taken from https://www.pacdv.com/sounds/voices-1.html

% Reading voice file
[y, fs] = audioread('voice1.wav');

% Plotting voice file, both left and right channels
t = 0:1/fs:(length(y)-1)/fs;
subplot(2,1,1);
plot(t, y(:,1));
title('Input voice signal (channel 1)');
xlabel('Samples -->');
ylabel('Amplitude -->');
grid;
subplot(2,1,2);
plot(t, y(:,2));
title('Input voice signal (channel 2)');
xlabel('Samples -->');
ylabel('Amplitude -->');
grid;

% Performing pre emphasis on input signal
a = 1;
b = [1 -0.95];

x = filter(b, a, y(:,1));
figure;
plot(t, x);
title('Normalized signal');
xlabel('Samples -->');
ylabel('Amplitude -->');
grid;

frame_time = 0.02;
frame_size = floor(frame_time .* fs);
frames_count = ceil(length(x) / frame_size);

framed_signal = [transpose(x), zeros(1, (frame_size - rem(length(x), frame_size)))];


% each row corresponds to one frame
framed_signal = transpose(reshape(framed_signal, frame_size, []));

framedSignal = framed_signal(1,:);
t1 = 0:1:frame_size-1;
figure;
subplot(2, 1, 1);
plot(t1, framedSignal);
title('First frame (Rectangular)');
grid;


% Multiplying each frame with hamming values
framed_signal = framed_signal .* transpose(hamming(frame_size));

framedSignal = framed_signal(1,:);
subplot(2, 1, 2);
plot(t1, framedSignal);
title('First frame (Hamming)');
grid;
