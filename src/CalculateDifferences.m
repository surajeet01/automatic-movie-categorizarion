vdo = VideoReader('Bean.avi');
nFrames = vdo.NumberOfFrames;
FrameHeight = vdo.Height;
FrameWidth = vdo.Width;
Resolution = FrameHeight * FrameWidth;
fdd = fopen('difference.txt','wt');

ft1=FrequencyTable(read(vdo,40000),FrameHeight,FrameWidth);

f=1;


for k = 40001:70000,
	disp(k);
	if f==1,
		ft2=FrequencyTable(read(vdo,k),FrameHeight,FrameWidth);
		d=abs(sum(abs(ft2-ft1))*100000/1280);
		fprintf(fdd,'%d\n',d/Resolution);	
		f=0;
	else
		ft1=FrequencyTable(read(vdo,k),FrameHeight,FrameWidth);
		d=abs(sum(abs(ft2-ft1))*100000/1280);
		fprintf(fdd,'%d\n',d/Resolution);
		f=1;
	end;
end;

fclose(fdd);