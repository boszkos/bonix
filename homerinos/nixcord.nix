{inputs, ...}: {
  programs.nixcord = {
    enable = true; # enable Nixcord. Also installs discord package
    vesktop.enable = true;
    discord = {
      enable = true;
      vencord.enable = true;
    };
    config = {
      # frameless = true; # set some Vencord options
      plugins = {
        fakeNitro.enable = true;
        volumeBooster.enable = true;
        youtubeAdblock.enable = true;
        clearUrls.enable = true;
      };
    };
  };
}
