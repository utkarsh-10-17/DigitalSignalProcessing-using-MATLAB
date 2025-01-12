function [Output_x] = int_func(data_x,step_size)

T1 = (data_x(1,1)+data_x(1,end));
T2 = 2*sum(data_x(1,2:end-1));
T3 = T1 + T2;
Output_x= (T3*(step_size))/2;
end

