clear
T=[1,10,100,1000,10000,100000,1000000,10000000];
load('time_GNSDP.mat')
load('time_GTRS.mat')
load('time_GNULS.mat')
figure
%ULS
loglog(T,time_0,'--s','LineWidth',1,'MarkerSize',6,'Color','#f6d04d');
hold on
%GN-SDP
loglog(T,time_1,'-.s','LineWidth',1,'MarkerSize',6,'Color','#42218E');
hold on
%GTRS
loglog(T,time_2,'-.s','LineWidth',1,'MarkerSize',6,'Color','#629460');
hold on
%GN-ULS
loglog(T,time_e,'--s','LineWidth',1,'MarkerSize',6,'Color','#fd5f00');
hold on
set(gca,'Fontname', 'Times New Roman')
xlabel('Repeated Measurement Numbers')
ylabel('Time(s)')
legend( 'ULS','SDP','GTRS','GN-ULS','Location','Best')
grid on

