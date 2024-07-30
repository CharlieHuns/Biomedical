%code to simulate motor walking
clear;
clc;
kon_motor = 1 %μM-1s-1
rng('shuffle')  %seed random numbers with clock
number_motors = 100;  %number of motors
duration = 20*60; % duration in sec
v_motor = 3*1000/60;  %motor velocity in nm/s from howard
time_step = 0.01; %simulation time step in sec
position = zeros(number_motors,round(duration/time_step)); %initialize motor position array
time = zeros(1, round(duration/time_step));  %initialize time array
MT_Length = 10000;  %MT Length in nm
motor_position_counter =zeros(1,number_motors);
time_counter=0;
for i = 1: round(duration/time_step);
    
    time(i) = time_counter; %assign time array
    time_counter = time_counter + time_step;  %increment time counter
    
    for j = 1: number_motors;
          if motor_position_counter(j)==0; %if true, motor is detached 
              mt_conc=(2.0e-7)*(MT_Length);
              motor_on_rate=kon_motor*mt_conc;
              pr_attach=1-(exp(-1*motor_on_rate*time_step));
              if rand<pr_attach;
                  motor_position_counter(j)=rand*MT_Length;
              end
                  
          else %motor is attached

        motor_position_counter(j) = motor_position_counter(j) + (v_motor*time_step);  %increment position counter
        
        if motor_position_counter(j) > MT_Length;
           motor_position_counter(j) = MT_Length;
        end
          end
        position(j,i) = motor_position_counter(j);  %assign position array
        
    end
    
end
final_position = max(position,[],2);  %calculate max position of each motor
figure
hist(final_position)
figure
plot(position, -time, '*')
xlabel('position (nm)')
ylabel('time (s)')
