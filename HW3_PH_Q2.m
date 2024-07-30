%Question 2 using a for loop
clear;
t=[-15:0.2:15];
for i=1:length(t);
    y_vector(i)=t(i)^4-(3*t(i)^2)+(2*t(i))-1;
end;

plot(t,y_vector, "*","Color",[0,1,0]);
title('y vs t');
xlabel('y');
ylabel('t');