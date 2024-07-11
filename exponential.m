function y = exponential(x)
    y = zeros(length(x),1);
    index = 1;
    for xval = x
        y(index)=1-(0.2^xval);
        index += 1;
    endfor
    y=normalize(y, 'range');
endfunction
