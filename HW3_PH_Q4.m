%Question 4
clear;
close all;
rng('shuffle')
Number_motors=1;
Duration=600; %duration in seconds
Time_step_size=0.1; %time step stize at which motor position will be determined
Total_Steps=Duration/Time_step_size;
V_motor=50; %motor speed in nm/s
MT_Length=10000; %microtubule length in nm
Motor_position=rand()*10000;
Time=0; %starting time for simulation

Motor_position_array=zeros(1,Total_Steps);
Time_array=zeros(1,Total_Steps);

for i = 1:Total_Steps
    Motor_position=Motor_position+V_motor*Time_step_size;
    Time=Time+Time_step_size;
    Motor_position_array(i)=Motor_position;
    Time_array(i)=Time;
end;

plot(Time_array,Motor_position_array);
xlabel('Time in seconds');
ylabel('Motor Position in nm');
title('Time vs Position');

Final_motor_position=Motor_position;

%Part C
for j=1:500
    Motor_position=rand()*10000;
    Time=0
    for i = 1:Total_Steps
        Motor_position=Motor_position+V_motor*Time_step_size;
        Time=Time+Time_step_size;
        Motor_position_array(i)=Motor_position;
        Time_array(i)=Time;
        Final_motor_position=Motor_position;
    end;
    plot(Time_array,Motor_position_array);
    hold all;
    Final_motor_position_array(j)=Final_motor_position;
end;

xlabel('Time in seconds');
ylabel('Motor Position in nm');
title('Time vs Position');

figure;
histogram(Final_motor_position_array);
title('Motor Position Histogram')
