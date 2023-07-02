fs=2000;
f=fs*(0:(4001/2))/4001;
figure;

p1=fft(emghealth(:,2));
p1=abs(p1/4001);
p1=p1(1:4001/2+1);
p1(2:end-1)=2*p1(2:end-1);
subplot(3,1,1)
plot(f,p1)
xlabel('Freq(hz)')
ylabel('intensity')
title('healthy')
grid
p2=fft(emgmyopath(:,2));
p2=abs(p2/4001);
p2=p2(1:4001/2+1);
p2(2:end-1)=2*p2(2:end-1);
subplot(3,1,2)
plot(f,p2)
xlabel('Freq(hz)')
ylabel('intensity')
title('myopathy')
grid
p3=fft(emgneuropath(:,2));
p3=abs(p3/4001);
p3=p3(1:4001/2+1);
p3(2:end-1)=2*p3(2:end-1);
subplot(3,1,3)
plot(f,p3)
xlabel('Freq(hz)')
ylabel('intensity')
title('neuropathy')
suptitle('fft') 
grid


