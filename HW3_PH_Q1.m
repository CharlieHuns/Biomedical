%HW3 09212023 GCD5005 PeterHunsader

clear;

%Question 1
for i = 1:50;
   difference=(exp(-1))-(1-(1/i))^i;
   n(i)=i;
   error(i)=difference;
end;

plot(n,error);
title('error vs n');
xlabel('n');
ylabel('error');


