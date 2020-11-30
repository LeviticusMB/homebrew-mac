class Stream2gdrive < Formula
  desc "Transfer files to and from Google Drive."
  homepage "https://github.com/LeviticusMB/Stream2GDrive"
  url "https://github.com/LeviticusMB/Stream2GDrive/releases/download/1.3/Stream2GDrive-1.3-0-g230961a.zip"
  sha256 "60a89eb4d67fde0664cd6eb8d516abf0bbac26b9c994708835a16d688bb8b320"

  depends_on "openjdk@8"

  def install
    libexec.install "stream2gdrive.jar"
    bin.write_jar_script "#{libexec}/stream2gdrive.jar", "stream2gdrive"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test Stream2GDrive`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
