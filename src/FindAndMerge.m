function [li,lj,r,c] = FindAndMerge(Diff,Cluster,len)

[m1,r] = min(Diff);
[~,c] = min(m1);
r = r(1,c);
li = 0;
for i = 1 : len,
    for j = 1 : len + 1,
        if Cluster(i,j) > 0
            if Cluster(i,j) == r,
                li = i;
            end;
        else
            break;
        end;
    end;
    if li > 0,
        break;
    end;
end;

lj = 0;
for i = 1 : len,
    for j = 1 : len + 1,
        if Cluster(i,j) > 0
            if Cluster(i,j) == c,
                lj = i;
            end;
        else
            break;
        end;
    end;
    if lj > 0,
        break;
    end;
end;