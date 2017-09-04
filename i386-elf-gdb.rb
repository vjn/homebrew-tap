class I386ElfGdb < Formula
  desc "GNU Debugger - i386-elf"
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftp.gnu.org/gnu/gdb/gdb-8.0.tar.xz"
  sha256 "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"

  keg_only :provided_by_macos # conflicts with platform gdb.

  depends_on "i386-elf-binutils"
  depends_on "i386-elf-gcc"

  def install
    system "./configure", "--target=i386-elf",
                          "--program-prefix=i386-elf-",
                          "--prefix=#{prefix}"

    system "make"

    # Don't install bfd or opcodes, as they are provided by binutils
    inreplace ["bfd/Makefile", "opcodes/Makefile"], /^install:/, "dontinstall:"

    system "make", "install"
  end

  test do
  end
end
