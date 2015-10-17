class Esxx < Formula
  desc "An easy-to-use, yet powerful, JavaScript Application Server written in Java."
  homepage "http://esxx.org/"
  url "https://github.com/LeviticusMB/esxx/archive/0.9.20151017.tar.gz"
  version "0.9.20151017"
  sha256 "64d145481a6c2f3a9ec909950623321fea051769590ecaf59a1f300671015c8d"
  head "https://github.com/LeviticusMB/esxx.git"
  revision 1

  depends_on "ant" => :build
  depends_on :java => "1.6"

  def install
    system "ant", "-verbose", "-Dskip-install-mac=1",
           "-Dprefix=#{prefix}", "-Dsysconfdir=#{etc}", "-Dlocalstatedir=#{var}", "-Dsharedstatedir=#{var}",
           "generate-build-files", "install"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>

        <key>ProgramArguments</key>
        <array>
         <string>#{bin}/esxx</string>
           <string>--http</string>
           <string>7777</string>
        </array>

        <key>KeepAlive</key>
        <true/>

        <key>WorkingDirectory</key>
        <string>/usr/local/share/doc/esxx/examples/</string>
      </dict>
    </plist>
    EOS
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
