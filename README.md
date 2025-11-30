# Nixos KICKSTART! ZFS xxx DENDRITIC xxx HJEM

## Currently only tested on hardware, still working on getting VM to work. 

## This is the starter template I wish I had when I started.

NixOS is a rabbithole, and the trajectory of a config often has multiple stages, usually entailing several rewrites. When you start out, you might not know about flakes, so you change everything to use flakes. Great, now you continue working on your config and realize you should be using home manager, only to realize later you could have just started with a copy on write system like zfs or btrfs so now you need to do a complete wipe of your drive. That's fine you're on nixOS, which is purely declarative, except for the fact you forgot you're not using hjem of course, which is the new hotness in home management, so time for another rewrite. 

![alt text](https://i.gifer.com/origin/9d/9da899727685032aad16f0528782dd0c_w200.gif)

This is really just an attempt to communicate to the past me so I didn't waste so much time getting to this point...

Here! Here is what I wish I had. A simple(tm) skeletal config, easy to install, setup with the bare minimum tooling for a working nixOS config, with all the correct stuff already baked in, but not so much random shit that will overwhelm you when you're starting out. 

## WHAT THIS IS NOT
This is not ZaneyOS, i'm not going to give you a fancy riced up system, this is not about that in the slightest. This is for a person like me who is eager to learn nix, but wants to skip all the difficult lessons of doing things *the wrong way* (opinion). This literally is a bare-bones dendritic config with the minimum viable nixos system included so you can get started actually making it your own. The kickstart config itself is "minimal DNA" as in it's meant to truly be vanilla. I did my best to include as few options are possible.

You download the ISO (iso coming soon i still need to upload that).

You can either just run `kickstart install` and you'll get the default hostname, username, config directory, and all the code i have for whatever that produces. ( it's just a basic 10 line xfce nix module, btw ).

ORRR you can be fancy and run `kickstart edit` and that'll pull down **this** repo so you can really make it your own before you even install it. Edit the config, change the host, do it all, and then when you're done, running kickstart install will instead use that local repo you edited, Just make sure to run it in your home directory.

### Make your own ISO!!
Don't want to wait on me to get my act together and provide you an iso from this page? If you have nix installed you should be able to just clone this repo, cd into it, run `nix build .#iso` and boom. Your iso is in `results/iso/somelongwork.nix`. Hell, before you do that you can just make the iso whatever you want as well, but IMO all you really need is tmux vim network manager and git for the install process, it's just two commands.

### Important stuff
* kickstart install with no edit before hand will pull down this repo, which will install against a `grub` firmware. In the future i'll work on a smoother way to do this without having to pull down and edit, but until then you simply need to swap grub for uefi in the host-config.nix (`flake.modules.nixos.kickster` if you're not doing anything else)
* kernel.nix has catchall for firmware support, you will probably want to slim down your kernel modules once you've gotten more acquainted with *your* config, meaning you'll need to figure out what you need for your specific hardware. 

### Justifications for choices
This is an opinionated template, but if you're starting out you probably do not know why I have these opinions, so briefly: 
* Hjem, not home manager
  * home manager is a terrific system for home management, and it **does** let you get started quicker than hjem, more modules are available that *just work*, **however** as you continue to use home manager you might feel that the abstractions mystify your system more than you're comfortable with. Or perhaps you're already an expert in linux and you have a ton of existing tooling you already know how to configure in a conventional manner. Hjem is a svelte file linker that will make that happen, without bringing in a ton of options you won't use.
* Zfs, not Btrfs. It really is a coinflip on whichever one i'd pick, but generally zfs is simpler to work with vs btrfs subvolumes, it also helps that the original Iynaix script exists for reference. I also use this in my main config and have had no issues. 
* Dendritic. Hopefully this won't be too much of a wall when you're starting out. I hope there is enough examples in the template of how to make your own config, but in my opinion this vastly simplifies a config as you only need to worry about making modules and importing those modules, and given everything is within your flakes module directory it will just be there. No having to deal with directory paths. It's working with purely namespaces that you create. I will make an effort to explain more of this later, or at least link Vics guide. 

# Credits
* [Iynaix](https://github.com/iynaix/dotfiles/blob/main/install.sh)
  * kickstart.sh is more or less iynaix's os install script with a stateful wrapper around it. Their config is also an excellent reference so I encourage newcomers to look at it.
