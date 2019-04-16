function R = waltz(phi,t,j,omega,theta,big_omega)
R_phi= [1 0 0 0; 0 cos(phi) 0 -sin(phi); 0 0 1 0; 0 sin(phi) 0 cos(phi) ];
phi=-1*phi;
R_minus_phi=[1 0 0 0; 0 cos(phi) 0 -sin(phi); 0 0 1 0; 0 sin(phi) 0 cos(phi) ];

R_theta= [cos(theta/2) 0 -sin(theta/2) 0 ; 0 1 0 0 ; sin(theta/2) 0 cos(theta/2) 0; 0 0 0 1 ];
theta= -1*theta;
R_minus_theta= [cos(theta/2) 0 -sin(theta/2) 0 ; 0 1 0 0 ; sin(theta/2) 0 cos(theta/2) 0; 0 0 0 1 ];

D_plus= sqrt((omega^2) + (big_omega + (j/2))^2);
D_minus= sqrt((omega^2) + (big_omega - (j/2))^2);

omega_2 = 0.5*(D_plus+D_minus);
J_2 = (D_plus-D_minus);

R_omega=[1 0 0 0; 0 cos(omega_2*t) sin(omega_2*t) 0; 0 -sin(omega_2*t) cos(omega_2*t) 0; 0 0 0 1];
R_J=[cos(0.5*J_2*t) 0 0 -sin(0.5*J_2*t); 0 1 0 0; 0 0 1 0; sin(0.5*J_2*t) 0 0 cos(0.5*J_2*t)];
R2= (R_phi*R_theta);
R3= (R_omega*R_J);
R4= (R_minus_phi*R_minus_theta);
R=R4*R3*R2;
