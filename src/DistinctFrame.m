%Extract k number of most distinct frames from n number of frames

vdo = VideoReader('Taken.mp4');
Height = vdo.Height;
Width = vdo.Width;

load('KeyFrames.txt');
len = length(KeyFrames);

k = 5;

Differences = zeros(len,len);

FrequencyTables = zeros(1280,len);
for i =1 : len,
	FrequencyTables(:,i) = FrequencyTable(read(vdo,KeyFrames(i,1)),Height,Width);
end;
for i = 1 : len-1,
	for j = i + 1 : len,
		diff = sum(abs(FrequencyTables(:,i) - FrequencyTables(:,j))) / 1280;
		Differences(i,j) = diff;
		Differences(j,i) = Inf;
	end;
end;

for i = 1 : len,
    Differences(i,i) = Inf;
end;

Cluster = zeros(len,len+1);

for i = 1 : len,
    Cluster(i,1) = i;
end;

l = len;
while l > k,
    [i,j,r,c] = FindAndMerge(Differences,Cluster,len);
    Differences(r,c) = Inf;
    if i ~= j,
        Cluster(i,:) = unionm(Cluster(i,:),Cluster(j,:));
        Cluster(j,1) = 0;
        l = l - 1;
    end;
end;

A = zeros(1280,1);

for i = 1 : len,
    count = 0;
    for j = 1 : len + 1,
        if Cluster(i,j) ~= 0,
            count = count + 1;
            A = A + FrequencyTables(:,Cluster(i,j));
        elseif count ~= 0,
            meanVector = A / count;
            minD = sum(abs(meanVector - FrequencyTables(:,Cluster(i,1))))/1280;
            minV = Cluster(i,1);
            for k = 2 : count,
                D = sum(abs(meanVector - FrequencyTables(:,Cluster(i,k))))/1280;
                if D < minD,
                    D = minD;
                    minV = Cluster(i,k);
                end;
            end;
            fprintf('Frame %d : %d\n',i,KeyFrames(minV,1));
            break;
        end;
        if count == 0,
            break;
        end;
    end;
end;