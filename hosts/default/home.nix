{ config, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

  home.username = "ysomad";
  home.homeDirectory = "/home/ysomad";

  home.stateVersion = "24.05";

  programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	initExtra = ''
		eval "$(zoxide init zsh)";
	'';

	shellAliases = {
		ls = "eza";
		la = "eza -la";
		cd = "z";
	};

	oh-my-zsh = {
		enable = true;
		theme = "robbyrussell";
	};
  };

  programs.git = {
	enable = true;
	userName = "Alex Malykh";
	userEmail = "49870662+ysomad@users.noreply.github.com";
  };

  programs.neovim = {
	enable = true;
	package = neovim-nightly;
	viAlias = true;
	vimAlias = true;
  };

  home.packages = with pkgs; [
	wget
	fzf

	tree
  	htop
	tmux
	eza # better ls
	zoxide # better cd

	alacritty

  	firefox
	telegram-desktop
	gimp
  ];

  home.file = {
  };

  home.sessionVariables = {
  	EDITOR = "nivm";
	BROWSER = "firefox";
	TERMINAL = "alacritty";
  };

  programs.home-manager.enable = true;
}
