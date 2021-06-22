vdo = VideoReader('Taken.mp4');

nFrames = vdo.NumberOfFrames;

load('shot.txt');
load('difference.txt');

FrameWithinShot = [1];
FrameBetweenShot = [1];

for i = 2 : 30000,
	if length(find(shot==i)) > 0,
		FrameBetweenShot = [FrameBetweenShot [difference(i-1,1)]];
	else,
		FrameWithinShot = [FrameWithinShot [difference(i-1,1)]];
	end;
end;

FrameWithinShot = FrameWithinShot(1,2:end);
FrameBetweenShot = FrameBetweenShot(1,2:end);

FrameWithinShot = sort(FrameWithinShot);
FrameBetweenShot = sort(FrameBetweenShot);

MeanForFrameWithinShot = mean(FrameWithinShot);
MeanForFrameBetweenShot = mean(FrameBetweenShot);

StandardDeviationForFrameBetweenShot = std(FrameBetweenShot);
StandardDeviationForFrameWithinShot = std(FrameWithinShot);
