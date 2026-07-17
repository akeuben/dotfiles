{
    den.aspects.git = {
        provides.to-users.homeManager = {user, lib, ...}: {
            programs.git = {
                enable = true;
                settings = lib.mkIf (user.realName != null && user.email != null) {
                    user.name = user.realName;
                    user.email = user.email;
                    push.autoSetupRemote = "true";
                    init.defaultBranch = "main";
                    commit.gpgsign = "true";
                    alias = {
                        authors = "!git --no-pager log | grep Author | cut -f 2- -d ' ' | awk '{ sub(\" [^ ]*$\", \"\"); print }' | sort | uniq -c";
                    };
                };
            };
        };
    };
}
