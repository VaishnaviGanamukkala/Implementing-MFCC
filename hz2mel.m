function [y] = hz2mel(x)
  y = 2959 .* log10((1 + x / 700));
end;