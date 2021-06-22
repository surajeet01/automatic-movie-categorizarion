shuttleVideo = VideoReader('Taken.mp4');
nFrames = shuttleVideo.NumberOfFrames;

for ii = 30000 : nFrames, 
	disp(ii);
    img = read(shuttleVideo,ii);
    imwrite(img,fullfile('.\','images',sprintf('%d.jpg',ii)));
end;