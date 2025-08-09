{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "boszko";
    userEmail = "brianboszko04@gmail.com";
  };
  home.packages = with pkgs; [
    gh
  ];
}
