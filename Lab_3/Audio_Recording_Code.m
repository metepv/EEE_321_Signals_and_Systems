% Define the parameters for recording
Fs = 16384;  % Sampling frequency (Hz)
BitsPerSample = 16;  % Bits per sample
Channels = 1;  % Mono (1 channel) or stereo (2 channels)
RecordTime = 5;  % Duration of recording in seconds

% Create an audio recorder object
recObj = audiorecorder(Fs, BitsPerSample, Channels);

% Record audio
disp('Start speaking.')
recordblocking(recObj, RecordTime);
disp('End of recording.');

% Play back the recording
play(recObj);

% Get the recorded data
audioData = getaudiodata(recObj);

% Plot the waveform (optional)
t = (0:length(audioData)-1) / Fs;
figure;
plot(t, audioData);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Recorded Audio');

% Save the recording to a .wav file
filename = 'recorded_audio2.wav';
audiowrite(filename, audioData, Fs);

disp(['Audio saved as ' filename]);
