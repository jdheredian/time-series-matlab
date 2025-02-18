function [AIC,BIC] = findARMA2(variable,maxAR,maxMA)

AR=maxAR;
MA=maxMA;
LL=NaN(AR+2,MA+2);
NBetas=NaN(AR+2,MA+2);


for i=0:AR
LL(i+2,1)=i;
NBetas(i+2,1)=i;
    for j=0:MA   
LL(1,j+2)=j
NBetas(1,j+2)=j
Mdl = arima(i,0,j);
[EstMdl,~,Logl] = estimate(Mdl,variable);
param=i+j+1;
NBetas(i+2,j+2)=param;
LL(i+2,j+2)=Logl;
    end
end

NBetas(2,2)=1;
C=size(NBetas,2);
T=length(variable((~isnan(variable))))
AIK=[];
SIC=[];
for i=2:C
   [aic,BIC] = aicbic(LL(2:end,i),NBetas(2:end,i),T) 
   AIK(:,i-1)=aic
   SIC(:,i-1)=BIC
end




AIC = AIK;
BIC = SIC;
end

