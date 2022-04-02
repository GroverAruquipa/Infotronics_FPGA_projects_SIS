%%% FIR coefficients (Finite response impulse)

% No causal
%% 1
fc=0.5;
fe=12.5;
b=fir1(4,fc/(fe/2),'low') %% n Wn ftype
%%
freqz(b) %% bODE PLOT  -6.086  0.4277
%% Changing


%%%
%%
b=0.0345
xv=1/0.0345 %% With n=5 bits
var2=0.0345*(2^6);
%%
bn=0;
n=8; %%% 8 bits
nf=n+1; %%% 9
k=1;
factor=2^nf;
while k<=16
    bn(k)=b(k)*(2^nf)
    bn(k)=round(bn(k))
    
    k=k+1;
end
k=1;
sum=0;
while k<=5
    sum=sum+b(k);
    k=k+1;
end
    sum
    
%%
%generetign sinusoideal signal
x = -8*pi:.02:8*pi; y = sin(x); plot(x,y)
format short g;
noiseAmplitude=0.5;
noisy_y = y + noiseAmplitude * rand(1, length(y));
noisy_y=noisy_y*10;
noisy_y=round(noisy_y);
figure()
plot(noisy_y)
nst=noisy_y';

%%
dlmwrite('input100.txt',nst)

%%
figure()
Output = importdata('output101_functional_sim.txt');
figure()
plot(Output)







