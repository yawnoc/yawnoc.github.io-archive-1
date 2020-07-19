##  ----------------------------------------------------------------
##  sun_info = sun (delta_spec, y_big_pd)
##  ----------------------------------------------------------------
##  Displays and returns quantities for the sun (daytime, noon altitude etc.)
##  using the model given at:
##    https://yawnoc.github.io/math/daytime
##  Input:
##    delta_spec is the specification for the latitude north of the equator,
##                      delta, either a scalar (delta / degree),
##                      a list [delta_deg, delta_min]
##                      or one of the strings listed below
##    y_big_pd   is the year angle Y per degree, i.e. Y / degree
##  Alternatively, call sun (delta_spec, t_days, "day"):
##    t_days     is the number of days which has passed since the northern
##               spring (or March) equinox
##  Output:
##    sun_info   is the structure of quantities for the sun
##  Note that Y == 2 pi t / yr, where t is the time which has passed since the
##  northern spring (or March) equinox, and yr == 365.242 day is a solar year.
##  Possible strings for delta_spec are:
##    "station-nord"
##    "reykjavik"
##    "london"
##    "hong-kong"
##    "singapore"
##    "perth"
##    "enderby-land"
##    "concordia-station"
##  ----------------------------------------------------------------
##  Licensed under "MIT No Attribution" (MIT-0),
##  see <https://spdx.org/licenses/MIT-0>.
##  ----------------------------------------------------------------

function sun_info = sun (delta_spec, varargin)
  
  ## Parse specification for delta
  if (isscalar (delta_spec))
    delta_pd = delta_spec;
    [delta_deg, delta_min] = num2cell (to_base_60 (delta_pd)){:};
  else
    if (ischar (delta_spec))
      delta_info = struct (
        "station-nord", [81, 36],
        "reykjavik", [64, 9],
        "london", [51, 30],
        "hong-kong", [22, 19],
        "singapore", [1, 17],
        "perth", -[31, 57],
        "enderby-land", -[67, 30],
        "concordia-station", -[75, 6]
      );
      [delta_deg, delta_min] = num2cell (delta_info.(delta_spec)){:};
    else
      [delta_deg, delta_min] = num2cell (delta_spec){:};
    endif
    delta_pd = delta_deg + delta_min / 60;
  endif
  
  ## Parse specification for y_big
  if (numel (varargin) < 2)
    y_big_pd = varargin{1};
  elseif (strcmp (varargin{2}, "day"))
    t_days   = varargin{1};
    y_big_pd = 360 * t_days / 365.242;
  else
    error ("Invalid specification for year angle.");
  endif
  y_big_pd = mod (y_big_pd, 360);
  
  ## Axial tilt
  tau_pd = 23 + 26 / 60;
  
  ## Refraction angle (for sunrise and sunset)
  alpha_ref_pd = 50 / 60;
  
  ## Tilt-reduced quantities
  comp_x = cosd (y_big_pd);
  comp_y = cosd (tau_pd) * sind (y_big_pd);
  rho = norm ([comp_x, comp_y]);
  phi_pd = atan2d (comp_y, comp_x);
  
  ## Argument to arcsine, i.e. tan(tau) tan(delta) sin(phi)
  arg_asin = tand (tau_pd) * tand (delta_pd) * sind (phi_pd);
  
  ## Daytime
  t_big_ph = 12 + 24 / pi * asin (arg_asin);
  t_big_ph = real (t_big_ph);
  t_big_hr_min = to_base_60 (t_big_ph);
  
  ## Sunrise and sunset bearings
  comp_s = -tand (tau_pd) * secd (delta_pd) * sind (phi_pd);
  comp_e_rise = sqrt (1 - arg_asin^2);
  comp_e_set = -sqrt (1 - arg_asin^2);
  if (abs (arg_asin) <= 1)
    beta_rise_pd = atan2d (comp_e_rise, -comp_s);
    beta_set_pd = 360 + atan2d (comp_e_set, -comp_s);
  else
    beta_rise_pd = NaN;
    beta_set_pd  = NaN;
  endif
  
  ## Noon altitude
  comp_u = cosd (delta_pd) + tand (tau_pd) * sind (delta_pd) * sind (phi_pd);
  comp_s = sind (delta_pd) - tand (tau_pd) * cosd (delta_pd) * sind (phi_pd);
  alpha_noon_pd = atan2d (comp_u, abs (comp_s));
  
  ## Daytime correction due to refraction
  eps_set = (
    tand (alpha_ref_pd) / cosd (delta_pd)
    * sqrt (1 + tand (tau_pd)^2 * sind (phi_pd)^2) / sqrt (1 - arg_asin^2)
  );
  eps_rise = -eps_set;
  t_big_ph_corn = 24 / pi * eps_set;
  t_big_ph_corn = real (t_big_ph_corn);
  t_big_hr_min_corn = to_base_60 (t_big_ph_corn);
  t_big_hr_min_cord = to_base_60 (t_big_ph + t_big_ph_corn);
  
  ## Sunrise and sunset bearings correction due to refraction
  d_minus_phi_set = pi / 2 + asin (arg_asin);
  d_minus_phi_rise = -d_minus_phi_set;
  comp_s_rise = (
    sind (delta_pd) * cos (d_minus_phi_rise + eps_rise)
    - tand (tau_pd) * cosd (delta_pd) * sind (phi_pd)
  );
  comp_s_set = (
    sind (delta_pd) * cos (d_minus_phi_set + eps_set)
    - tand (tau_pd) * cosd (delta_pd) * sind (phi_pd)
  );
  comp_e_rise = -sin (d_minus_phi_rise + eps_rise);
  comp_e_set = -sin (d_minus_phi_set + eps_set);
  if (abs (arg_asin) <= 1)
    beta_rise_pd_cord = atan2d (comp_e_rise, -comp_s_rise);
    beta_set_pd_cord = 360 + atan2d (comp_e_set, -comp_s_set);
  else
    beta_rise_pd_cord = NaN;
    beta_set_pd_cord  = NaN;
  endif
  
  ## Display quantities
  horizontal_line = (
    "----------------------------------------------------------------\n"
  );
  if (ischar (delta_spec))
    delta_str = [...
      horizontal_line, ...
      delta_spec, "\n"
    ];
  else
    delta_str = "";
  endif
  if (arg_asin < -1)
    arg_asin_str = " (polar night)";
  elseif (arg_asin > 1)
    arg_asin_str = " (midnight sun)";
  else
    arg_asin_str = "";
  endif
  str = [...
    delta_str, ...
    horizontal_line, ...
    "Latitude (delta)                  : " ...
      num2str(delta_deg), " deg ", ...
      num2str(abs(delta_min)), " min", "\n", ...
    horizontal_line, ...
    "Year angle (Y)                    : ", ...
      sprintf("%5.2f", y_big_pd), " deg", "\n", ...
    "Tilt-corrected unit radius (rho)  : ", ...
      num2str(rho), "\n", ...
    "Tilt-corrected year angle (varphi): ", ...
      sprintf("%5.2f", phi_pd), " deg", "\n", ...
    horizontal_line, ...
    "Argument to arcsine               : ", ...
      num2str(arg_asin), arg_asin_str, "\n", ...
    horizontal_line, ...
    "Daytime                           : ", ...
      sprintf("%2d", t_big_hr_min(1)), " hr ", ...
      sprintf("%2d", t_big_hr_min(2)), " min", "\n", ...
    " > correction                     : ", ...
      sprintf("%2d", t_big_hr_min_corn(1)), " hr ", ...
      sprintf("%2d", t_big_hr_min_corn(2)), " min", "\n", ...
    " > corrected                      : ", ...
      sprintf("%2d", t_big_hr_min_cord(1)), " hr ", ...
      sprintf("%2d", t_big_hr_min_cord(2)), " min", "\n", ...
    horizontal_line, ...
    "Noon altitude (alpha)             : ", ...
      sprintf("%5.1f", alpha_noon_pd), " deg", "\n", ...
    horizontal_line, ...
    "Sunrise and sunset bearings (beta): ", ...
      sprintf("%5.1f", beta_rise_pd), " deg", " and ", ...
      sprintf("%5.1f", beta_set_pd), " deg", "\n", ...
    " > corrected                      : ", ...
      sprintf("%5.1f", beta_rise_pd_cord), " deg", " and ", ...
      sprintf("%5.1f", beta_set_pd_cord), " deg", "\n", ...
    horizontal_line
  ];
  disp (str);
  
  ## Return structure
  sun_info = struct (
    "rho", rho,
    "phi_pd", phi_pd,
    "arg_asin", arg_asin,
    "t_big_hr_min", t_big_hr_min,
    "beta_rise_pd", beta_rise_pd,
    "beta_set_pd", beta_set_pd,
    "alpha_noon_pd", alpha_noon_pd,
    "t_big_hr_min_corn", t_big_hr_min_corn,
    "t_big_hr_min_cord", t_big_hr_min_cord,
    "beta_rise_pd_cord", beta_rise_pd_cord,
    "beta_set_pd_cord", beta_set_pd_cord
  );
  
endfunction

## Subfunction for conversion to base 60 (e.g. _ph to [_hr, _min], where
## _ph, _hr, _min mean "per hour", "hours", "minutes").

function q_hr_min = to_base_60 (q_ph)
  
  q_hr = fix (q_ph);
  q_min = round ((q_ph - q_hr) * 60);
  q_hr_min = [q_hr, q_min];
  
endfunction
