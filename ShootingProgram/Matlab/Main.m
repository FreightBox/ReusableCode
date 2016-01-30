% Set up the functions for the

  % Production related
  % f     = A*k^alpha
  % df    = df/dk
  % dfinv = functional inverse of df
  A          = 1;
  alpha      = 0.3;
  fcns.f     = @(k) A*(k.^alpha);
  fcns.df    = @(k) A*alpha*(k.^(alpha-1));
  fcns.dfinv = @(y) (y/(A*alpha)).^(1/(alpha-1));

  % Preferences/utility related
  % u     = (c^(1-gamma))/(1-gamma)
  % du    = du/dc
  % duinv = functional inverse of du
  beta       = 0.96;
  gamma      = 0.999;
  fcns.u     = @(c) (c.^(1-gamma))/(1-gamma);
  fcns.du    = @(c) c.^(-gamma);
  fcns.duinv = @(v) v.^(-1/gamma);

  % Depreciation rate
  delta = 0.08;

  % Start capital path at lambda*kss
  lambda = 0.1;

  R = shootingProgram(fcns, beta, delta, lambda, 200);

