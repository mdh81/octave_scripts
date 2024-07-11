function y = exponential(x)
    y = zeros(length(x),1);
    index = 1;
    for xval = x
        y(index)=pow2(2,xval);
        index += 1;
    endfor
endfunction
