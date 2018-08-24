%% Problem 13.1-4
% Derive Eq. (13.1-18) for steady-state conduction of heat in a hollow
% sphere. Also, derive an equation that shows temperature varies 
% hyperbolically with radius _r_. 
%
% Starting with Fourier's law, $$ \frac{q}{A} = -k \frac{dT}{dr} $$
%
% Sphere area: $$ A = 4 \pi r^2 $$
% 	
% Substitute for area, $$ \frac{q}{4 \pi r^2} = -k \frac{dT}{dr} $$
% 	
% Rearrange and integrate both sides,
%
% $$ \frac{q}{4\pi} \int_{r_1}^{r_2} r^{-2}dr = -\int_{T_1}^{T_2} k dT $$
%
% $$ \frac{q}{4\pi} \left( -\frac{1}{r_2} - (-\frac{1}{r_1}) \right) = -k(T_2 - T_1) $$
%
% $$ \frac{q}{4\pi}\ \left(\frac{1}{r_1} - \frac{1}{r_2}\right) = k(T_1 - T_2) $$
%
% $$ q = \frac{4 \pi k (T_1 - T_2)}{(\frac{1}{r_1} - \frac{1}{r_2})} $$
%
% $$ q = \frac{(T_1 - T_2)}{(\frac{1}{r_1} - \frac{1}{r_2}) / 4 \pi k} $$ 
%
%%
%
% Derive an equation showing that temperature varies hyperbolically with _r_,
%
% Derive an equation showing that temperature varies hyperbolically with _r_:
% Begin with Fourier's law again, $$ \frac{q}{A} = -k \frac{dT}{dr} $$
%
% Rearrange, $$ \frac{dT}{dr} = -\frac{q}{kA} $$
%
% Substitute values for _A_ and _q_ from previous steps,
%
% $$  \frac{dT}{dr} = -\frac{(T_2-T_1) 4 \pi k}{(\frac{1}{r_1} - \frac{1}{r_2}) 4 \pi r^2 k} $$
%
% Simplify, 
%
% $$ dT = \frac{T_1-T_2}{(\frac{1}{r_1} - \frac{1}{r_2}) r^2} dr $$	
%
% Integrate both sides,
%
% $$ \int_{T_1}^{T} dT = \frac{T_1-T_2}{(\frac{1}{r_1} - \frac{1}{r_2})} \int_{r_1}^r r^{-2}dr $$
%
% $$ T - T_1 =  \frac{T_1-T_2}{(\frac{1}{r_1} - \frac{1}{r_2})} \left(\frac{1}{r_1}-\frac{1}{r}\right) $$	
%
% $$ \frac{T-T_1}{T_2-T_1} = \frac{1}{\frac{1}{r_1}-\frac{1}{r_2}} \left(\frac{1}{r_1}-\frac{1}{r}\right)$$