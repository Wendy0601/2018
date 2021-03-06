clear; close all;
% parameters
t01=122; t02 = t01 + 120; method =2; thres=0.99;gap=0;noise=0; noise_level=0;freq0=2; dimx =9;
bus= 26;   
load('E:\identification_data\01_PSSE_datasets\Dataset\01Multiple_event\special_cases\Generator4trip_1s_linetrip\line_trip26-29.mat','bus_v')
two_event = bus_v; 
load('E:\identification_data\01_PSSE_datasets\Dataset\Generator_trip\generator_trip5.mat', 'bus_v')
first_event = bus_v;
load('E:\identification_data\01_PSSE_datasets\Dataset\linetrip26-29.mat', 'bus_v');
sec_event = bus_v; 
% subtract the first event
first_event_norm = sub_rowmean(first_event,121); 
two_event_norm = sub_rowmean(two_event,121);  
sec_event_norm = sub_rowmean(sec_event,121);
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
 
X2_v= sub_rowmean(bus_v,121);
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
 
figure('units','pixels','position',[50 300 350 220]); 
% subplot(1,2,1);
plot(two_event_norm(bus,1:4:end)','k-','lineWidth',2);xlim([20,100]);  ylim([-0.08,0.005]);  
hold on;plot( sec_event_norm(bus,1:4:end)','b--','lineWidth',2);  
legend('Two events','The second event only', 'location','best')
xlim([20,100]) ; 
xlabel('Time (0.033 second)') 
ylabel({'Voltage Magnitudes';'after Normalization  (p.u.)'})
set(gca,'fontName','Times New Roman')  
% subplot(1,2,2);
figure('units','pixels','position',[50 300 350 220]); 
 plot(residue(bus,1:4:end)','g-','lineWidth',2);   ylim([-0.06,0.005]);  
hold on;plot( sec_event_norm(bus,1:4:end)','b--','lineWidth',2);  
legend('The residual','The second event only', 'location','best')
xlim([20,100]) ;    
xlabel('Time (0.033 second)') 
ylabel({'Voltage Magnitudes';'after Normalization  (p.u.)'}) 
set(gca,'fontName','Times New Roman') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters
t01=122; t02 = t01 + 60; method =2; thres=0.9999;gap=0;noise=0; noise_level=0;freq0=2; dimx =9;
bus=25;  
load('E:\identification_data\01_PSSE_datasets\Dataset\01Multiple_event\Figure_data\gener8_25-54_halfsec_new.mat', 'bus_v'); 
two_event = bus_v;  
load('E:\identification_data\01_PSSE_datasets\Dataset\01Multiple_event\Figure_data\gener8_new.mat', 'bus_v');
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

% subplot(2,1,1);
figure('units','pixels','position',[50 300 350 220]); 
plot(two_event_norm(bus,1:4:end)','k-','lineWidth',2);xlim([20,100]);  ylim([-0.08,0.005]);  
hold on;plot( sec_event_norm(25,1:4:end)','b--','lineWidth',2);  
legend('Two events','The second event only', 'location','best')
xlim([20,100]) ; 
xlabel('Time (0.033 second)') 
ylabel({'Voltage Magnitudes';'after Normalization  (p.u.)'}) 
set(gca,'fontName','Times New Roman') 
figure('units','pixels','position',[50 300 350 220]); 
%  subplot(2,1,2);
 plot(residue(bus,1:4:end)','g-','lineWidth',2);   ylim([-0.06,0.005]);  
hold on;plot( sec_event_norm(25,1:4:end)','b--','lineWidth',2);  
legend('The residual','The second event only', 'location','best')
xlim([20,100]) ;    
xlabel('Time (0.033 second)') 
ylabel({'Voltage Magnitudes';'after Normalization  (p.u.)'})
set(gca,'fontName','Times New Roman')  