function sse = sseval(x,test,ncpmg,U)
global hard_90 J omega1A omega1B offset 

 k=x(1);
 LA=[0 -pi*J 0 0; pi*J k 0 -omega1A; 0 0 k offset; 0 omega1A -offset k];
 LB=waltz_65(J,omega1B,offset,hard_90);
   for kidx = 1 : length(ncpmg);
     n=cal_rho(ncpmg(kidx),k) ;
     x4(kidx)=n(1);
 end

 
sse= (sum(((x4-test)./U).^2))/(length(test)-1);

