pdfForFrameBetweenShot = normpdf(FrameBetweenShot,MeanForFrameBetweenShot,StandardDeviationForFrameBetweenShot);
pdfForFrameWithinShot = normpdf(FrameWithinShot,MeanForFrameWithinShot,StandardDeviationForFrameWithinShot);

plot(FrameBetweenShot,pdfForFrameBetweenShot,FrameWithinShot,pdfForFrameWithinShot,'r','Linewidth',1.5);
legend('FrameBetweenShot','FrameWithinShot');