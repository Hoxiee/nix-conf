{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa.drivers
      amdvlk
    ];
  };

  boot.initrd.kernelModules = [ "amdgpu" ];

  environment.sessionVariables = {
    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    AMD_VULKAN_ICD = "RADV";
  };
}
