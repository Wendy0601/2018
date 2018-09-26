clc;clear all; close all;
% data
ratio = [6, 12,18,  24 ,  30,50, 80, 100];
CNN_A1 = [68.6 89.2 94.1 92.2  91.2 95.1 98.0 96.1 ;73.1 79.6 75.0 72.2 75.0 75.0 70.3 89.8 ; 92.0 90.2 93.8 95.5 95.5 95.5 96.4 97.3; 78.3 86.3 87.3 86.6 87.3 88.5 88.2 94.4];
CNN_B1 = [47.1  51.9 92.1 95.0 94.1 82.3 94.1  72.5;42.6 54.6 68.5 60.1 56.5 62.9 60.2 63.8 ;57.1 47.3 81.2 79.4 73.2 99.1 69.6 78.5;49.1 51.2 80.4 77.9 74.2 81.7 74.2 71.7];  
 
 

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
    plot(ratio,CNN_A1(j,:),  marker_type{1}, 'linewidth', 1.5);
    hold on; 
    plot(ratio,CNN_B1(j,:),  marker_type{2}, 'linewidth', 1.5);
    hold on;  
    xlabel('Percentage of Training Data (%)','fontname','Times New Roman','fontsize',font_size); 
    ylabel('IAR (%)','fontname','Times New Roman','fontsize',font_size); 
    xlim([ratio(1) ratio(end)]);
    set(gca,'XTick',ratio);
    title(fault_type{j},'fontsize',font_size);
end
h = legend(legend_text, 'Orientation',...
    'horizonal','Location','none','fontname','Times New Roman','fontsize',font_size);
legend('boxoff');
set(h, 'Units','normalized','Position', position_array(5,:));

 