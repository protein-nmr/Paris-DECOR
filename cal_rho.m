function rho=cal_rho(ncpmg,k)
global cpmg_length hard_90 J omega1A omega1B offset R

    LA=[0 -pi*J 0 0; pi*J k 0 -omega1A; 0 0 k offset; 0 omega1A -offset k];
    LB=waltz_65(J,omega1B,offset,hard_90);
    taucp=cpmg_length/(2*ncpmg);
    rho0=[1 0 0 0]';
    rhoA=( ( expm(-LA.*taucp)*R*expm(-LA.*taucp) ).^ncpmg )*rho0;
    rhoB=( ( expm(-LB.*taucp)*R*expm(-LB.*taucp) ).^ncpmg )*rho0;
    rho=rhoA/rhoB;
end
