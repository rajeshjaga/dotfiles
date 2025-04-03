  108  tar xvf JetBrainsMono.tar.xz -C JetBrainsMonoNerdFonts
  109  ls
  110  curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Iosveka.tar.xz | grep download_url | xargs wget
  111  curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Iosveka
  112  curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Isoveka
  113  curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Ios
  114  curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Ioseveka.tar.xz | grep download_url | xargs wget && mkdir IsoevekaNerdFont && tar xvf Isoeveka.tar.xz -C IsoevekaNerdFont
  115  curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Iosevka.tar.xz | grep download_url | xargs wget && mkdir IsoevkaNerdFont && tar xvf Isoevka.tar.xz -C IsoevkaNerdFont
  116  sudo mkdir -p /usr/share/fonts/truetype/NerdFonts
  117  ls
  118  mkdir IsoevkaNerdFonts
  119  ls
  120  mv IsoevkaNerdFonts/ IosevkaNerdFonts/
  121  tar xvf Iosevka.tar.xz -C IosevkaNerdFonts/
  122  sudo mv {IosevkaNerdFonts,JetBrainsMonoNerdFonts} /usr/share/fonts/truetype/NerdFonts/
  123  ls
  124  histroy 10
  125  history 10
  126  history 20
  127  history 20 > makenerdfontscript.sh
