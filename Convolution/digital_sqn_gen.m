function [dig_sqn] = digital_sqn_gen(n, type_of_sqn, alpha, A, M, N)
% 1 impulse
% 2 unit step
% 3 exponential decay
% 4 discrete cos
% 5 sin
% 6 gate
% 7 sinc
% 8 double sided exponential decay
 
if(type_of_sqn==1)
    for ii=1:1:length(n)
        if(n(ii)==0)
            digital_sqn(ii)=1;
        else
            digital_sqn(ii)=0;
        end
    end
elseif(type_of_sqn==2)
    for ii=1:1:length(n)
        if(n(ii)>=0)
            digital_sqn(ii)=1;
        else
            digital_sqn(ii)=0;
        end
    end
elseif(type_of_sqn==3)
    for ii=1:1:length(n)
        if(n(ii)>=0)
            digital_sqn(ii)=alpha^n(ii);
        else
            digital_sqn(ii)=0;
        end
    end
elseif(type_of_sqn==4)
    for ii=1:1:length(n)
        digital_sqn(ii)=Amp*sin(2*pi*(M/N)*n(ii));
    end
elseif(type_of_sqn==5)
    for ii=1:1:length(n)
        digital_sqn(ii)=Amp*cos(2*pi*(M/N)*n(ii));
    end
elseif(type_of_sqn==6)
    for ii=1:1:length(n)
        if(n(ii)<-N)
            digital_sqn(ii)=0;
        elseif(n(ii)>N)
            digital_sqn(ii)=0;
        else
            digital_sqn(ii)=1;
        end
    end  
elseif(type_of_sqn==7)
    for ii=1:1:length(n)
        if(n(ii)==0)
            digital_sqn(ii)=1/(N);
        else
            digital_sqn(ii)=(1/(N))*( (sin(n(ii)*pi/N))/(n(ii)*pi/N));
        end
    end 
    
elseif(type_of_sqn==8)
    for ii=1:1:length(n)
        if(n(ii)<0)
            digital_sqn(ii)=alpha^(-n(ii));
        else
            digital_sqn(ii)=alpha^n(ii);
        end
    end 
elseif(type_of_sqn==9)
    for ii=1:1:length(n)
        if(n(ii)>0)
            digital_sqn(ii)=0;
        else
            digital_sqn(ii)=alpha^(n(ii));
        end
    end 
else
    digital_sqn=0;
end
end


