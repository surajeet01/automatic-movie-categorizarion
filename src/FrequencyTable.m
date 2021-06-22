function cft = FrequencyTable(frame,FrameHeight,FrameWidth)

Rft = zeros(256,1);
Gft = zeros(256,1);
Bft = zeros(256,1);
Yhft = zeros(256,1);
Yvft = zeros(256,1);

R = frame(:,:,1);
G = frame(:,:,2);
B = frame(:,:,3);

%FREQUENCY TABLE FOR R,G,B
for i = 1 : FrameHeight,
	for j = 1 : FrameWidth,
		Rft(R(i,j)+1,1) = Rft(R(i,j)+1,1) + 1;
		Gft(G(i,j)+1,1) = Gft(G(i,j)+1,1) + 1;
		Bft(B(i,j)+1,1) = Bft(B(i,j)+1,1) + 1;
	end;
end;	


ycbcr = rgb2ycbcr(frame);
y = ycbcr(:,:,1);

%FREQUENCY TABLE FOR Y HORIZONTAL
y1 = y;
for i = 1 : FrameWidth - 1,
	y1(:,i) = abs(y1(:,i) - y1(:,i+1));
end;
y1 = [y1 zeros(size(y1,1),1)];
y1 = y1(:,2:end);
y1 = abs(y1 - y);
y1 = y1(:,1:end-1);
for i = 1 : FrameHeight,
	for j = 1 : FrameWidth-1,
		Yhft(floor(y1(i,j)+1),1) = Yhft(floor(y1(i,j)+1),1) + 1;
	end;
end;

%FREQUENCY TABLE FOR Y VERTICAL
y1 = y;
for i = 1 : FrameHeight - 1,
	y1(i,:) = abs(y1(i,:) - y1(i+1,:));
end;
y1 = y1(1:end-1,:);
for i = 1 : FrameHeight-1,
	for j = 1 : FrameWidth,
		Yvft(floor(y1(i,j)+1),1) = Yvft(floor(y1(i,j)+1),1) + 1;
	end;
end;

%FINAL  FREQUENCY VEECTOR
cft=[Rft;Gft;Bft;Yhft;Yvft];