{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        Name = "boszko";
        Email = "brianboszko04@gmail.com";
      };
    };
  };
  home.packages = with pkgs; [
    gh
  ];
}
