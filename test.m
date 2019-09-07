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

framed_signal = [transpose(x), zeros(1, rem(length(x), frame_size))];

disp(size(framed_signal));
disp(frame_size);

framed_signal = reshape(x, [], frame_size);

%{
row = 1;
for i = 1 : length(x)
  for j = 1 : frame_size
    framed_signal(row, j) = x(i);
    if j == frame_size
      row += 1;
    end;
  end;
end;


for i = 1 : row
  framed_signal(row, :) =  framed_signal(row, :) .* hamming(frame_size);
end;
%}
% Taking Hamming Frames
framedSignal = framed_signal(1,:);
figure;
t1 = 0:1:frame_size-1;
plot(t, framedSignal);
grid;
