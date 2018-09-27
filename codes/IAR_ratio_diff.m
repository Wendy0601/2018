clc;clear all; close all;
% data
ratio = [6, 12,18,  24 ,  30,50, 80, 100];
CNN_A1 = [68.4 88.6 95.8 91.7 90.7 94.8 97.9 95.9;73.3 79.2 76.2 73.3 75.2 74.2 69.3 89.1;91.9 90.1 93.7 95.5 95.5 95.5 96.3 97.3; 78.3 86.1 88.7 87.1 87.4 88.3 88.0 94.2]; % 90% testdata
CNN_B1 = [48.5 53.6 94.8 94.8 93.8 82.4 93.8 73.2; 41.6 53.4 65.3 59.4 54.4 60.4 58.4 62.4; 56.7 47.7 69.3  79.3 72.9 99.1 70.3 78.4;49.2 51.4 76.0 77.7 73.5 81.2 73.8 71.5]; % 90% testdata
 
 

% plot the figures
num_classifier = 2;
num_Type = 4;
font_size =12;
marker_type ={'bo-', 'r*-.', 'ks--','b*--','rs-','kd-.','mo--'};
fault_type ={'LT', 'GT', 'TP', 'Averaged'};
legend_text = {'CNN-F','CNN-T'};
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

 