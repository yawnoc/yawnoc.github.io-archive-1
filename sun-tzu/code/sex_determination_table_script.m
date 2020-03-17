years = 16 : 58;
months = 7 : 9;

num_years = length (years);
num_months = length (months);

table = zeros (1 + num_years, 1 + num_months);

table(1, :) = [NaN, months];
table(2 : end, 1) = years';

for n = 1 : num_years
  y = years(n);
  table(1 + n, 2 : end) = arrayfun (@(m) determine_sex(y, m), months);
endfor

csvwrite ("sex_determination_table.csv", table)
