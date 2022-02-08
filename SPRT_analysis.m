%%  SPRT Analysis
clc;clear;close all;
%% Load Data file
load('sampleData.mat'); % This information is obtained from https://www.covid19india.org
time = sprtData.date;
TestData = (sprtData.TotalTested)'; % Number of test done in cumulative form
PositiveData = (sprtData.Positive)'; % Number of Positive cases in cumulative form
%% Setting the parameters
alpha = 0.0002;
beta = 0.0003;
p0 = 0.057515;
p1 = 0.057571;
%% Plotting the parallel lines
x = linspace(0,max(TestData),length(TestData));
y = linspace(0,max(PositiveData),length(PositiveData));
h0= log((1- alpha)/beta)/(log((p1/p0)*((1-p0)/(1-p1))));
h1= log((1- beta)/(alpha))/(log((p1/p0)*((1-p1)/(1-p0))));
s =  log((1-p0)/(1-p1))/(log((p1/p0)*(1-p0)/(1-p1)));
hold on;
y1 = -h0 + s * x;
y2 = h1 + s * x;
plot(x,y1,'-r','LineWidth',2.5)
hold on;
plot(x,y2,'-b','LineWidth',2.5)
hold on;
%% Plotting the testing and positive data
plot(TestData,PositiveData,'--k','LineWidth',1.75)
xlabel('Number of tests done');
ylabel('Number of positive cases')
