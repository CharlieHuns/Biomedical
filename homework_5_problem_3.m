%HW5_Q3_Top Level
clear;
Axon_Length=300;
Duration=1200; %duration in seconds
time_step=0.1; %in seconds
time_counter=0;
number_steps=round(Duration/time_step);
number_particles=10;
particle_position=zeros(1,number_particles)+300;
particle_state=zeros(1,number_particles)+1;
switch_probability=0.5;
JIP1_velocity=-1.3;
PJIP1_velocity=1.4;
Time_array=zeros(1,number_steps); %1D vector
Position_array=zeros(number_particles,number_steps); 
time=0;
for j=1:number_steps;
    Time_array(j)=j*time_step;
    for i=1:number_particles;
        Position_array(i,j)=particle_position(i);
        if particle_state(i)==1;
            particle_position(i)=JIP1_Motility(particle_position(i),JIP1_velocity,time_step,Axon_Length);
        else 
            particle_position(i)=P_JIP1_Motility(particle_position(i),PJIP1_velocity,time_step,Axon_Length);
        end
        particle_state(i)=Spatial_Switch_Decision(particle_state(i),particle_position(i),Axon_Length);
        
        end
    end


plot(Position_array,-Time_array, color=[0 1 0])
axis([0 300 -1200 0])
hold all