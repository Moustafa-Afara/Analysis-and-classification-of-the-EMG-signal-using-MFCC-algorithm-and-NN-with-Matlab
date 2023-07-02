[file,path] = uigetfile('inter signal data ','*.mat');
a=[path file];
load(a)
fnyc=1000;
fcuthigh=30;
fcutlow=300;
[b,a]=butter(4,[fcuthigh,fcutlow]/fnyc,'bandpass');
bpsig=filtfilt(b,a,sig(:,2));
plot(bpsig(:,1),bpsig);
xlabel('time(sec)')
ylabel('voltage(v)')
grid
hold on
title('pandbass signal')
hold off
signal=bpsig(:,2)';
desh=sum(abs(signal-netout(:,1)));
desm=sum(abs(signal-netout(:,2)));
desn=sum(abs(signal-netout(:,3)));
b=min(desm,desn,desh);
if b==desh
    msgbox('you have healthy emg')
elseif b==desm
    msgbox('you have myopathy emg')
elseif b==desn
    msgbox('you have neouropathy emg')
end

