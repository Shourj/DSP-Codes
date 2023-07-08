% Filter specifications
cutoff_freq = 2e3;      % Cutoff frequency in Hz
sampling_freq = 5e3;    % Sampling frequency in Hz
filter_order = 4;       % Filter order

% Normalize the cutoff frequency
normalized_cutoff_freq = cutoff_freq / (sampling_freq / 2);

% Design the Butterworth low-pass filter
[b, a] = butter(filter_order, normalized_cutoff_freq, 'low');

% Plot the frequency response
freqz(b, a);

% Label the plot
title('Butterworth Low-Pass Filter Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
