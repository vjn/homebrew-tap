class I386ElfGcc < Formula
  desc "GNU compiler collection - i386-elf"
  homepage "https://gcc.gnu.org/"
  url "https://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz"
  sha256 "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"

  depends_on "i386-elf-binutils"

  def install
    binutils = Formulary.factory "i386-elf-binutils"
    ENV["PATH"] += ":#{binutils.prefix/"bin"}"

    system "./configure", "--target=i386-elf",
                          "--program-prefix=i386-elf-",
                          "--enable-languages=c,c++",
                          "--with-arch-32=i686",
                          "--with-as=#{HOMEBREW_PREFIX}/bin/i386-elf-as",
                          "--with-ld=#{HOMEBREW_PREFIX}/bin/i386-elf-ld",
                          "--prefix=#{prefix}"

    system "make", "all-gcc"
    system "make", "install-gcc"
  end

  test do
  end
end
