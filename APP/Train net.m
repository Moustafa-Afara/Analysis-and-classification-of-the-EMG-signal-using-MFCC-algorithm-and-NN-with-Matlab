healthy=abs(bphealthy(:,1));
myopathy=abs(bpmyopathy(:,1));
neuropathy=abs(bpneuropathy(:,1));
window=50;
envhealth=sqrt(movmean((healthy.^2),window));
envmyopath=sqrt(movmean((myopathy.^2),window));
envneuropath=sqrt(movmean((neuropathy.^2),window));
% max values in all three signals mv=[3.9,4.9,1.9];
mvnormhealth=(envhealth./3.9).*100;
mvnormmyopath=(envmyopath./4.9).*100;
mvnormneuropath=(envneuropath./1.9).*100;
% ploting
figure;
subplot(3,1,1);
plot(emghealth(:,1),healthy);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
title('healthy')
plot(emghealth(:,1),envhealth,'r','linewidth',2);
subplot(3,1,2);
plot(emghealth(:,1),myopathy);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
plot(emghealth(:,1),envmyopath,'r','linewidth',2);
title('myopathy')
subplot(3,1,3);
plot(emghealth(:,1),neuropathy);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
title('neuropathy')
plot(emghealth(:,1),envneuropath,'r','linewidth',2);
suptitle('means values  signal') 
hold off
net=newff(minmax([bphealthy';bpmyopathy';bpneuropathy']),[20,3],{'tansig','tansig','purelin'},'trainlm');
net.trainParam.show = 30;
 net.trainParam.lr=0.07;
 net.trainParam.goal=0.00150;
 net.trainParam.epochs=1000; 
 %training the net
  
[net,tr]=train(net,[bphealthy';bpmyopathy';bpneuropathy'],[envhealth';envmyopath';envneuropath']);

% simulating the net

netout= sim(net , [bphealthy';bpmyopathy';bpneuropathy']);
