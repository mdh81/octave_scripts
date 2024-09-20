function params = conversionParams()
    params = struct(
        'eyeMin', zeros(3,1), 'eyeMax', zeros(3,1), 'projection', eye(4),
        'windowWidth', 0, 'windowHeight', 0, 'viewportWidth', 0, 'viewportHeight', 0
        ); 
endfunction
