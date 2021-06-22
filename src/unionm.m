function [R] = unionm(A,B)

C = sort(union(A,B),'descend');

if length(C) < length(A),
    P = zeros(1,length(A)-length(C));
    R = [C P];
else
    R = C;
end;