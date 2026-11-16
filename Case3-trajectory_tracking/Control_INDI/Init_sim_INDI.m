clear
% InitFunction
% load MavLinkStruct;
% InitFunction;
%% ------------------------------Model Parameter---------------------------
InitData;
%Initial condition
ModelInit_PosE=[0;0;-75];                      % 位置向量，用于设置飞机的初始位置，对应了CopterSim上的X和Y初始值 (m)
ModelInit_VelB=[0;0;0];  % 速度向量，地球坐标系的xyz速度（z向下为正）(m/s)
ModelInit_AngEuler = [0;0;0];      %飞机初始姿态角,用于设定飞机的初始姿态 (roll,pitch,yaw)(rad)
ModelInit_RateB=[0;0;0];                     % 体坐标系下飞机角速度 (rad/s)
% ModelInit_PosE=[898.14;0;-45.949];                      % 位置向量，用于设置飞机的初始位置，对应了CopterSim上的X和Y初始值 (m)
% ModelInit_VelB=[30;0;-0.3824];  % 速度向量，地球坐标系的xyz速度（z向下为正）(m/s)
% ModelInit_AngEuler = [0;-0.00342;0];      %飞机初始姿态角,用于设定飞机的初始姿态 (roll,pitch,yaw)(rad)
% ModelInit_RateB=[0;0.00197;0];                     % 体坐标系下飞机角速度 (rad/s)
ModelInit_Inputs = [0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0];  %执行器的初始参数

ModelParam_uavType = int8(100); %这里是四旋翼X型，具体定义见文档"机型定义文档.docx"
%Environment Parameter
ModelParam_envLongitude = 116.259368300000;  %经度，初始大地经度
ModelParam_envLatitude = 40.1540302;         %纬度，初始大地纬度
ModelParam_GPSLatLong = [ModelParam_envLatitude ModelParam_envLongitude]; %初始大地经度和纬度
ModelParam_envAltitude = -50;     %参考高度，负值

ModelParam_GlobalNoiseGainSwitch =0.4;       %GPS噪声信号增益
ModelParam_timeSampBaro = 0.01;              %晴雨表数据样本时间
ModelParam_timeSampTurbWind = 0.01;          %大气湍流数据采样时间
ModelParam_BusSampleRate = 0.001;
ModelParam_GPSEphFinal=0.3;                  %GPS水平方向定位精度，单位cm，如果不知道设为65535
ModelParam_GPSEpvFinal=0.4;                  %GPS竖直方向定位精度，单位cm，如果不知道设为65535
ModelParam_GPSFix3DFix=3;                    %定位类型 0-1: no fix, 2: 2D fix, 3: 3D fix.
ModelParam_GPSSatsVisible=10;                %可见卫星数，如果不知道设为255

%Noise Parameter
ModelParam_noisePowerAccel = [0.001,0.001,0.003];   %机体坐标系下加速度计功率，顺序 xyz 下同  不要修改这里
ModelParam_noiseSampleTimeAccel = 0.001;            %机体坐标系加速度器噪声采样时间
%ModelParam_noiseLowPassFilterCoeAccel = 0.0001;
ModelParam_noisePowerOffGainAccel = 0.04;           %机体坐标系,无电机振动的加速度计噪声因子（x、y方向），暂未起作用
ModelParam_noisePowerOffGainAccelZ = 0.03;          %机体坐标系,无电机振动的加速度计噪声因子（z方向），暂未起作用
ModelParam_noisePowerOnGainAccel = 0.8;             %机体坐标系,电机振动下的加速度计噪声因子（x、y方向），暂未起作用
ModelParam_noisePowerOnGainAccelZ = 4.5;            %机体坐标系,电机振动下的加速度计噪声因子（z方向），暂未起作用

ModelParam_noisePowerGyro = [0.00001,0.00001,0.00001];%机体坐标系下角加速度计功率，不要修改这里
ModelParam_noiseSampleTimeGyro = 0.001;             %角加速度器噪声采样时间
%ModelParam_noiseLowPassFilterCoeGyro = 0.0001;
ModelParam_noisePowerOffGainGyro = 0.02;            %机体坐标系,无电机振动的角加速度计噪声因子（x、y方向），暂未起作用
ModelParam_noisePowerOffGainGyroZ = 0.025;          %机体坐标系,无电机振动的角加速度计噪声因子（z方向），暂未起作用
ModelParam_noisePowerOnGainGyro = 2;%3.2;           %机体坐标系,电机振动下的角加速度计噪声因子（x、y方向），暂未起作用
ModelParam_noisePowerOnGainGyroZ = 1;               %机体坐标系,电机振动下的角加速度计噪声因子（z方向），暂未起作用

ModelParam_noisePowerMag = [0.00001,0.00001,0.00001];%磁通量功率，不要修改这里
ModelParam_noiseSampleTimeMag = 0.01;               %磁通量噪声采样时间
%ModelParam_noiseLowPassFilterCoeMag = 0.02;%暂时没有使用
ModelParam_noisePowerOffGainMag = 0.02;             %机体坐标系，无电机磁场效应的磁强计噪声增益（x、y方向），暂未起作用
ModelParam_noisePowerOffGainMagZ = 0.035;           %机体坐标系，无电机磁场效应的磁强计噪声增益（z方向），暂未起作用
ModelParam_noisePowerOnGainMag = 0.025;             %机体坐标系，电机磁场效应下的磁强计噪声增益（x、y方向），暂未起作用
ModelParam_noisePowerOnGainMagZ = 0.05;             %机体坐标系，电机磁场效应下的磁强计噪声增益（z方向），暂未起作用

ModelParam_noisePowerIMU=0;%IMU噪声，这里是白噪声，这里是经过归一化

ModelParam_noiseUpperGPS=0.5;  %GPS定位误差噪声，均匀噪声，这里填x,y,z的波动上限，单位是m
ModelParam_noiseGPSSampTime=0.2;%默认0.05

ModelParam_noiseUpperBaro=0; %气压计噪声，均匀噪声，这里填高度的波动上限，单位是m
ModelParam_noiseBaroSampTime=0.5;%气压计噪声更新频率，，默认0.05
ModelParam_noiseBaroCoupleWithSpeed=0;%气压计测量高度与动压关系，也就是风速与气压计掉高模型的系数，当前参数0.008飞机10m/s掉高1m

ModelParam_noiseUpperWindBodyRatio=0;%风波动系数，风速*(1+该系数)
ModelParam_noiseWindSampTime=0.001;

%%ModelParam_envGravityAcc = 9.81;
ModelParam_envAirDensity = 1.225;    %还没有用到
ModelParam_envDiffPressure = 0; % Differential pressure (airspeed) in millibar
ModelParam_noiseTs = 0.001;

%% 模型测试--手动给定控制输入
w1 = 0.4;
w2 = 0.4;
w3 = 0;
tilt1 = 1;
tilt2 = 1;
%% 飞行模态赋值
flightState = struct;
flightState.Hover = 0;
flightState.Transition = 1;
flightState.FixedWing = 2;
flightState.BackTransition = 3;
%% 控制信号与执行器限幅
control = struct;
control.maxClimbRate = 3;
control.maxDescendRate = -3;
control.maxPitch = 60*pi/180;
control.minPitch = -60*pi/180;
control.maxRoll = 15*pi/180;
control.minRoll = -15*pi/180;
control.maxPitchRate = 70*pi/180;
control.minPitchRate = -70*pi/180;
control.maxRollRate = 70*pi/180;
control.minRollRate = -70*pi/180;
control.maxYawRate = 70*pi/180;
control.minYawRate = -70*pi/180;
control.maxMRvelocity = 5;
control.maxMRvelocity_for = 15;
control.maxMRvelocity_back = 5;
control.maxMRvelocity_lat = 3;
control.maxTiltMR = 45*pi/180;
control.minTiltMR = -15*pi/180;
control.FWmaxPitch = 30*pi/180;
control.FWminPitch = -30*pi/180;
FWSpeed0 = 15;
control.FWmaxSpeed = 5; %固定翼模态的给定速度最大增量

%% 固定翼模态控制
% 高度控制
control.FW = struct;
control.FW.alt_P = 0.2;  % 0.2
control.FW.alt_I = 0;
control.FW.alt_D = 0;
control.FW.vz_P = 0.01;  % 0.025
control.FW.vz_I = 0.01;   % 0.05
control.FW.vz_D = 0;
% 俯仰控制
control.FW.pitch_P = 5;      %0.8
control.FW.pitch_I = 1;      %10
control.FW.pitchRate_P = 1;   %65
control.FW.pitchRate_I = 0.5;   %5
control.FW.pitchRate_D = 0;   %50
% 速度控制
control.FW.airspeed_P = 3;  % 3
control.FW.airspeed_I = 1;  % 1
control.FW.airspeed_D = 0;  %0.01
%滚转控制
control.FW.roll_P = 50;    % 50
control.FW.roll_I = 80;    % 80
control.FW.rollRate_P = 0.1;
control.FW.rollRate_I = 0;
control.FW.rollRate_D = 0;
%偏航控制
control.FW.yawRate_P = 0.0001;
control.FW.yawRate_I = 0;
control.FW.yawRate_D = 0;
%高度速度控制（TECS）
control.FW.TECSalt_P = 0.4; 
control.FW.TECSalt_I = 0;
control.FW.TECSalt_D = 0;
control.FW.TECSairspeed_P = 10; 
control.FW.TECSairspeed_I = 5;  
control.FW.TECSairspeed_D = 0;  
control.FW.E_P = 0.1; %0.1
control.FW.E_I = 0.5; %1
control.FW.E_D = 0;
control.FW.B_P = 0.3; %0.3
control.FW.B_I = 0.5; %1
control.FW.B_D = 0;

%% 多旋翼模态控制
%% 位置环控制参数
% 高度控制
control.MR = struct;
control.MR.alt_P = 5;    % 1
control.MR.alt_I = 0;    % 0
control.MR.alt_D = 5;    % 0

% 前向通道控制
control.MR.x_P = 3;   %1
control.MR.x_I = 0;   %1.5
control.MR.x_D = 0.5; %0

% 横侧向通道控制
control.MR.y_P = 2.0;  % 2.5
control.MR.y_I = 0;    % 0
control.MR.y_D = 0.6;  % 0.8

%% 姿态环控制参数
% 滚转控制
control.MR.roll_P = 6.5;   % 3
control.MR.roll_I = 0;
control.MR.roll_D = 0; % 0.35

% 俯仰控制
control.MR.pitch_P = 5;   %20  2

% 偏航控制
control.MR.yaw_P = 5;  %0.5   2
control.MR.yaw_I = 4;    %0   2
control.MR.yaw_D = 1;

%% INDI控制
% 速度控制
% u通道
k_u = 0.5;       %1
k_lpf_u = 10;    %10

% v通道
k_v = 0.5;     % 0.5
k_lpf_v = 1;   % 1

% w通道
k_w = 2;       % 5
k_lpf_w = 50;  % 6

% 角速率控制
% 滚转通道
k_p = 5;       % 5 
k_lpf_p = 50;  % 50

% 俯仰通道
k_q = 20;      % 20
k_lpf_q = 80;   % 80

% 偏航通道
k_r = 1.5;       % 1.5
k_lpf_r = 5;  % 50




