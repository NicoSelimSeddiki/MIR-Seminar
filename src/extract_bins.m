function interp_spec = extract_bins(LogP_absCQT, locs, FreqVec)
    % Allocate space for the new array
    interp_spec = zeros(size(LogP_absCQT));

    % Copy the highest peaks into the array
    interp_spec(locs) = LogP_absCQT(locs); 
    
    for i = 1:length(locs)
        kth_frq = locs(i);

        lower_indices = FreqVec > (FreqVec(kth_frq) - 60) & ...
            FreqVec < FreqVec(kth_frq);

        upper_indices =  FreqVec < (FreqVec(kth_frq) + 60) & ...
            FreqVec > FreqVec(kth_frq);

        interp_spec(lower_indices) = LogP_absCQT(lower_indices);
        interp_spec(upper_indices) = LogP_absCQT(upper_indices);
    end
end