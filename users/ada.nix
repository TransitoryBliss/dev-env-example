# Who you are. Shared by all your hosts; a host can add to or change it.
{
  devEnv = {
    user = {
      name = "ada";

      # Public keys allowed to SSH into VM hosts, e.g. your laptop's ~/.ssh/id_ed25519.pub.
      sshKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExampleKeyReplaceMeWithYourOwnPublicKey0000 ada@laptop"
      ];

      # Home-manager config. Git picks name, email and SSH key per repo:
      # the default everywhere, an override for repos under a given owner.
      home.devEnv.git = {
        default = {
          account = "ada-example";
          name = "Ada Example";
          email = "12345+ada-example@users.noreply.github.com";
        };
        # Work repos: a second GitHub account with its own key, ~/.ssh/id_ed25519_ada-acme.
        # Applies to any repo under github.com/acme-corp, however it was cloned.
        overrides."github.com/acme-corp" = {
          account = "ada-acme";
          name = "Ada Example";
          email = "ada@acme-corp.example";
        };
      };

      # One colour theme for the terminal, herdr, nvim and pi, instead of each
      # tool's own settings. The base's themes/palettes.json lists the names.
      # A host file can override it, and `background` recolours just that host.
      home.devEnv.theme.name = "catppuccin-mocha";

      # Pi Session Manager: browse, search and resume agent sessions in a
      # browser, at http://psm.localhost:8090 (needs proxy.enable below).
      # home.devEnv.sessionManager.enable = true;

      # Secrets as environment variables (API keys for agent tools), from a
      # sops-encrypted file committed here. See the README's "Secrets".
      # home.devEnv.secrets = {
      #   sopsFile = ../secrets.yaml;
      #   env.LINEAR_API_KEY = "linear_api_key";
      #   # A different key in repos under one org (like git.overrides).
      #   # scopes."github.com/acme-corp".env.LINEAR_API_KEY = "acme_corp_linear_api_key";
      # };

      # Hourly restic backup of agent sessions (pi, Claude Code); needs the
      # restic_* keys in secrets.yaml. See the README's "Backups".
      # home.devEnv.backup = {
      #   enable = true;
      #   excludeScopes = [ "github.com/acme-corp" ];  # never uploaded
      # };

      # MCP servers for pi: everywhere, and per org (like git.overrides).
      # `oauth = true` uses the callback port `make vm/ssh` forwards.
      # home.devEnv.mcp = {
      #   servers.context7.url = "https://mcp.context7.com/mcp";
      #   scopes."github.com/acme-corp" = {
      #     inheritGlobal = false;  # only acme-corp's servers in its repos
      #     servers.notion = { url = "https://mcp.notion.com/mcp"; oauth = true; };
      #   };
      # };
    };

    # Local reverse proxy for web UIs in the machine, one hostname each on
    # port 8090. `make vm/ssh` forwards that port.
    # proxy.enable = true;

    timeZone = "Europe/Stockholm";
  };
}
