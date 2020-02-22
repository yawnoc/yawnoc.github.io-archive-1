################################################################
# sun_tzu_pregnant.m
################################################################
# 孫子算經 Sun Tzu's Computational Classic
# Sex determination algorithm in Volume III Paragraph 36:
#   https://yawnoc.github.io/sun-tzu/iii.html#36
#   https://yawnoc.github.io/manuscripts/sun-tzu-iii-36.pdf
# Released into the public domain (CC0):
#   https://creativecommons.org/publicdomain/zero/1.0/
# ABSOLUTELY NO WARRANTY, i.e. "GOD SAVE YOU"
################################################################

function male = determine_sex (years, months)
  
  # 今有孕婦行年二十九，難九月。未知所生？
  # Now there be {a} pregnant woman, {her} years twenty-nine,
  # {with} nine months of difficulty.
  # Know {we} not yet that which {she shall} bear?
  
  # 答曰：生男。
  # Answer saith: {she shall} bear {a} male.
  
  # 術曰：置四十九，加難月，減行年。
  # Method saith: put {down} forty-nine.
  # Add {the} months of difficulty, {and} subtract {her} years.
  
  remainder = 49 + months - years;
  if (remainder < 0)
    male = NaN;
    return
  endif
  
  # 所餘，以天除一，地除二，人除三，四時除四，五行除五，六律除六，七星除七，八風除八，九州除九。
  # {Of} that which remaineth,
  # {for} Heaven remove one,
  # {for} Earth remove two,
  # {for} Man remove three,
  # {for the} Four Seasons remove four,
  # {for the} Five Elements remove five,
  # {for the} Six Pitches remove six,
  # {for the} Seven Stars remove seven,
  # {for the} Eight Winds remove eight,
  # {and for the} Nine Provinces remove nine.
  
  for n = 1 : 9
    
    new_remainder = remainder - n;
    
    if (new_remainder < 0)
      break;
    else
      remainder = new_remainder;
    endif
    
  endfor
  
  # 其不盡者，奇則為男，耦則為女。
  # {Of} its remainder: odd be male, {and} even be female.
  
  male = mod (remainder, 2);
  
endfunction


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

csvwrite ("sun-tzu-pregnant.csv", table)
