clc
clear all

load Jacques1_thirdord_working_data_Co_1_F_0_05.txt

A=Jacques1_thirdord_working_data_Co_1_F_0_05(:,6);
B=Jacques1_thirdord_working_data_Co_1_F_0_05(:,5);

figure(1)
plot(Jacques1_thirdord_working_data_Co_1_F_0_05(:,6),Jacques1_thirdord_working_data_Co_1_F_0_05(:,5),'-',...
Jacques1_thirdord_working_data_Co_1_F_0_05(:,6),-Jacques1_thirdord_working_data_Co_1_F_0_05(:,5),'-','LineWidth',6)
legend('Co=1')
title(['shape of an emerging tube at various lengths'],'FontName','Times New Roman','FontSize',24);
xlabel(['Z'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
ylabel(['R'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
set(gca,'FontSize',24,'FontWeight','bold','LineWidth',3);