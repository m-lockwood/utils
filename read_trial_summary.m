function Trial_summary_mouse = read_trial_summary(para, mouseName)
    opts = detectImportOptions(fullfile(para.rootDir, 'input_folder', strcat('Trial_summary_all_sessions_', mouseName)));
    opts = setvartype(opts,{'Correct','AbortTrial','Anti_Bias'},"logical");
    Trial_summary_mouse = readtable(fullfile(para.rootDir, 'input_folder', strcat('Trial_summary_all_sessions_', mouseName)), opts);
end