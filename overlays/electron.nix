self:
let
  enableWayland = drv: bin: drv.overrideAttrs (
    old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ [self.makeWrapper ];
      postFixup = (old.postFixup or "") + ''
        wrapProgram $out/bin/${bin} \
          --add-flags "--enable-features=UseOzonePlatform" \
          --add-flags "--ozone-platfrom=wayland" \
          --add-flags "--use-gl=desktop"
        '';
      }
  );
in
  super: {
    discord = enableWayland super.discord "discord";
  }
