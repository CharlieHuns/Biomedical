%Homework 6
clear;

sum_array=[];
y=1;
i=1;
x=0;
while y<9.99;
   y=10*(1-(exp(-x/4)));
   x_array(i)=x;
   y_array(i)=y;
   x=x+1;
   i = i + 1;
end 

plot(x_array,y_array)