clc
clear all

load Jacques1_thirdord_working_data_F_005.txt


figure(1)
plot(Jacques1_thirdord_working_data_F_005(1:50000,7),Jacques1_thirdord_working_data_F_005(1:50000,6),'-',...
    Jacques1_thirdord_working_data_F_005(1:50000,7),-Jacques1_thirdord_working_data_F_005(1:50000,6),'-',...
    Jacques1_thirdord_working_data_F_005(50001:100000,7),Jacques1_thirdord_working_data_F_005(50001:100000,6),'-',...
    Jacques1_thirdord_working_data_F_005(50001:100000,7),-Jacques1_thirdord_working_data_F_005(50001:100000,6),'-',...
    Jacques1_thirdord_working_data_F_005(100002:150000,7),Jacques1_thirdord_working_data_F_005(100002:150000,6),'-',...
    Jacques1_thirdord_working_data_F_005(100002:150000,7),-Jacques1_thirdord_working_data_F_005(100002:150000,6),'-','LineWidth',6)
legend('s','s','0.00000036d0', '0.00000036d0','0.000000365d0','0.000000365d0','0.000000369d0','0.000000369d0')
title(['shape of an emerging tube at various lengths'],'FontName','Times New Roman','FontSize',24);
xlabel(['Z'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
ylabel(['R'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
set(gca,'FontSize',24,'FontWeight','bold','LineWidth',3);

figure(2)
plot(Jacques1_thirdord_working_data_F_005(1:21000,7),Jacques1_thirdord_working_data_F_005(1:21000,6),'-',...
    Jacques1_thirdord_working_data_F_005(1:21000,7),-Jacques1_thirdord_working_data_F_005(1:21000,6),'LineWidth',6)
legend('s','0.00000015300000000000d0', '0.00000015200000000000d0', '0.00000015100000000000d0')
title(['shape of an emerging tube at various lengths'],'FontName','Times New Roman','FontSize',24);
xlabel(['Z'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
ylabel(['R'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
set(gca,'FontSize',24,'FontWeight','bold','LineWidth',3);

figure(3)
plot(Jacques1_thirdord_working_data_F_005(21001:42000,7),Jacques1_thirdord_working_data_F_005(21001:42000,6),'-',...
    Jacques1_thirdord_working_data_F_005(21001:42000,7),-Jacques1_thirdord_working_data_F_005(21001:42000,6),'-','LineWidth',6)
legend('s','0.00000015300000000000d0', '0.00000015200000000000d0', '0.00000015100000000000d0')
title(['shape of an emerging tube at various lengths'],'FontName','Times New Roman','FontSize',24);
xlabel(['Z'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
ylabel(['R'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
set(gca,'FontSize',24,'FontWeight','bold','LineWidth',3);

figure(4)
plot(Jacques1_thirdord_working_data_F_005(42002:63000,7),Jacques1_thirdord_working_data_F_005(42002:63000,6),'-',...
    Jacques1_thirdord_working_data_F_005(42002:63000,7),-Jacques1_thirdord_working_data_F_005(42002:63000,6),'-','LineWidth',6)
legend('s','0.00000015300000000000d0', '0.00000015200000000000d0', '0.00000015100000000000d0')
title(['shape of an emerging tube at various lengths'],'FontName','Times New Roman','FontSize',24);
xlabel(['Z'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
ylabel(['R'],'FontWeight','bold','FontName','Times New Roman','FontSize',24);
set(gca,'FontSize',24,'FontWeight','bold','LineWidth',3);

