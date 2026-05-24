{
  description = "Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    dagger = {
      url = "github:dagger/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    dagger,
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      default = pkgs.mkShell {
        packages = [
          dagger.packages.${system}.dagger
          pkgs.deno
          pkgs.git
          pkgs.nixfmt-rfc-style
        ];

        shellHook = ''
          export DENO_DIR="$PWD/.deno"
          echo "Dagger: $(dagger version | head -n 1)"
          echo "Deno: $(deno --version | head -n 1)"
        '';
      };
    });
  };
}
