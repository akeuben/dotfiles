{ ... }: {
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "Avery Keuben";
                email = "avery1516@gmail.com";
            };
            diff.tool = "vimdiff";
            push.autoSetupRemote = "true";
            init.defaultBranch = "main";
            commit.gpgsign = "true";
            alias = {
                authors = "!git --no-pager log | grep Author | cut -f 2- -d ' ' | awk '{ sub(\" [^ ]*$\", \"\"); print }' | sort | uniq -c";
            };
        };
    };
}
