syms x;

sigma1 = StandardDeviationForFrameWithinShot;
mu1 = MeanForFrameWithinShot;
pdf1 = (1/(sqrt(2*pi)*sigma1))*exp(-(x-mu1)*(x-mu1)/(2*sigma1*sigma1));
p1 = length(FrameWithinShot) / (length(FrameWithinShot)+length(FrameBetweenShot));

sigma2 = StandardDeviationForFrameBetweenShot;
mu2 = MeanForFrameBetweenShot;
pdf2 = (1/(sqrt(2*pi)*sigma2))*exp(-(x-mu2)*(x-mu2)/(2*sigma2*sigma2));
p2 = length(FrameBetweenShot) / (length(FrameWithinShot)+length(FrameBetweenShot));

min_value = [10000];

f1 = int(pdf1,x);
f2 = int(pdf2,x);


for i = 1 : 200,
	a = abs(p2 * (subs(f2,-Inf)-subs(f2,i))) + abs(p1 * (subs(f1,i)-subs(f1,Inf)));
	min_value = [min_value [a]];
end;

[a,t] = min(min_value);
t = t - 1;
disp(t);