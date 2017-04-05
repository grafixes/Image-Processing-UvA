function boolean = inImage(s,row, col)
    boolean = (row <= s(1)) && (col <= s(2)) && (row > 0) && (col > 0);
end