function Session_summary_mouse = read_session_summary(para, mouseName)
    Session_summary_mouse = readtable(fullfile(para.rootDir, 'output_folder', para.versionCode, 'intermediate_variables', strcat('Session_summary_', mouseName)));
    Session_summary_mouse(Session_summary_mouse.numTrials<100,:)=[]; % remove sessions of fewer than 100 trials
    Session_summary_mouse(matches(string(Session_summary_mouse.Rule),'N/A'),:) = [];
end