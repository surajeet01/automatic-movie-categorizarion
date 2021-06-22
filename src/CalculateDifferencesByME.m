vdo = VideoReader('Taken.mp4');
nFrames = vdo.NumberOfFrames;
FrameHeight = vdo.Height;
FrameWidth = vdo.Width;
Resolution = FrameHeight * FrameWidth;
fdd = fopen('differenceByME.txt','wt');

ft1=FrequencyTable(read(vdo,40000),FrameHeight,FrameWidth);

f=1;


for k = 1:1000,
	disp(k);
	img1 = double(read(vdo,k));
	img2 = double(read(vdo,k+1));
	C = motionEst4SS(img2,img1,16,16);
	ft1=FrequencyTable(img1,FrameHeight,FrameWidth);
	ft2=FrequencyTable(C,FrameHeight,FrameWidth);
	d=abs(sum(abs(ft2-ft1))*1000/1280);
	fprintf(fdd,'%d\n',d/Resolution);
end;

fclose(fdd);