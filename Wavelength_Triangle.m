clc;

% (A1) Place the Reflective Grating at (alpha) facing SIDE A  (Estimate)
%    Initially, the objective is to maximize (orthogonal) distance between
%    SIDE A and (alpha). B1) The grating will be rotated during alignment.
% (A2) The laser and its beam will define SIDE B; Output goes towards (alpha)
%    Estimate this. B2) Will rotate the laser slightly so the incident and
%    refracted beams are parallel (angle of incident and refracted are the
%    same with respect to the surface normal of the refraction grating.
% (B1) Rotate the grating so that the left most (as drawn) beam is parallel
% to the incident laser beam. Adjust so that the length of SIDE A is measurable.
% The left most beam corresponds to the n=1 refracted beam. The right most beam
% corresponds to the n=0 (principle) refracted beam.
% (B2) Rotate the laser to improve alignment of the incident and n=1 beams.
% (C1) Measure ALL three side lengths. Center-to-center length is suggested.
%     Measured at 405 nm and 532 nm, side lengths > 100 cm measured to the
%     nearest mm were found to be accurate to +/- 5 nm of expected values when
%     used in conjunction with a 2400 line / mm Holographic grating.
% (C2) Calculate.
%     Angle (alpha) is found using the law of cosines.
%     N is specified for the diffraction grating.
%     The system behaves similarly to the Littrow Configuration
%     https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=25
% 
%                           SIDE A
% (beta) -------------------------------------------------------(gamma)
%     \                                                   ___/--^
%    > \ <                                         ___/--^
%     \ \ \                                 ___/--^
%      \ \ \ <--- Laser               ___/--^ SIDE C
% SIDE B\ \ \                  ___/--^
%        > \ <         ___/--^
%           \   ___/--^
%         (alpha)

% Diffraction Grating
N = 2400; % Lines per mm
a = (1E-3)/N; % 1/m

% Side Lengths
% Actual measurements of laser pointers in units of inches (American tape measure)
A = [ones(1,6).*(71 + 1/2) + [-5/16 -1/8 -1/16 1/16 1/8 5/16], (53 + 7/8)];
B = [ones(1,6).*(50 + 7/8), (43 + 5/8)];
C = [ones(1,6).*(60 + 7/8), (61 + 3/8)];

% Simple Math
alpha = acos((B.^2 + C.^2 - A.^2)./(2.*B.*C));
lambda = (2*a).*sin(alpha./2).*(1E9); % Wavelength in [nm]

% Reporting
fprintf('Lambda = %0.1f nm\n',lambda);