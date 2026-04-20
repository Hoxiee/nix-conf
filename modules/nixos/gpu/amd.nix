# AMD GPU configuration — Radeon 890M iGPU on laptop.
{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      rocmPackages.clr.icd
    ];
  };

  # amdgpu kernel module — loaded by default on modern kernels,
  # but explicit declaration ensures it is not accidentally excluded.
  boot.initrd.kernelModules = [ "amdgpu" ];

  environment.sessionVariables = {
    # Mesa Radeon Vulkan driver.
    AMD_VULKAN_ICD = "RADV";
  };
}
