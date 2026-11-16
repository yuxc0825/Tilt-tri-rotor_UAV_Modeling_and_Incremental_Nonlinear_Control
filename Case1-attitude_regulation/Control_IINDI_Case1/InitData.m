%% 环境模型参数
env = struct;
env.ISA_lapse = 0.0065;     %温度垂直梯度(K/m)
env.ISA_hmax = 2000; % 大气模型的高度最大值
env.ISA_R = 287.0531;       %特征气体常数(J/Kg/K)
env.ISA_g = 9.80665;        %重力加速度(m/s^2)
env.ISA_rho0 = 1.225;       %空气密度 (Kg/m^3)
env.ISA_P0 = 101325;        %环境压力 (N/m^2)
env.ISA_T0 = 288.15;        %环境温度(K)
env.windBase = 12;          %风速,干风湍流模块/水平风模块内的参数(m/s)
env.windDirTurb = 180;      %风向（顺时针方向），干风湍流模块内的参数
env.windDirHor = 90;        %高空风向(自北顺时针方向) ,水平风模块内的参数
env.windOn = 0;             %是否存在风因素，即风因素标志位

uavParam = struct;
%% 飞行器几何结构参数
uavParam.geom = struct;
uavParam.geom.span = 0.6872;                  %翼展(m)，干风湍流模块内的参数
uavParam.geom.chord = 0.18574;   %弦长
uavParam.geom.S = 0.14573024;    %气动参考面积
% uavParam.geom.elarm = 1.21;   %平尾力臂
uavParam.geom.mass = 0.585;   %机身质量，标准飞机重量，原装飞机+电池
% uavParam.geom.mass = 1.145;   %机身质量，自行搭建飞机后的总质量
uavParam.geom.PropRadius = 0.0765;    %螺旋桨旋转半径
% 螺旋桨相对于重心的位置
uavParam.geom.RotorArm1 = [0.13,0.13,0];
uavParam.geom.RotorArm2 = [0.13,-0.13,0];
uavParam.geom.RotorArm3 = [-0.24,0,0];
uavParam.inertia = struct;
uavParam.inertia.Ixx = 0.005085;         %x主轴转动惯量，双线摆法测量
uavParam.inertia.Iyy = 0.004484;         %y主轴转动惯量，双线摆法测量
uavParam.inertia.Izz = 0.008371;         %z主轴转动惯量，双线摆法测量

%% 飞行器气动参数。通过CFD得出，用Matlab function在Simulink中表示了
uavParam.aero = struct; 
uavParam.aero.g = 9.806;
% uavParam.aero.CL0 = 0.38; %升力子系数CL0 - 常值项
% uavParam.aero.CLa = 18.5; %升力子系数CLa - 迎角系数； 注意：a表示alpha，即迎角（攻角）
% uavParam.aero.CLa_dot = 2.64; %升力子系数CLa_dot - 迎角导数系数，注意：a_dot表示迎角导数，即迎角变化率
% uavParam.aero.CLq = 7.4;%升力子系数CLq - 俯仰角速度系数； q表示俯仰角速度
% uavParam.aero.CLDe = 0.24;%升力子系数CLDe - 升降舵系数
% uavParam.aero.CLDf = 0.4; % %升力子系数CLDf - 襟翼Flap系数
% uavParam.aero.CD0 = 0.022; %阻力系数 - 常值项
% uavParam.aero.A1 = 0.007; %等效面积
% uavParam.aero.Apolar = 0.057;
% uavParam.aero.CYb = -1.098;  %侧力系数 - 侧滑角系数
% uavParam.aero.CYDr = 0.143; %侧力系数 - 方向舵系数
% uavParam.aero.Clb = -0.296; %滚转力矩系数 - 侧滑角系数
% uavParam.aero.Clp = -1.96; %滚转力矩系数 - 滚转角速度系数
% uavParam.aero.Clr = 0.103;  %滚转力矩系数 - 偏航角速度系数
% uavParam.aero.ClDa = 0.1695; %滚转力矩系数 - 副翼系数
% uavParam.aero.ClDr = 0.106; %滚转力矩系数 - 方向舵系数
% uavParam.aero.Cm0 = 0.3; %俯仰力矩系数
% uavParam.aero.Cma = -1.239; %滚转力矩系数 - 迎角系数
% uavParam.aero.Cma_dot = -7; %滚转力矩系数 - 迎角导数系数
% uavParam.aero.Cmq = -2.4; %滚转力矩系数 - 俯仰角速度系数
% uavParam.aero.CmDe = -3.2; %滚转力矩系数 - 升降舵系数 
% uavParam.aero.CmDf = -0.021; %滚转力矩系数 - 襟翼系数
% uavParam.aero.Cnb = 0.277;  %偏航力矩系数 - 侧滑角系数
% uavParam.aero.Cnp = -0.0889; %偏航力矩系数 - 滚转角速度系数
% uavParam.aero.Cnr = -0.19997; %偏航力矩系数 - 偏航角速度系数
% uavParam.aero.CnDa = -0.023; %偏航力矩系数 - 副翼系数
% uavParam.aero.CnDr = -0.1997; %偏航力矩系数 - 方向舵系数
%% 飞行器螺旋桨参数
uavParam.motor = struct;
uavParam.motor.minPWM = 0.1;
uavParam.motor.RPMMAX = 19741.896106;
uavParam.motor.CT = 9.588e-3;
uavParam.motor.CQ = 1.480e-3;

uavParam.engine = struct;
uavParam.engine.MinThK = 0; %引擎最小油门
uavParam.engine.ThK = 2.17; %引擎最大油门
uavParam.engine.TFact = 0.2; %引擎系数
uavParam.controlsurface.max = 90/180*pi; %操作面允许最大值
uavParam.elevator.max = 30/180*pi;       %升降舵最大值
uavParam.elevator.min = -30/180*pi;      %升降舵最小值
uavParam.aileron.max = 90/180*pi;        %副翼最大值
uavParam.aileron.min = -90/180*pi;       %副翼最小值
uavParam.rudder.max = 30/180*pi;         %方向舵最大值
uavParam.rudder.min = -30/180*pi;        %方向舵最小值
uavParam.flap.max = 30/180*pi;           %襟翼最大值
uavParam.flap.min = -30/180*pi;          %襟翼最小值
uavParam.throttlepercent.max = 1;        %油门最大值百分比
uavParam.throttlepercent.min = 0;        %油门最小值百分比

uavParam.sampleTime = 0.001; % 模型仿真步长

ap.apSampleTime = 0.01;     %带限噪声采样时间（s)，干风湍流模块内的参数

%% 地面模型
contact = struct;
contact.spring = 1.28931184836e+05;
contact.vd = 0.02;
contact.slidingFriction = 0.8;
contact.rollingFriction = 0.2;
contact.gLimit = 100;

