# flake.nix

{
  description = "linux book";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
							rustc
							cargo 
            ];
						
						shellHook = ''
							export PATH=$PATH:$HOME/.cargo/bin
							cargo install mdbook
						'';
          };
    };
}

