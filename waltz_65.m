function WALTZ_65 =waltz_65(J,omega1B,offset,hard_90)
j=J;
t=hard_90;
omega=omega1B;  %%%RF feild. If you make it extremely big eg. (2*pi/(4*0.000088*1000)) then check the Kateb equation script.

big_omega=offset;

omega_e=sqrt((big_omega)^2+(omega)^2);%%page 145
phi=acos(big_omega/omega_e);  %%page 145

theta=asin(j/omega_e);   %%%page 148
%t=0.000125;

%R= waltz(phi,3*t,j,omega,theta, big_omega)*waltz_inverted_phase(phi,2*t,j,omega,theta,big_omega)*waltz(phi,t,j,omega,theta, big_omega);


%WALTZ2= waltz(phi,3*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,2*t,j,omega,theta,big_omega)*waltz(phi,4*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,2*t,j,omega,theta,big_omega)*waltz(phi,t,j,omega,theta,big_omega);

Q=waltz_inverted_phase(phi,3*t,j,omega,theta,big_omega)*waltz(phi,2*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,4*t,j,omega,theta,big_omega)*waltz(phi,2*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,t,j,omega,theta,big_omega)*waltz(phi,3*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,2*t,j,omega,theta,big_omega)*waltz(phi,4*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,3*t,j,omega,theta,big_omega);

q=waltz(phi,3*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,2*t,j,omega,theta,big_omega)*waltz(phi,4*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,2*t,j,omega,theta,big_omega)*waltz(phi,t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,3*t,j,omega,theta,big_omega)*waltz(phi,2*t,j,omega,theta,big_omega)*waltz_inverted_phase(phi,4*t,j,omega,theta,big_omega)*waltz(phi,3*t,j,omega,theta,big_omega);
%WALTZ_16 = Q*q*q*Q ;
%WALTZ_17=waltz(phi,t,j,omega,theta,big_omega)*WALTZ_16;
%WALTZ_64=Q*q*q*Q*Q*Q*q*q*q*Q*Q*q*q*q*Q*Q;
WALTZ_65=waltz(phi,t,j,omega,theta,big_omega)*Q*q*q*Q*Q*Q*q*q*q*Q*Q*q*q*q*Q*Q;
end


