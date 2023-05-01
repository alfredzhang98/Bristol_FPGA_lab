% Group 04
% Qingyu Zhang <vn22984@bristol.ac.uk>
% Shuran Yang  <rw22242@bristol.ac.uk>
% Ruilong Liu  <hx22195@bristol.ac.uk>

clc,
clear,
close all

fid = fopen('./../part1_task2_4/out.txt','r');
data = textscan(fid,'%s'); 
fclose(fid);
num_array = [];

for i = 1:length(data{1})
    line_str = data{1}{i};
    line_str = strrep(line_str, 'x', ''); 
    num = str2double(line_str);
    num_array = [num_array, num];
end

% disp(num_array);
plot(num_array);