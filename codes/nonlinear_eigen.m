clear;  
close all;
% parameters
t01=122; t02 = t01 + 60; method =2; thres=0.9999;gap=0;noise=0; noise_level=0;freq0=2; dimx =9;
bus=25; 
load('E:\identification_data\01_PSSE_datasets\Dataset\01Multiple_event\Figure_data\gener8_25-54.mat', 'bus_v'); 
two_event = bus_v; 
load('E:\identification_data\01_PSSE_datasets\Dataset\Generator_trip\generator_trip8.mat', 'bus_v');
first_event = bus_v;
load('E:\identification_data\01_PSSE_datasets\Dataset\01Multiple_event\Figure_data\line25-54_new', 'bus_v');
sec_event = bus_v;
sec_event_norm = sub_rowmean(sec_event,121);
% subtract the first event
first_event_norm = sub_rowmean(first_event,121); 
two_event_norm = sub_rowmean(two_event,121);  
residue = two_event(:,1:size(first_event,2)) - first_event(:,:); 

% compute eigenvalues 
mu_Ob = zeros(dimx,1);mu_first = zeros(dimx,1);mu_sec = zeros(dimx,1); mu_approx = zeros(dimx,1);
X0_v=sub_rowmean(two_event,t01-1); 
Observe_v=X0_v(:,t02+1:4:t02+120); 
output_Ob  = DMD_sub( thres,gap,Observe_v,noise,freq0 , dimx); 
mu_Ob(1:numel(output_Ob.mu),1)=  output_Ob.mu  ;%

X1_v= sub_rowmean(first_event,t01-1);
true_first = X1_v(:,t01+1:4:t01+120);
output_first = DMD_sub(thres, gap, true_first, noise, freq0,dimx);
mu_first(1:numel(output_first.mu),1) = output_first.mu;
 
X2_v= sub_rowmean(sec_event,t01-1);
true_sec = X2_v(:,t02+1:4:t02+120);
output_sec = DMD_sub(thres, gap, true_sec, noise, freq0,dimx);
mu_sec(1:numel(output_sec.mu),1) = output_sec.mu;

approx = residue(:,t02+1:4:t02+120);
output_approx = DMD_sub(thres, gap, approx, noise, freq0,dimx);
mu_approx(1:numel(output_approx.mu),1) = output_approx.mu;
real_Ob = real(mu_Ob);
real_first = real(mu_first);
real_sec = real(mu_sec);
real_approx = real(mu_approx);

figure;  
subplot(2,2,1);
plot(two_event_norm(bus,1:4:end)','k-','lineWidth',2);xlim([20,100]);  ylim([-0.08,0.005]);  
hold on;plot( sec_event_norm(25,1:4:end)','b--','lineWidth',2);  
legend('Two-event','True Second', 'location','best')
xlim([40,100]) ; 
xlabel('Time (0.033 second)') 
ylabel('Voltage Magnitudes (p.u.)')
title('(e)') 
set(gca,'fontName','Times New Roman') 
subplot(2,2,2);
stem(-real(mu_Ob(1)), 'lineWidth', 2); hold on ; stem(-real(mu_sec(1)), 'lineWidth', 2);
legend('Two-event ','True Second','location','best')
xlabel('The Eigenvalue Index')
ylabel('Eigenvalue')
set(gca,'XTick', [0,1,2])
title('(g)')
set(gca,'fontName','Times New Roman') 
subplot(2,2,3);
plot(residue(bus,1:4:end)','g-','lineWidth',2);   ylim([-0.06,0.005]);
load('E:\identification_data\01_PSSE_datasets\Dataset\01Multiple_event\Figure_data\line25-54_new', 'bus_v');
sec_event = bus_v;
sec_event_norm = sub_rowmean(sec_event,121);
hold on;plot( sec_event_norm(25,1:4:end)','b--','lineWidth',2);  
legend('The Residual','True Second', 'location','best')
xlim([40,100]) ;    
xlabel('Time (0.033 second)') 
ylabel('Voltage Magnitudes (p.u.)')
title('(f)')
set(gca,'fontName','Times New Roman') 
subplot(2,2,4)
stem( real(mu_approx(1)), 'lineWidth', 2);; hold on ; stem(-real(mu_sec(1)), 'lineWidth', 2);
legend('The Residual','True Second','location','best')
title('(h)') 
xlabel('The Eigenvalue Index')
ylabel('Eigenvalue')
set(gca,'XTick', [0,1,2]) 
set(gca,'fontName','Times New Roman') 
