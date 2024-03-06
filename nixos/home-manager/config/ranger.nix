{...}: {
  home.file = {
    ".config/ranger/rc.conf" = {
      text =
        /*
        bash
        */
        ''
          set preview_images_method kitty
          set preview_images true
        '';
    };
  };
}
