%%% all input data
clear all
close all
load test.mat
global cpmg_length hard_90 J omega1A omega1B offset R
warning('off','all')

%% Input parameters
ncpmg=[2,4,6,8,10,12,16];     %list_of_cpmg_pulses
hard_90=0.000050;       %length_of_90_hard_pulse
data=test_data;        %(matrix= no. of peaks*no. of experiments)
noise=test_data_noise;   %snr of each spectra
label=test_data_labels;     %a_table_with_peak_names
uncertainty=estimate_noise(data,noise);
cpmg_length = 0.020  ; %(in s)
J=92.8;              %coupling_constant (1JNH)
omega1A=2*pi*000;    %
omega1B=2*pi/(4*hard_90); %
offset=0;            %offset
R=[1 0 0 0; 0 -1 0 0; 0 0 -1 0; 0 0 0 1]; %90_degree_pulse
nmc = 100 ;        %(no. of monte carlo iterations)


%% Calculate rate
for i =1:length(test_data(:,1))
    if uncertainty(i,:) < 5 & data(i,1) < data(i,2) & data(i,2) < data(i,length(data(i,:)))
    k(i,:) = call_solver(data(i,:),uncertainty(i,:),length(data(1,:)),ncpmg,label{i,1},i);  
    % k_unc(i,:)=calculate_uncertainity(k,data(i,:),uncertainty(i,:),length(data(1,:)),ncpmg,nmc); % not mandatory
    else
       'peak does not exchange or has low intensity'
    end 
end



