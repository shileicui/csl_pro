# csl_pro
4000121321 SSWL

bcdedit /set hypervisorlaunchtype off    //Hyper-v 关闭
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
