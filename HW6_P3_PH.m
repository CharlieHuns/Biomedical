%HW6 Problem 2
clear;
r=0.003;
K=1e4;
V_start=1;
time_step=0.01;
number_people=100;
virus_load_at_death=1;
death_rate_array=zeros(1,30);
virus_load_at_death_array=zeros(1,30);
numb_death=0;


for j=1:30;
numb_death=0;
    for i=1:number_people;
    t=0;
    numb_virus=1;
    contact_time=rand*10000;
    while t<=contact_time;
        t=t+time_step;
        numb_virus=(V_start*K)/(V_start+(K-V_start)*exp(-r*t));
    end
    if numb_virus>=virus_load_at_death;
        numb_death=numb_death+1;
    end
end



    
    virus_load_at_death=virus_load_at_death+300;
    virus_load_at_death_array(j)=virus_load_at_death;
    death_rate=numb_death/number_people;
    death_rate_array(j)=death_rate;
end 

plot(-virus_load_at_death_array,death_rate_array)
axis([-9000 0 0 1]);
xlabel('individual virus lethality');
ylabel('death rate per 100 people');
hold all
legend('transmissibility .001', 'transmissibility .0015', 'transmissibility .002', 'transmissibilty .003','Location','northwest','NumColumns',2);
