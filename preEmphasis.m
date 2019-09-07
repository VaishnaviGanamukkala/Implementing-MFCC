function [x] = preEmphasis(y) 
  x = filter([1 -.095], 1, y)
  end;