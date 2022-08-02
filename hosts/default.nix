{ self, ... } @ inputs:

{
  igg = self.lib.mkSystem {
    hostname = "igg";
    system = "x86_64-linux";
    home-manager = true;
  };
}
