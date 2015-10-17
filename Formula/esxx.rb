class Esxx < Formula
  desc "An easy-to-use, yet powerful, JavaScript Application Server written in Java."
  homepage "http://esxx.org/"
  url "https://github.com/LeviticusMB/esxx/archive/0.9.20151017.tar.gz"
  head "https://github.com/LeviticusMB/esxx.git"
  version "0.9.20151017"
  sha256 "64d145481a6c2f3a9ec909950623321fea051769590ecaf59a1f300671015c8d"

  depends_on "ant" => :build
  depends_on :java => "1.6"

  def install
    system "ant", "-verbose", "-Dskip-install-mac=1",
           "-Dprefix=#{prefix}", "-Dsysconfdir=#{etc}", "-Dlocalstatedir=#{var}", "-Dsharedstatedir=#{var}",
           "generate-build-files", "install"
  end

  test do
    (testpath/"test.js").write <<-EOS.undent
      #!/usr/bin/env esxx-js

      function main() {
        return 0;
      }
    EOS

    chmod 0755, testpath/"test.js"
    system testpath/"test.js"
  end
end
