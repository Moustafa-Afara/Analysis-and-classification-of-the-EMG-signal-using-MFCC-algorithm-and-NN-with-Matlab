fnyc=1000;
fcuthigh=30;
fcutlow=300;
[b,a]=butter(4,[fcuthigh,fcutlow]/fnyc,'bandpass');
bphealthy=filtfilt(b,a,emghealth(:,2));
bpmyopathy=filtfilt(b,a,emgmyopath(:,2));
bpneuropathy=filtfilt(b,a,emgneuropath(:,2));
figure;
subplot(3,1,1);
plot(emghealth(:,1),bphealthy);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
title('healthy')
subplot(3,1,2);
plot(emghealth(:,1),bpmyopathy);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
title('myopathy')
subplot(3,1,3);
plot(emghealth(:,1),bpneuropathy);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
title('neuropathy')
suptitle('bandpass filtered signal') 
hold off

