clc;clear all; close all;
% data
ratio = [0.5, 1, 1.5,2];
CNN_A = [93.5 96.1 89.1 90.2; 83.1 89.8 83.0 82.3; 95.0 97.3 99.1 98.3; 91.0 94.4 90.6 90.3];
CNN_B = [65.2 72.5 94.5 56.5; 76.4 63.8 79.4 52.2; 83.3 78.5  84.4 64.6; 75.7 71.7 85.6 57.9] % 'modelC_fully02'
% plot the figures  
num_classifier = 2;
num_Type = 4;
font_size =12;
marker_type ={'bo-', 'r*-.', 'ks--','b*--','rs-','kd-.','mo--'};
fault_type ={'LT', 'GT', 'TP', 'Averaged'};
legend_text = {'CNN A','CNN B'};
position_array=[0.1 0.64 0.38 0.29;
                0.57 0.64 0.38 0.29;
                0.1 0.18 0.38 0.29;
                0.57 0.18 0.38 0.29;
                0.25 0.02 0.50 0.04];
figure('units','pixels','position',[50 300 700 400]);
set(gca,'fontName','Times New Roman') 
for j=1:num_Type
    h=subplot(2,2,j);
    set(h,'Units','normalized','Position',position_array(j,:));
    plot(ratio,CNN_A(j,:),  marker_type{1}, 'linewidth', 1.5);
    hold on; 
    plot(ratio,CNN_B(j,:),  marker_type{2}, 'linewidth', 1.5);
    hold on;  
    xlabel('Time Interval \Delta t (second)','fontname','Times New Roman','fontsize',font_size); 
    ylabel('IAR (%)','fontname','Times New Roman','fontsize',font_size); 
    xlim([ratio(1) ratio(end)]);
    set(gca,'XTick',ratio);
    title(fault_type{j},'fontsize',font_size);
end
h = legend(legend_text, 'Orientation',...
    'horizonal','Location','none','fontname','Times New Roman','fontsize',font_size);
legend('boxoff');
set(h, 'Units','normalized','Position', position_array(5,:));

 