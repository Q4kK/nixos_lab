{
  services.samba = {
    enable = true;
    openFirewall = true;
    securityType = "user";
    # extraConfig = ''
    shares = {
      public = {
        path = "/share/public";
        "valid users" = "samba";
        public = "no";
        "writeable" = "yes";
        "force user" = "samba";
      };
    };
  };

  users.users = {
	  samba = {
		  isNormalUser = true;
		  description = "samba";
    };
  };


}
