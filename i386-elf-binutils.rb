class I386ElfBinutils < Formula
  desc "FSF/GNU ld, ar, readelf, etc. for i386-elf development"
  homepage "https://gcc.gnu.org/"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.gz"
  sha256 "172e8c89472cf52712fd23a9f14e9bca6182727fb45b0f8f482652a83d5a11b4"

  def install
    system "./configure", "--target=i386-elf",
                          "--program-prefix=i386-elf-",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--enable-gold=yes"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "main", shell_output("#{bin}/i386-elf-nm #{bin}/i386-elf-nm")
  end
end
