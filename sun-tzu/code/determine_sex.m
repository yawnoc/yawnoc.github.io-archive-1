################################################################
# determine_sex.m
################################################################
# 孫子算經 Sun Tzu's Computational Classic
# Sex determination algorithm in Volume III Paragraph 36:
#   https://yawnoc.github.io/sun-tzu/iii/36
#   https://yawnoc.github.io/manuscripts/sun-tzu-iii-36.pdf
## Licensed under "MIT No Attribution" (MIT-0),
## see <https://spdx.org/licenses/MIT-0>.
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
  
  # 所餘，以
  #   天除一，
  #   地除二，
  #   人除三，
  #   四時除四，
  #   五行除五，
  #   六律除六，
  #   七星除七，
  #   八風除八，
  #   九州除九。
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
