function [yc, cl, cu] = checkConstraints(obj, x, output_file)
    % Check the violation of the constraints 
    
    phase = obj.Phase;
    phase_var_indices = obj.PhaseVarIndices;
    n_phase = length(phase);
    yc = cell(n_phase,1);
    cl = cell(n_phase,1);
    cu = cell(n_phase,1);
    permission = 'w';
    for i=1:n_phase
        if i > 1
            permission = 'a';
        end
        
        
        var = x(phase_var_indices(i,1):phase_var_indices(i,2));
        if nargin > 2
            [yc{i}, cl{i}, cu{i}] = checkConstraints(phase(i), var, output_file, permission);
        else
            [yc{i}, cl{i}, cu{i}] = checkConstraints(phase(i), var);
        end
        
        
    end

end