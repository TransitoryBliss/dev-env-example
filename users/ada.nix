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

      # Colours an interactive zsh writes to its terminal, so the palette is
      # part of this config instead of the terminal emulator's own settings.
      # "gruvbox-dark", "catppuccin-mocha", or left out to change nothing.
      home.devEnv.terminalPalette = "catppuccin-mocha";

      # Pi Session Manager: browse, search and resume agent sessions in a
      # browser, at http://psm.localhost:8090 (needs proxy.enable below).
      # home.devEnv.sessionManager.enable = true;
    };

    # Local reverse proxy for web UIs in the machine, one hostname each on
    # port 8090. `make vm/ssh` forwards that port.
    # proxy.enable = true;

    timeZone = "Europe/Stockholm";
  };
}
