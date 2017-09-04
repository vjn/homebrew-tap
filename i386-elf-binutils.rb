class I386ElfBinutils < Formula
  desc "FSF/GNU ld, ar, readelf, etc. for i386-elf development"
  homepage "https://gcc.gnu.org/"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.xz"
  sha256 "0b871e271c4c620444f8264f72143b4d224aa305306d85dd77ab8dce785b1e85"

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
