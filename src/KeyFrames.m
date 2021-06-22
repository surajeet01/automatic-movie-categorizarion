load('shot.txt');
vdo = VideoReader('TheConjuring.avi');
Height = vdo.Height;
Width = vdo.Width;
fd = fopen('KeyFrames.txt','wt');

for i = 1 : length(shot)-1,
	fprintf('Shot %d/%d\n',i,length(shot))
	ShotStart = shot(i,1);
	ShotEnd = shot(i+1,1)-1;
	nFramesInShot = ShotEnd - ShotStart + 1;
	vectors = zeros(1280,nFramesInShot);
	for k = ShotStart : ShotEnd,
		vectors(:,k-ShotStart+1) = FrequencyTable(read(vdo,k),Height,Width);
	end;
	Mean = mean(vectors');
	Mean = Mean';
	for k = ShotStart : ShotEnd,
		vectors(:,k-ShotStart+1) = abs(vectors(:,k-ShotStart+1) - Mean);
	end;
	v=sum(vectors);
	Min = min(v);
	kf = find(v==Min);
	if length(kf) > 1,
		kf = kf(1,1);
	end;
	fprintf(fd,'%d\n',ShotStart + kf - 1);
end;

fclose(fd);