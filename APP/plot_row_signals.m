figure;
subplot(3,1,1)
plot(emghealth(:,1),emghealth(:,2))
xlabel('time(s)')
ylabel('VOLTAGE(mv)')
grid
hold on
title('healthy')
subplot(3,1,2)
plot(emgmyopath(:,1),emgmyopath(:,2))
xlabel('time(s)')
ylabel('VOLTAGE(mv)')
grid
hold on
title('myopathy')
subplot(3,1,3)
plot(emgneuropath(:,1),emgneuropath(:,2))
xlabel('time(s)')
ylabel('VOLTAGE(mv)')
grid

hold on
title('neuropathy')
suptitle('row signal') 
hold off

